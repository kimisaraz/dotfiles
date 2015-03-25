(require 'smartparens-config)

(setq sp-show-pair-delay 0)
(smartparens-global-mode t)
(show-smartparens-global-mode t)

(setq sp-highlight-pair-overlay nil)
;; (setq sp-highlight-wrap-overlay nil)
;; (setq sp-highlight-wrap-tag-overlay nil)

(sp-with-modes '(ruby-mode)
  (sp-local-tag "#" "#{" "}"))

(sp-with-modes '(org-mode markdown-mode gfm-mode text-mode)
  (sp-local-pair "（" "）")
  (sp-local-pair "「" "」")
  (sp-local-pair "『" "』")
  (sp-local-pair "【" "】"))

(sp-with-modes '(org-mode)
  (sp-local-tag "*" "*" "*")
  (sp-local-tag "/" "/" "/")
  (sp-local-tag "_" "_" "_")
  (sp-local-tag "=" "=" "=")
  (sp-local-tag "~" "~" "~")
  (sp-local-tag "+" "+" "+")
  (sp-local-tag "<" "<" ">"))

(sp-with-modes '(markdown-mode gfm-mode)
  (sp-local-tag "#" "# " " #"))

(set-face-attribute 'sp-show-pair-match-face nil
                    :background "#fd971f" :foreground "black")
(set-face-attribute 'sp-show-pair-mismatch-face nil
                    :background "#1e0010" :foreground "#960050")
