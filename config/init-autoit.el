(require 'au3-mode)

(eval-after-load "auto-complete" '(add-to-list 'ac-modes 'au3-mode))

(add-hook 'au3-mode-hook
  (lambda ()
    ;; Preferred comment style
    (setq comment-start ";"
          comment-end "")
    ;; indent width
    (setq default-tab-width 4)))

(provide 'init-autoit)
