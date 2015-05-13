(require-package 'auto-complete)
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(setq ac-show-menu-immediately-on-auto-complete t)
(setq ac-delay .1)
(setq ac-auto-show-menu (* ac-delay 1))

(require-package 'jedi)
(require 'jedi)
(require-package 'epc)
(require 'epc)

(setq completion-auto-help nil)

(add-hook 'python-mode-hook 'jedi:setup)

;; Start completion at method dot
(setq jedi:complete-on-dot t)

(eval-after-load "auto-complete" '(add-to-list 'ac-modes 'lua-mode))
(eval-after-load "auto-complete" '(add-to-list 'ac-modes 'rust-mode))
(eval-after-load "auto-complete" '(add-to-list 'ac-modes 'au3-mode))

(provide 'init-auto-complete)
