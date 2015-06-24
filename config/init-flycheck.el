(require-package 'flycheck)
(require 'flycheck)

(setq flycheck-flake8rc (concat user-emacs-directory "config/flycheck_configs/flake8rc"))
(setq flycheck-flake8-maximum-line-length 200)

(setq flycheck-pylintrc (concat user-emacs-directory "config/flycheck_configs/pylintrc"))

(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc python-flake8)))

(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'prog-mode-hook 'flycheck-mode)

(provide 'init-flycheck)
