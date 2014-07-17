(defgroup dotemacs nil
    "Custom configuration for dotemacs."
    :group 'local)

(defcustom dotemacs-cache-directory (concat user-emacs-directory ".cache/")
    "The storage location for various persistent files."
    :group 'dotemacs)

;; Disable GUI elements
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(unless (display-graphic-p) (menu-bar-mode -1))

;; Load files in config/
(add-to-list 'load-path (concat user-emacs-directory "config"))

(require 'cl)
(require 'init-packages)
(require 'init-util)

;; Load custom.el if it exists
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
    (load custom-file))

(defcustom dotemacs-modules
    '(
    ;; --- Basics ---
    init-core
    init-appearance

    ;; --- Completion & Snippets ---
    ;; init-yasnippet
    ;; init-auto-complete
    ;; init-company

    ;; --- Syntax Checking
    ;; init-flycheck

    ;; --- Filetypes ---
    init-lisp
    ;; init-markdown

    ;; -- Evil & Commands
    init-evil
    init-macros
    ;; init-misc
    init-bindings
    )
    "Set of modules enabled in dotemacs."
    :group 'dotemacs)

(dolist (module dotemacs-modules)
    (require module))

;; --- Things that need to be loaded last ---
(require 'init-after)
