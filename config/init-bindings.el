(after 'evil
    ;; ;; fix conflict with electric-indent-mode in 24.4
    ;; (define-key evil-insert-state-map [remap newline] 'newline)
    ;; (define-key evil-insert-state-map [remap newline-and-indent] 'newline-and-indent)

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
            "e u u" 'my-set-utf8                        ; set buffer encoding to utf-8-unix
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

;; Unbind evil's window management
(eval-after-load "evil-maps"
  (dolist
    (map '(evil-motion-state-map
           evil-insert-state-map
           evil-emacs-state-map))
    (define-key (eval map) "\C-w" nil)))

;; Actually don't use C-w for anything
(global-set-key (kbd "\C-w") 'ignore)

;; Run a terminal
(defun my-term ()
    (interactive)
    (ansi-term "/bin/zsh"))

;; Disable evil's mouse bindings
(eval-after-load "evil-maps"
  (dolist
    (map '(evil-motion-state-map
           evil-insert-state-map
           evil-emacs-state-map
           evil-visual-state-map))
    (define-key (eval map) [mouse-1] 'ignore)
    (define-key (eval map) [down-mouse-1] 'ignore)
    (define-key (eval map) [drag-mouse-1] 'ignore)
    (define-key (eval map) [mouse-2] 'ignore)
    (define-key (eval map) [down-mouse-2] 'ignore)
    (define-key (eval map) [drag-mouse-2] 'ignore)
    (define-key (eval map) [mouse-3] 'ignore)
    (define-key (eval map) [down-mouse-3] 'ignore)
    (define-key (eval map) [drag-mouse-3] 'ignore)
  ))

; Disable Mouse Buttons Globally
(dolist (k '([mouse-1] [down-mouse-1] [drag-mouse-1] [double-mouse-1] [triple-mouse-1]
             [mouse-2] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2]
             [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3]
             [mouse-4] [down-mouse-4] [drag-mouse-4] [double-mouse-4] [triple-mouse-4]
             [mouse-5] [down-mouse-5] [drag-mouse-5] [double-mouse-5] [triple-mouse-5]))
  (global-unset-key k))

(setq mouse-drag-copy-region nil)

;; Quickly switch windows
(require-package 'switch-window)
(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)

;; Global Window / Perspective Management
(define-prefix-command 'my-window-map)
(global-set-key (kbd "\C-a") 'my-window-map)
(define-key my-window-map (kbd "h") 'windmove-left)
(define-key my-window-map (kbd "j") 'windmove-down)
(define-key my-window-map (kbd "k") 'windmove-up)
(define-key my-window-map (kbd "l") 'windmove-right)
(define-key my-window-map (kbd "s") 'switch-window)
(define-key my-window-map (kbd "v") 'split-window-right)
(define-key my-window-map (kbd "b") 'split-window-below)
(define-key my-window-map (kbd "d") 'delete-window)
(define-key my-window-map (kbd "o") 'delete-other-windows)
(define-key my-window-map (kbd "=") 'balance-windows)
(define-key my-window-map (kbd "t") 'my-term)
(define-key my-window-map (kbd "c") 'persp-switch)
(define-key my-window-map (kbd "r") 'persp-rename)
(define-key my-window-map (kbd "x") 'persp-kill)

;; Switch to new window on creation
(defadvice split-window-right (after move-point-to-new-window activate)
  "Moves the point to the newly created window after splitting."
  (other-window 1))

(defadvice split-window-below (after move-point-to-new-window activate)
  "Moves the point to the newly created window after splitting."
  (other-window 1))

(provide 'init-bindings)
