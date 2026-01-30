(custom-set-variables '(coffee-tab-width 2))

(defun my:coffee-mode-hooks ()
  "coffee-mode-hooks"
  (subword-mode 1))
(add-hook 'coffee-mode-hook 'my:coffee-mode-hooks)
