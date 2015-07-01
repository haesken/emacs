(require-package 'lua-mode)
(require 'lua-mode)

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(eval-after-load "auto-complete" '(add-to-list 'ac-modes 'lua-mode))

(add-hook 'lua-mode-hook
          (lambda ()
            (setq lua-indent-level 4)))

(provide 'init-lua)
