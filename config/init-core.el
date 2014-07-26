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

;; Set default encoding to utf8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Use spaces not tabs
(setq-default indent-tabs-mode nil)

;; Default indent width 4 chars
(setq tab-width 4) ;; Show tabs as 4 spaces
(setq-default tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
                      64 68 72 76 80 84 88 92 96 100 104 108 112
                      116 120))

; Stop doing crazy indent shit
;; Global
(global-set-key (kbd "TAB") 'tab-to-tab-stop)
;; Per Mode
;; (define-key text-mode-map (kbd "TAB") 'tab-to-tab-stop)

;; No bells
(setq ring-bell-function (lambda () ()))
;; Don't make lock files
(setq create-lockfiles nil)

(setq inhibit-splash-screen t)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)

;; Enable ido
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

;; Display ido results vertically
(require-package 'ido-vertical-mode)
(require 'ido-vertical-mode)
(ido-vertical-mode 1)

;; Enable spell checking for text-mode buffers
(require 'flyspell)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'flyspell-buffer)
(setq flyspell-issue-message-flag nil)

(setq sentence-end-double-space nil)

(require 'whitespace)
;; Highlight trailing whitespace and tabs
(setq-default whitespace-style '(face tabs tab-mark trailing))
;; Display tab characters as "▶   "
(setq whitespace-display-mappings
  ;; all numbers are Unicode codepoint in decimal. try (insert-char 182 ) to see it
  '((tab-mark 9 [9654 9] [92 9]))); 9 TAB, 9654 BlACK RIGHT-POINTING TRIANGLE 「▶」

;; Activate whitespace mode in text & programming modes
(add-hook 'text-mode-hook 'whitespace-mode)
(add-hook 'prog-mode-hook 'whitespace-mode)

(provide 'init-core)
