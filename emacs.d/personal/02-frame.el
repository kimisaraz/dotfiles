;;; 02-frame.el --- Frame and mode-line customizations
;;
;;; Commentary:
;;
;; Frame appearance and mode-line customizations.

;;; Code:

;;; フォント設定
(when (and (eq system-type 'darwin)
           (x-list-fonts "HackGen Console NF"))
  ;; ASCII フォントを白源に
  (set-face-attribute 'default nil
                      :family "HackGen Console NF"
                      :height 140) ; 14pt (height は10倍の値)

  ;; 日本語フォントを白源に
  (set-fontset-font nil 'japanese-jisx0208
                    (font-spec :family "HackGen Console NF"))

  ;; 絵文字フォント（オプション）
  (when (x-list-fonts "Apple Color Emoji")
    (set-fontset-font nil 'unicode
                      (font-spec :family "Apple Color Emoji")
                      nil 'append)))

;;; カーソルの点滅設定
;; カーソルの点滅を有効にする
(blink-cursor-mode 1)
;; 無限に点滅させる（0 = 無限）
(setq blink-cursor-blinks 0)

;; リージョン内の行数と文字数をモードラインに表示する(範囲指定時のみ)
;; http://d.hatena.ne.jp/sonota88/20110224/1298557375
(defun my:count-lines-and-chars ()
  "Count lines and characters in the active region."
  (if mark-active
      (format " (%dL,%dC)"
              (count-lines (region-beginning) (region-end))
              (- (region-end) (region-beginning)))
    ""))

;; Add to mode-line
(setq-default mode-line-format
              (append mode-line-format
                      '((:eval (my:count-lines-and-chars)))))

;;; ヘッダーライン設定
;; ファイルパスをヘッダーラインに左寄せで表示
;; インアクティブなモードラインのスタイルに合わせる（控えめな表示）
(setq-default header-line-format
              '(:eval (if buffer-file-name
                          (abbreviate-file-name buffer-file-name)
                        "%b")))

(set-face-attribute 'header-line nil
                    :inherit 'mode-line-inactive)

;;; リージョン（選択範囲）の設定
;; 選択範囲でもシンタックスハイライトを維持する
;; 前景色（文字色）を変更しない
(set-face-attribute 'region nil
                    :foreground 'unspecified
                    :background "NavyBlue")

;;; 現在行のハイライト設定
;; hl-lineの背景色を暗くする
(set-face-attribute 'hl-line nil
                    :background "gray10")

;;; フレームサイズ
;; フルスクリーンにする
(set-frame-parameter nil 'fullscreen 'fullscreen)

(provide '02-frame)
;;; 02-frame.el ends here
