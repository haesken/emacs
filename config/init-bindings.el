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
            "b d" 'kill-this-buffer
            "b l" 'list-buffers
            "y s" 'copy-selection-to-clipboard
            "p" 'paste-from-clipboard
            ))

    (define-key evil-normal-state-map (kbd "gc") 'evilnc-comment-or-uncomment-lines)

    (global-set-key (kbd "C-w") 'evil-window-map)
    (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
    (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
    (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
    (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

    (define-key evil-motion-state-map "j" 'evil-next-visual-line)
    (define-key evil-motion-state-map "k" 'evil-previous-visual-line)

    (define-key evil-normal-state-map (kbd "H") 'evil-first-non-blank)
    (define-key evil-normal-state-map (kbd "L") 'evil-end-of-visual-line)
    (define-key evil-motion-state-map (kbd "H") 'evil-first-non-blank)
    (define-key evil-motion-state-map (kbd "L") 'evil-end-of-visual-line)

    (define-key evil-normal-state-map (kbd "Y") (kbd "y$"))
)

(provide 'init-bindings)
