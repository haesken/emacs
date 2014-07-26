(require-package 'yasnippet)
(require 'yasnippet)

(define-key yas-minor-mode-map [(tab)] nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)

(setq yas-fallback-behavior 'return-nil)
;; (setq yas-also-auto-indent-first-line t)
(setq yas-prompt-functions '(yas/ido-prompt yas/completing-prompt))

(add-hook 'prog-mode-hook 'yas-minor-mode)
(add-hook 'html-mode-hook 'yas-minor-mode)

(add-to-list 'yas-snippet-dirs (concat user-emacs-directory "snippets"))

(yas-reload-all)

(provide 'init-yasnippet)
