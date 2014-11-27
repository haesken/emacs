(if (fboundp 'with-eval-after-load)
    (defmacro after (feature &rest body)
      "After FEATURE is loaded, evaluate BODY."
      (declare (indent defun))
      `(with-eval-after-load ,feature ,@body))
  (defmacro after (feature &rest body)
    "After FEATURE is loaded, evaluate BODY."
    (declare (indent defun))
    `(eval-after-load ,feature
       '(progn ,@body))))

(defun my-recompile-plugins ()
  "Byte-compile all plugins."
  (interactive)
  (byte-recompile-directory (concat user-emacs-directory "elpa") 0)
  (byte-recompile-directory (concat user-emacs-directory "elisp") 0))

(defun my-recompile-config ()
  "Byte-compile all configs."
  (interactive)
  (byte-recompile-directory (concat user-emacs-directory "config") 0))

(provide 'init-util)
