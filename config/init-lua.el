(require-package 'lua-mode)
(require 'lua-mode)

(eval-after-load "auto-complete" '(add-to-list 'ac-modes 'lua-mode))

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(provide 'init-lua)
