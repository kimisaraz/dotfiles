(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))

(defun my:markdown-mode-hooks ()
  "markdown-mode-hooks"
  (setq-local show-trailing-whitespace nil))
(add-hook 'markdown-mode-hook 'my:markdown-mode-hooks)
