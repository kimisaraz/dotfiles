;; scroll-barを非表示
(scroll-bar-mode 0)
;; tool-barを非表示
(tool-bar-mode 0)
;; menu-barを非表示
(menu-bar-mode 0)

;;; モードラインに関する設定
;; カラム番号も表示
(column-number-mode t)
;; ファイルサイズを表示
;; (size-indication-mode t)
;; 時計を表示
(setq display-time-day-and-date t) ; 曜日・月・日を表示
(setq display-time-24hr-format t) ; 24時表示
(setq display-time-format "%m/%d(%a) %H:%M")
(display-time-mode t)
;; バッテリー残量を表示
;; (display-battery-mode t)
;; リージョン内の行数と文字数をモードラインに表示する（範囲指定時のみ）
;; http://d.hatena.ne.jp/sonota88/20110224/1298557375
(defun count-lines-and-chars ()
  (if mark-active
      (format "(%d,%d)"
              (count-lines (region-beginning) (region-end))
              (- (region-end) (region-beginning)))
    ""))

(add-to-list 'default-mode-line-format
             '(:eval (count-lines-and-chars)))

;;; タイトルバーの設定
;; %f: ファイルのフルパスを表示
;; %*: バッファが読み出し専用であれば%, 変更されていれば*, それ以外は-を表示
(setq frame-title-format "%f%*")
