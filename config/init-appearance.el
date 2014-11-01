;; Monokai Theme
(require-package 'monokai-theme)
(load-theme 'monokai t)

;; Fonts
(set-frame-font "Deja Vu Sans Mono:weight=bold")
(add-to-list 'initial-frame-alist '(font . "Deja Vu Sans Mono:weight=bold"))
(add-to-list 'default-frame-alist '(font . "Deja Vu Sans Mono:weight=bold"))

;; Blink cursor
(blink-cursor-mode 1)

;; Highlight matching parens
(setq show-paren-delay 0)
(show-paren-mode 1)

;; Show fill column
;; (require-package 'fill-column-indicator)
;; (require 'fill-column-indicator)
;; (add-hook 'prog-mode-hook 'fci-mode)
;; (add-hook 'markdown-mode-hook 'fci-mode)

;; Powerline
(require-package 'powerline)
(require 'powerline)

(require-package 'powerline-evil)
(require 'powerline-evil)

(defun my-powerline-evil-vim-color-theme ()
  "Powerline's Vim-like mode-line with evil state at the beginning in color."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          powerline-default-separator
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           powerline-default-separator
                                                           (cdr powerline-default-separator-dir))))
                          ; Left Side
                          (lhs (list
                                     (let ((evil-face (powerline-evil-face)))
                                       (if evil-mode
                                           (powerline-raw (powerline-evil-tag) evil-face)))
                                     ; Buffer ID
                                     (powerline-buffer-id `(mode-line-buffer-id ,mode-line) 'l)
                                     (powerline-raw " ")
                                     ; File Encoding
                                     (if (not (equal buffer-file-coding-system nil))
                                       (concat
                                         (powerline-raw (format "%s" buffer-file-coding-system) mode-line)
                                         (powerline-raw " ")))
                                     ; Modified
                                     (if (buffer-modified-p)
                                       (powerline-raw "+" mode-line)
                                       (powerline-raw "-" mode-line))
                                     ; Read Only
                                     (when buffer-read-only
                                       (powerline-raw "" mode-line))
                                     ; (powerline-raw (concat "[" (mode-line-eol-desc) "]") mode-line)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format nil 'l))
                                     (powerline-raw " ")
                                     ; Git
                                     (when (and vc-mode buffer-file-name)
                                       (let ((backend (vc-backend buffer-file-name)))
                                         (when backend
                                           (concat (powerline-raw (format "%s/%s" backend (vc-working-revision buffer-file-name backend)))))))
                                     (powerline-raw " ")
                                     (powerline-major-mode mode-line)
                                     (powerline-raw " ")
                                     ; Minor Mode
                                     ;; (powerline-minor-modes mode-line)

                                     (powerline-process mode-line)))
                          ; Right Side
                          (rhs (list
                                     ; Character count
                                     ; (powerline-raw '(10 "%i"))
                                     (powerline-raw global-mode-string mode-line 'r)
                                     ; Line
                                     (powerline-raw "%l:" mode-line 'l)
                                     ; Column
                                     (powerline-raw (format-mode-line '(3 "%c")))
                                     (powerline-raw " ")
                                     (powerline-raw (replace-regexp-in-string  "%" "%%" (format-mode-line '(-3 "%p"))) mode-line 'r))))
                     (concat (powerline-render lhs)
                             (powerline-fill mode-line (powerline-width rhs))
                             (powerline-render rhs)))))))

(my-powerline-evil-vim-color-theme)

;; Rainbow Delimiters
(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Highlight trailing whitespace and tab characters
(require 'whitespace)
(setq-default whitespace-style '(face tabs tab-mark trailing))
;; Display tab characters as "▶   "
(setq whitespace-display-mappings
  ;; all numbers are Unicode codepoint in decimal. try (insert-char 182 ) to see it
  '((tab-mark 9 [9654 9] [92 9]))); 9 TAB, 9654 BlACK RIGHT-POINTING TRIANGLE 「▶」

;; Activate whitespace mode in text & programming modes
(add-hook 'text-mode-hook 'whitespace-mode)
(add-hook 'prog-mode-hook 'whitespace-mode)


;; Don't wrap long lines in prog modes
(add-hook 'prog-mode-hook (lambda () (setq truncate-lines t)))

(provide 'init-appearance)
