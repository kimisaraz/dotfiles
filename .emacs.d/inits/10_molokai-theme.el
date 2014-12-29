(require 'molokai-theme)
(load-theme 'molokai t)

(custom-theme-set-faces
 'molokai
 '(default ((t (:background "Black"))))
 '(region ((t (:background "NavyBlue" :inverse-video nil))))
 '(hl-line ((t (:background "gray10" :inverse-video nil))))
 '(font-lock-comment-face ((t (:foreground "gray50"))))
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
 '(isearch ((t (:foreground "Black" :background "Gray" :weight bold))))
 '(isearch-fail ((t (:foreground "Black" :background "OrangeRed"))))
 '(lazy-highlight ((t (:inherit isearch :weight normal))))
 '(trailing-whitespace ((t (:background "OrangeRed")))))
