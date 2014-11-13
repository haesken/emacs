(defgroup dotemacs nil
    "Custom configuration for dotemacs."
    :group 'local)

(defcustom dotemacs-cache-directory (concat user-emacs-directory ".cache/")
    "The storage location for various persistent files."
    :group 'dotemacs)

;; Disable menu/tool/scroll bars
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Load files in config/
(add-to-list 'load-path (concat user-emacs-directory "config"))
(add-to-list 'load-path (concat user-emacs-directory "elisp"))

(require 'cl)
(require 'init-packages)
(require 'init-util)

;; Load custom.el if it exists
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
    (load custom-file))

;; --- Basics ---
(require 'init-core)
(require 'init-indent)
(require 'init-macros)
(require 'init-appearance)

;; --- Completion & Snippets ---
(require 'init-yasnippet)
(require 'init-auto-complete)

;; --- Syntax Checking ---
(require 'init-flycheck)

;; --- Version Control ---
(require 'init-vcs)

;; --- Filetypes ---
(require 'init-lisp)
(require 'init-python)
(require 'init-markdown)
(require 'init-js)
(require 'init-lua)
(require 'init-autoit)
(require 'init-rust)

;; --- Evil & Commands ---
(require 'init-evil)
(require 'init-term)
(require 'init-bindings)
(require 'init-gui)

;; --- Things that need to be loaded last ---
(require 'init-after)
