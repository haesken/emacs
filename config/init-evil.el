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
(require 'evil-leader)
(global-evil-leader-mode t)
(evil-leader/set-leader ",")

(require-package 'evil-nerd-commenter)
(require 'evil-nerd-commenter)

(require-package 'evil-surround)
(require 'evil-surround)
(global-evil-surround-mode 1)

(setq evil-shift-width 4)
(require 'evil)
(require-package 'evil-indent-textobject)
(require 'evil-indent-textobject)

(evil-mode t)

(add-hook 'term-mode-hook 'evil-emacs-state)

(defadvice evil-ex-search-next (after advice-for-evil-ex-search-next activate)
  (recenter))

(defadvice evil-ex-search-previous (after advice-for-evil-ex-search-previous activate)
  (recenter))

(defadvice evil-search-next (after advice-for-evil-ex-search-next activate)
  (recenter))

(defadvice evil-search-previous (after advice-for-evil-ex-search-previous activate)
  (recenter))

;; Relative Line Numbers
(global-linum-mode t)
(require-package 'linum-relative)
(require 'linum-relative)
(linum-relative-toggle)

(provide 'init-evil)
