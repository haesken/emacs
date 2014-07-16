(setq evil-search-module 'evil-search)
(setq evil-magic 'very-magic)

(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

(setq evilnc-hotkey-comment-operator "gc")

(require-package 'evil)
(require-package 'evil-leader)
(require-package 'evil-nerd-commenter)
(require-package 'evil-indent-textobject)
; (require-package 'evil-matchit)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

; (setq evilnc-hotkey-comment-operator ",,")
(require 'evil-nerd-commenter)
; (evilnc-default-hotkeys)

(require 'evil)
(require 'evil-indent-textobject)
(evil-mode t)

;; Relative Line Numbers
(global-linum-mode t)
(require-package 'linum-relative)
(require 'linum-relative)
(linum-relative-toggle)

(provide 'init-evil)
