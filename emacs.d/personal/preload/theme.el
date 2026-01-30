;;; theme.el --- Prelude テーマ設定
;;
;;; Commentary:
;;
;; Prelude で使用するテーマを選択。
;; preload/ に配置することで、Prelude のテーマ自動ロード機能を使う。

;;; Code:

;; ===== テーマ選択 =====
;; modus-vivendi のバリエーションから選択:

(setq prelude-theme 'modus-vivendi)
;; (setq prelude-theme 'modus-vivendi-tinted)        ;; 夜空の印象
;; (setq prelude-theme 'modus-vivendi-deuteranopia)  ;; 赤緑色覚異常対応
;; (setq prelude-theme 'modus-vivendi-tritanopia)    ;; 青黄色覚異常対応

(provide 'theme)
;;; theme.el ends here
