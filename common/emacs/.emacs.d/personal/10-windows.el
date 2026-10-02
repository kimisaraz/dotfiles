;;; 10-windows.el --- Windows specific settings
;;
;;; Commentary:
;;
;; Windows環境でのみ有効になる設定

;;; Code:

(when (eq system-type 'windows-nt)
  ;;; 文字コード設定
  ;; ファイル名の文字コード設定
  (set-file-name-coding-system 'cp932)
  (setq locale-coding-system 'cp932)

  ;;; キーバインド
  ;; 変換/無変換キーを無効化
  (global-set-key (kbd "<convert>")     'ignore)
  (global-set-key (kbd "<non-convert>") 'ignore))

(provide '10-windows)
;;; 10-windows.el ends here
