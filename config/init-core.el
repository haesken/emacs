;; store most files in the cache
(setq backup-directory-alist
      `((".*" . ,(concat dotemacs-cache-directory "backups")))
      auto-save-file-name-transforms
      `((".*" ,(concat dotemacs-cache-directory "backups") t))
      auto-save-list-file-prefix
      (concat dotemacs-cache-directory "auto-save-list/saves-"))

;; better scrolling
(setq scroll-conservatively 9999
      scroll-preserve-screen-position t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; Set encoding to utf8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq indent-tabs-mode nil) ; And force use of spaces
(setq c-basic-offset 4) ; indents 4 chars
(setq tab-width 4)          ; and 4 char wide for TAB
(setq-default tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
                      64 68 72 76 80 84 88 92 96 100 104 108 112
                      116 120))
(define-key text-mode-map (kbd "TAB") 'tab-to-tab-stop)

(setq ring-bell-function (lambda () ()))
(setq create-lockfiles nil)

(setq inhibit-splash-screen t)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)

(provide 'init-core)
