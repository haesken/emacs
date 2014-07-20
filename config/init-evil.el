(setq evil-search-module 'evil-search)
(setq evil-magic 'very-magic)

(setq evil-emacs-state-cursor '(monokai-fg box))
(setq evil-normal-state-cursor '(monokai-fg box))
(setq evil-visual-state-cursor '(monokai-fg box))
(setq evil-insert-state-cursor '(monokai-fg box))
(setq evil-replace-state-cursor '(monokai-fg box))
(setq evil-operator-state-cursor '(monokai-fg box))

(require-package 'evil)
(require-package 'evil-leader)
(require-package 'evil-indent-textobject)
;; (require-package 'evil-matchit)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

(require-package 'evil-nerd-commenter)
(require 'evil-nerd-commenter)

(setq evil-shift-width 4)
(require 'evil)
(require 'evil-indent-textobject)
(evil-mode t)

;; Relative Line Numbers
(global-linum-mode t)
(require-package 'linum-relative)
(require 'linum-relative)
(linum-relative-toggle)
(linum-relative-format "%3s ")

(provide 'init-evil)
