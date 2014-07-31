;; System copy/paste
;; Requires xsel packag
(defun copy-selection-to-clipboard ()
    (interactive)
    (if (display-graphic-p)
            (progn
                (message "Yanked region to x-clipboard!")
                (call-interactively 'clipboard-kill-ring-save))
            (if (region-active-p)
                (progn
                (shell-command-on-region (region-beginning) (region-end) "xsel -i -b")
                (message "Yanked region to clipboard!")
                (deactivate-mark))
            (message "No region active; can't yank to clipboard!"))))

(defun paste-from-clipboard ()
    (interactive)
    (if (display-graphic-p)
            (progn
                (clipboard-yank)
                (message "graphics active"))
            (insert (shell-command-to-string "xsel -o -b"))))

(defun my-set-utf8 ()
    (interactive)
    (set-buffer-file-coding-system 'utf-8-unix))

(defmacro lazy-major-mode (pattern mode)
  "Defines a new major-mode matched by PATTERN, installs MODE if necessary, and activates it."
  `(add-to-list 'auto-mode-alist
                '(,pattern . (lambda ()
                             (require-package (quote ,mode))
                             (,mode)))))

(provide 'init-macros)
