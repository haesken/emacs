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
;; (set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
;; (setq coding-system-for-read 'utf-8-unix)
;; (setq coding-system-for-write 'utf-8-unix)

;; Don't always insert a final newline
(setq require-final-newline nil)

;; Set text width
(setq-default fill-column 80)
(add-hook 'text-mode-hook
  (lambda () (set-fill-column 80)))

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

;; Enable ido
(require 'ido)
;; (setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

;; Display ido results vertically
(require-package 'ido-vertical-mode)
(require 'ido-vertical-mode)
(ido-vertical-mode 1)

;; (require-package 'helm)
; (require-package 'helm-ls-git)
; (require 'helm-ls-git)
;; (require 'helm-config)
; (helm :sources '(helm-source-findutils
;                  helm-source-ls-git
;                  helm-source-locate)
;       :buffer "*helm-find-files*"))
;; (helm-mode 1)

;; Enable spell checking for text-mode buffers
(require 'flyspell)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'flyspell-buffer)
(setq flyspell-issue-message-flag nil)

(require-package 'perspective)
(require 'perspective)
(persp-mode t)

;; (require-package 'autopair)
;; (require 'autopair)
;; (autopair-global-mode)

(provide 'init-core)
