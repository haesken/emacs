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

(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
;; (set-default file-co'utf-8-unix)
;; (prefer-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)
(setq coding-system-for-read 'utf-8-unix)
(setq coding-system-for-write 'utf-8-unix)

;; Use spaces not tabs
(setq-default indent-tabs-mode nil)

;; Default indent width 4 chars
(setq tab-width 4) ;; Show tabs as 4 spaces
(setq-default tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
                      64 68 72 76 80 84 88 92 96 100 104 108 112
                      116 120))

;; http://www.emacswiki.org/emacs/BackspaceWhitespaceToTabStop
(defvar my-offset 4 "My indentation offset. ")
(defun backspace-whitespace-to-tab-stop ()
  "Delete whitespace backwards to the next tab-stop, otherwise delete one character."
  (interactive)
  (if (or indent-tabs-mode
          (region-active-p)
          (save-excursion
            (> (point) (progn (back-to-indentation)
                              (point)))))
      (call-interactively 'backward-delete-char-untabify)
    (let ((movement (% (current-column) my-offset))
          (p (point)))
      (when (= movement 0) (setq movement my-offset))
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
(global-set-key (kbd "TAB") 'tab-to-tab-stop)
;; Per Mode
;; (define-key text-mode-map (kbd "TAB") 'tab-to-tab-stop)

;; Set text width
(setq-default fill-column 80)
(add-hook 'text-mode-hook
          (lambda ()
                      (set-fill-column 80)))

;; No bells
(setq ring-bell-function (lambda () ()))
;; Don't make lock files
(setq create-lockfiles nil)

(setq inhibit-splash-screen t)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

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

(require-package 'perspective)
(require 'perspective)
(persp-mode t)

(provide 'init-core)
