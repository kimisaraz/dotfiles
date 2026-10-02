;;; 20-smartparens.el --- Smartparens configuration
;;
;;; Commentary:
;;
;; smartparensの設定（現在は全てコメントアウト）

;;; Code:

;; (require 'smartparens-config)

;; (setq sp-show-pair-delay 0)
;; (smartparens-global-mode t)
;; (show-smartparens-global-mode t)

;; (setq sp-highlight-pair-overlay nil)
;; (setq sp-highlight-wrap-overlay nil)
;; (setq sp-highlight-wrap-tag-overlay nil)

;; (sp-with-modes '(ruby-mode)
;;   (sp-local-tag " " "{ " " }")
;;   (sp-local-tag "#" "#{" "}"))

;; (sp-with-modes '(org-mode markdown-mode gfm-mode text-mode)
;;   (sp-local-pair "（" "）")
;;   (sp-local-pair "「" "」")
;;   (sp-local-pair "『" "』")
;;   (sp-local-pair "【" "】"))

;; (sp-with-modes '(org-mode)
;;   (sp-local-tag "*" "*" "*")
;;   (sp-local-tag "/" "/" "/")
;;   (sp-local-tag "_" "_" "_")
;;   (sp-local-tag "=" "=" "=")
;;   (sp-local-tag "~" "~" "~")
;;   (sp-local-tag "+" "+" "+")
;;   (sp-local-tag "<" "<" ">"))

(provide '20-smartparens)
;;; 20-smartparens.el ends here
