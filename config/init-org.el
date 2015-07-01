(require 'org)

;; Disable variable pitch for headings
(add-hook 'org-mode-hook
          (lambda ()
            (dolist (org-face '(org-document-title
                                org-level-1 org-level-2 org-level-3 org-level-4
                                org-level-5 org-level-6 org-level-7 org-level-8))
              (set-face-attribute org-face nil :inherit nil :height 1.0))))

(provide 'init-org)
