(require-package 'multi-term)
(require 'multi-term)
(setq multi-term-program "/bin/zsh")
(setq term-unbind-key-list '("C-z" "C-x" "C-c" "C-h" "C-y" "M-x" "<ESC>" "C-a"))

;; Run a terminal
(defun my-term ()
  (interactive)
  (multi-term))

(add-hook 'term-mode-hook
  (lambda ()
    (define-key term-raw-map (kbd "C-r") nil)))

(provide 'init-term)
