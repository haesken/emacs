(after 'evil
    ;; fix conflict with electric-indent-mode in 24.4
    (define-key evil-insert-state-map [remap newline] 'newline)
    (define-key evil-insert-state-map [remap newline-and-indent] 'newline-and-indent)

    (require-package 'key-chord)
    (key-chord-mode 1)
    (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
    (key-chord-define evil-insert-state-map "kj" 'evil-normal-state)

    (after "evil-leader-autoloads"
        (evil-leader/set-leader ",")
        (evil-leader/set-key
            "b d" 'kill-this-buffer                     ; buffer delete
            "s v" 'split-window-right                   ; split veritcal
            "s h" 'split-window-below                   ; split horizontal
            "s d" 'delete-window                        ; split delete
            "s o" 'delete-other-windows                 ; split only
            "y s" 'copy-selection-to-clipboard          ; yank selection
            "p" 'paste-from-clipboard                   ; paste
            "s p" 'flyspell-mode                        ; toggle spell checking
            "s b" 'flyspell-buffer                      ; spell check buffer
            "s c" 'flyspell-auto-correct-word           ; try auto correct
            "t w" 'set-fill-column                      ; text width
            ;; "t 8" 'set-fill-column 80                   ; text width 80
            "w s" 'delete-trailing-whitespace           ; clean trailing whitespace
            ;; "s l" 'flyspell-correct-word                ; choose from list
            "w w" 'toggle-truncate-lines                ; word wrap
            ))

    ;; Comment or Uncomment Line/Selection
    (define-key evil-normal-state-map (kbd "gc") 'evilnc-comment-or-uncomment-lines)

    (global-set-key (kbd "C-w") 'evil-window-map)
    (define-key evil-normal-state-map (kbd "C-w h") 'evil-window-left)
    (define-key evil-normal-state-map (kbd "C-w j") 'evil-window-down)
    (define-key evil-normal-state-map (kbd "C-w k") 'evil-window-up)
    (define-key evil-normal-state-map (kbd "C-w l") 'evil-window-right)
    (define-key evil-normal-state-map (kbd "C-s v") 'split-window-right)
    (define-key evil-normal-state-map (kbd "C-s h") 'split-window-below)
    (define-key evil-normal-state-map (kbd "C-s d") 'delete-window)
    (define-key evil-normal-state-map (kbd "C-s o") 'delete-other-windows)
    (define-key evil-normal-state-map (kbd "M-e") 'yas/expand)
    (define-key evil-insert-state-map (kbd "M-e") 'yas/expand)

    (define-key evil-motion-state-map "j" 'evil-next-visual-line)
    (define-key evil-motion-state-map "k" 'evil-previous-visual-line)

    ;; First non-whitespace character on line
    (define-key evil-normal-state-map (kbd "H") 'evil-first-non-blank)
    (define-key evil-motion-state-map (kbd "H") 'evil-first-non-blank)
    ;; Last character on line
    (define-key evil-normal-state-map (kbd "L") 'evil-end-of-visual-line)
    (define-key evil-motion-state-map (kbd "L") 'evil-end-of-visual-line)

    ;; Yank rest of line
    (define-key evil-normal-state-map (kbd "Y") (kbd "y$"))

    ;; Remap ; to :
    (define-key evil-motion-state-map ";" 'evil-ex)
)

(provide 'init-bindings)
