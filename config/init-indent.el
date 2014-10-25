;; Use spaces not tabs
(setq-default indent-tabs-mode nil)

;; Default indent width 4 chars
(defvar my-default-tab-width 4)

(setq tab-width my-default-tab-width)
(setq-default tab-width my-default-tab-width)
(setq tab-stop-list (number-sequence 4 120 my-default-tab-width))

;; http://www.emacswiki.org/emacs/BackspaceWhitespaceToTabStop
;; (defvar my-offset 4 "My indentation offset. ")
(defun backspace-whitespace-to-tab-stop ()
  "Delete whitespace backwards to the next tab-stop, otherwise delete one character."
  (interactive)
  (if (or indent-tabs-mode
          (region-active-p)
          (save-excursion
            (> (point) (progn (back-to-indentation)
                              (point)))))
      (call-interactively 'backward-delete-char-untabify)
    (let ((movement (% (current-column) my-default-tab-width))
          (p (point)))
      (when (= movement 0) (setq movement my-default-tab-width))
      ;; Account for edge case near beginning of buffer
      (setq movement (min (- p 1) movement))
      (save-match-data
        (if (string-match "[^\t ]*\\([\t ]+\\)$" (buffer-substring-no-properties (- p movement) p))
            (backward-delete-char (- (match-end 1) (match-beginning 1)))
          (call-interactively 'backward-delete-char))))))

;; Backspace deletes whitespace to the next tab stop
(global-set-key [backspace] 'backspace-whitespace-to-tab-stop)

; Stop doing crazy indent shit
;; Global
;; (global-set-key (kbd "TAB") 'tab-to-tab-stop)
;; Per Mode
;; (define-key text-mode-map (kbd "TAB") 'tab-to-tab-stop)

(provide 'init-indent)
