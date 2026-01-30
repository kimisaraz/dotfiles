(require 'aurora-theme)
(load-theme 'aurora t)

(custom-theme-set-faces
 'aurora
 '(default ((t (:background "Black"))))
 '(region ((t (:background "NavyBlue" :inverse-video nil))))
 '(hl-line ((t (:background "gray10" :inverse-video nil))))
 '(fringe ((t :inherit hl-line)))
 '(mode-line ((t (:inherit hl-line))))
 '(mode-line-inactive ((t (:background "gray5" :foreground "gray20" :box "gray20"))))
 ;; helm
 ;; '(helm-source-header ((t (:background "gray5" :foreground "white" :height 1.0 :wiight 'semi-bold :family nil))))
 '(helm-selection ((t (:background "gray10" :underline t))))
 '(helm-visible-mark ((t (:background "NavyBlue"))))
 '(helm-ff-file ((t (:background nil))))
 '(helm-ff-directory ((t (:background nil :foreground "#66D9EF"))))
 '(helm-ff-dotted-directory ((t (:inherit helm-ff-directory :foreground "#21889B"))))
 '(helm-buffer-directory ((t (:inherit helm-ff-directory))))
 ;; magit
 '(magit-item-highlight ((t (:inherit hl-line)))))
