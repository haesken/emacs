(require 'python)

; indentation
(defadvice python-calculate-indentation (around outdent-closing-brackets)
  "Handle lines beginning with a closing bracket and indent them so that
  they line up with the line containing the corresponding opening bracket."
(save-excursion
  (beginning-of-line)
  (let ((syntax (syntax-ppss)))
    (if (and (not (eq 'string (syntax-ppss-context syntax)))
             (python-continuation-line-p)
             (cadr syntax)
             (skip-syntax-forward "-")
             (looking-at "\\s)"))
        (progn
          (forward-char 1)
          (ignore-errors (backward-sexp))
          (setq ad-return-value (current-indentation)))
      ad-do-it))))

(ad-activate 'python-calculate-indentation)

;; http://stackoverflow.com/questions/8823924/in-emacs-python-mode-how-do-i-set-a-different-auto-fill-width-for-docstrings-an/30340262#30340262
(defun my-python-fill-string (&optional justify)
  (let ((old-fill-column fill-column))
    (setq fill-column 72)
    (python-fill-string justify)
    (setq fill-column old-fill-column)))

(add-hook 'python-mode-hook
          (lambda ()
            (setq fill-column 80)
            (setq python-fill-docstring-style 'django)
            (setq python-fill-string-function my-python-fill-string)
            (auto-fill-mode t)))

(provide 'init-python)
