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
            "y s" 'copy-selection-to-clipboard          ; yank selection
            "p"   'paste-from-clipboard                 ; paste
            "s p" 'flyspell-mode                        ; toggle spell checking
            "s b" 'flyspell-buffer                      ; spell check buffer
            "s c" 'flyspell-auto-correct-word           ; try auto correct
            "t w" 'set-fill-column                      ; text width
            "w s" 'delete-trailing-whitespace           ; clean trailing whitespace
            "w w" 'toggle-truncate-lines                ; word wrap
            "e u u" 'my-set-utf8
            ))

    ;; Comment or Uncomment Line/Selection
    (define-key evil-normal-state-map (kbd "gc") 'evilnc-comment-or-uncomment-lines)

    ;; Expand Snippets
    (define-key evil-normal-state-map (kbd "M-e") 'yas/expand)
    (define-key evil-insert-state-map (kbd "M-e") 'yas/expand)

    ;; Navigate by visual lines
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

;; Window Management
;; Override evil's window management
(eval-after-load "evil-maps"
  (dolist
    (map '(evil-motion-state-map
           evil-insert-state-map
           evil-emacs-state-map))
    (define-key (eval map) "\C-w" nil)))

;; Run a terminal
(defun my-term ()
    (interactive)
    (ansi-term "/bin/zsh"))

;; Global Window Management
(define-prefix-command 'my-window-map)
(global-set-key (kbd "\C-w") 'my-window-map)
(define-key my-window-map (kbd "h") 'windmove-left)
(define-key my-window-map (kbd "j") 'windmove-down)
(define-key my-window-map (kbd "k") 'windmove-up)
(define-key my-window-map (kbd "l") 'windmove-right)
(define-key my-window-map (kbd "v") 'split-window-right)
(define-key my-window-map (kbd "b") 'split-window-below)
(define-key my-window-map (kbd "x") 'delete-window)
(define-key my-window-map (kbd "o") 'delete-other-windows)
(define-key my-window-map (kbd "=") 'balance-windows)
(define-key my-window-map (kbd "t") 'my-term)

(provide 'init-bindings)
