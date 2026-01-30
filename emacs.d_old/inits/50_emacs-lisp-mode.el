(defun my:emacs-lisp-mode-hooks ()
  "emacs-lisp-mode-hooks"
  (when (require 'eldoc nil t)
    (setq eldoc-idle-delay 0.2)
    (setq eldoc-echo-area-use-multiline-p t)
    (turn-on-eldoc-mode)))
(add-hook 'emacs-lisp-mode-hook 'my:emacs-lisp-mode-hooks)

(add-to-list 'auto-mode-alist '("Cask\\'" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("recentf\\'" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("bookmarks\\'" . emacs-lisp-mode))
