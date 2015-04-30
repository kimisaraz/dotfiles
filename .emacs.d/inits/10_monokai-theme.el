(require 'monokai-theme)
(load-theme 'monokai t)

(custom-theme-set-faces
 'monokai
 '(default ((t (:background "Black"))))
 '(region ((t (:background "NavyBlue"))))
 '(hl-line ((t (:background "gray10"))))
 '(fringe ((t :inherit hl-line)))
 '(mode-line ((t (:inherit hl-line))))
 '(mode-line-inactive ((t (:background "gray5" :foreground "gray20" :box "gray20"))))
 '(font-lock-comment-face ((t (:foreground "gray50"))))
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face)))))
