(ac-config-default)

(setq ac-use-menu-map t)
(setq ac-use-fuzzy t)
;; (add-to-list 'ac-dictionary-directories (expand-file-name "ac-dict" user-emacs-directory))

(add-to-list 'ac-modes 'graphviz-dot-mode)
(add-to-list 'ac-modes 'haml-mode)
(add-to-list 'ac-modes 'scss-mode)
(add-to-list 'ac-modes 'yaml-mode)
