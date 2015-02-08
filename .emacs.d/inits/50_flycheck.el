(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

(add-hook 'emacs-lisp-mode-hook 'flycheck-mode)
(add-hook 'ruby-mode-hook 'flycheck-mode)
