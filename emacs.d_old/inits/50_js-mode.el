(setq js-indent-level 2)

(defun my:js-mode-hooks ()
  "js-mode-hooks"
  (define-key js-mode-map (kbd "M-.") 'nil) ; was js-find-symbol
  (subword-mode 1))
(add-hook 'js-mode-hook 'my:js-mode-hooks)
