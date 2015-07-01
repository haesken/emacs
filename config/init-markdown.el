(require-package 'markdown-mode)
(require 'markdown-mode)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Disable variable pitch for headings
(add-hook 'markdown-mode-hook
          (lambda ()
            (dolist (md-face '(markdown-header-face-1
                               markdown-header-face-2
                               markdown-header-face-3
                               markdown-header-face-4
                               markdown-header-face-5
                               markdown-header-face-6))
              (set-face-attribute md-face nil :height 1.0))))

(provide 'init-markdown)

