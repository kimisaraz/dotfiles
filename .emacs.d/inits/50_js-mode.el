(setq js-indent-level 2)

(defun my:js-mode-hooks ()
  "js-mode-hooks"
  (subword-mode 1))
(add-hook 'js-mode-hook 'my:js-mode-hooks)
