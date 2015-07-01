(package-initialize)

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

;; Auto compile
(setq load-prefer-newer t)
(require-package 'auto-compile)
(require 'auto-compile)
(auto-compile-on-load-mode 1)
(auto-compile-on-save-mode 1)

;; --- Global ---
(require 'init-core)
(require 'init-indent)
(require 'init-macros)
(require 'init-appearance)
(require 'init-evil)
(require 'init-term)

;; --- Programming Features ---
(require 'init-auto-complete)
(require 'init-yasnippet)
(require 'init-flycheck)

;; --- Version Control ---
(require 'init-vcs)

;; --- Languages ---
(require 'init-autohotkey)
(require 'init-autoit)
(require 'init-csharp)
(require 'init-haskell)
(require 'init-js)
(require 'init-lisp)
(require 'init-lua)
(require 'init-markdown)
(require 'init-org)
(require 'init-python)
(require 'init-rust)

;; --- Things that need to be loaded last ---
(require 'init-bindings)
(require 'init-after)

;; (toggle-debug-on-quit)
