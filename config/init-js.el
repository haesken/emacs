(require-package 'js2-mode)
(require 'js2-mode)

(lazy-major-mode "\\.js$" js2-mode)
;; (lazy-major-mode "\\.json$" js2-mode)

(require-package 'coffee-mode)
(require 'coffee-mode)

(provide 'init-js)
