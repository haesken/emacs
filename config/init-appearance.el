;; Solarized Theme (sellout)
(require-package 'color-theme-solarized)
(load-theme 'solarized-dark)

;; Disable menu, tool, & scroll bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Highlight matching parens
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Rainbow Delimiters
(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Show line & column number
(line-number-mode t)
(column-number-mode t)

(provide 'init-appearance)
