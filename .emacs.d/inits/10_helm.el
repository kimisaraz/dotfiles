(helm-mode 1)

(setq helm-candidate-number-limit 600)
(setq helm-quick-update t)

(add-to-list 'helm-boring-buffer-regexp-list "\\*scratch\\*")
(add-to-list 'helm-boring-buffer-regexp-list "\\*Calendar\\*")
(add-to-list 'helm-boring-buffer-regexp-list "\\*Completions\\*")
(add-to-list 'helm-boring-buffer-regexp-list "\\*Help\\*")
(add-to-list 'helm-boring-buffer-regexp-list "\\*Messages\\*")

(set-face-attribute 'helm-source-header nil
                    :height 1.0 :weight 'semi-bold :family nil
                    :foreground "white" :background "gray5")
(set-face-attribute 'helm-selection nil
                    :background "gray10" :underline t)
(set-face-attribute 'helm-visible-mark nil
                    :background "NavyBlue")
(set-face-attribute 'helm-ff-directory nil
                    :foreground "cyan" :background nil :underline t)
(set-face-attribute 'helm-buffer-directory nil
                    :foreground "cyan" :background nil :underline t)
