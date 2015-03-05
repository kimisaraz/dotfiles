(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

(add-hook 'css-mode-hook 'flycheck-mode)
(add-hook 'emacs-lisp-mode-hook 'flycheck-mode)
(add-hook 'js-mode-hook 'flycheck-mode)
(add-hook 'ruby-mode-hook 'flycheck-mode)
