(require-package 'rust-mode)
(require 'rust-mode)

(eval-after-load "auto-complete" '(add-to-list 'ac-modes 'rust-mode))

(provide 'init-rust)
