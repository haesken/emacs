;; Solarized Theme (sellout)
; (require-package 'color-theme-solarized)
; (load-theme 'solarized-dark)

;; Zenburn Theme
; (require-package 'zenburn-theme)
; (load-theme 'zenburn)

;; Monokai Theme
(require-package 'monokai-theme)
(load-theme 'monokai t)

;; Fonts
(set-default-font "Deja Vu Sans Mono:weight=bold")
(add-to-list 'initial-frame-alist '(font . "Deja Vu Sans Mono:weight=bold"))
(add-to-list 'default-frame-alist '(font . "Deja Vu Sans Mono:weight=bold"))

;; Disable menu, tool, & scroll bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Highlight matching parens
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Powerline
(require-package 'powerline)
(require 'powerline)

; (powerline-default-theme)
(powerline-vim-theme)

;; Rainbow Delimiters
(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(provide 'init-appearance)
