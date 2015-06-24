;; Store most files in the cache
(setq backup-directory-alist
      `((".*" . ,(concat dotemacs-cache-directory "backups")))
      auto-save-file-name-transforms
      `((".*" ,(concat dotemacs-cache-directory "backups") t))
      auto-save-list-file-prefix
      (concat dotemacs-cache-directory "auto-save-list/saves-"))

;; Better scrolling
(setq scroll-conservatively 9999
      scroll-preserve-screen-position t)

;; Answer yes/no questions with y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Set default encoding to utf8 ALWAYS
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-default buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)

;; Don't always insert a final newline
(setq require-final-newline nil)

;; No bells
(setq ring-bell-function (lambda () ()))

;; Don't make lock files
(setq create-lockfiles nil)

;; Period and single space consitutes the end of a sentence
(setq sentence-end-double-space nil)

;; Start completely blank
(setq inhibit-splash-screen t)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

; Helm & Projectile
(require-package 'helm)
(require 'helm-config)
(require-package 'projectile)
(require 'projectile)
(require-package 'helm-projectile)
(require 'helm-projectile)

(projectile-global-mode t)
(setq projectile-completion-system 'helm)
(helm-mode 1)

;; Enable spell checking for text-mode buffers
(require 'flyspell)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'flyspell-buffer)
(dolist (mode '(emacs-lisp-mode-hook
                python-mode))
  (add-hook mode
            '(lambda ()
               'flyspell-prog-mode)))
(setq flyspell-issue-message-flag nil)

(require-package 'perspective)
(require 'perspective)
(persp-mode t)

(setq echo-keystrokes 0.02)

(provide 'init-core)
