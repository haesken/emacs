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


(setq ring-bell-function (lambda () ()))
(setq create-lockfiles nil)

(setq inhibit-splash-screen t)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)

(provide 'init-core)
