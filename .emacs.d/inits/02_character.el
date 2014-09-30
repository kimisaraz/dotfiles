;; 文字コードを指定する
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;;; フォントの設定
(when (x-list-fonts "Ricty")
  ;; asciiフォントをRictyに
  (set-face-attribute 'default nil
                      :family "Ricty"
                      :height 140)
  ;; 日本語フォントをRictyに
  (set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family "Ricty")))
