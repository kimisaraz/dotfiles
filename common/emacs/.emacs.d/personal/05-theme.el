;;; 05-theme.el --- Modus themes カスタマイズ
;;
;;; Commentary:
;;
;; modus-themes のカスタマイズ。
;; Emacs 29.4 組み込みの modus-themes でも動作する基本的な設定。

;;; Code:

;; ===== Modus Themes カスタマイズ =====
;; 基本的な外観設定（コメントを外して有効化）

;; ボールド体の使用
;; (setq modus-themes-bold-constructs t)

;; イタリック体の使用
;; (setq modus-themes-italic-constructs t)

;; プロンプトの重み（nil, t, 'intense）
;; (setq modus-themes-prompts nil)

;; モードラインのスタイル（nil, '3d, 'moody, 'borderless-3d, 'borderless-moody）
(setq modus-themes-mode-line 'borderless-moody)

;; リンクの下線（nil, t, 'neutral-underline, 'no-color）
;; (setq modus-themes-links nil)

;; 補完フレームワークの外観（nil, 'moderate, 'opinionated）
;; (setq modus-themes-completions nil)

;; ===== カスタム設定例 =====
;; より視認性を高めたい場合の設定例:
;; (setq modus-themes-bold-constructs t
;;       modus-themes-italic-constructs t
;;       modus-themes-prompts '(bold intense)
;;       modus-themes-completions 'moderate)

;; ===== 注意 =====
;; 最新の modus-themes (4.0+) をインストールすると、
;; より多くのカスタマイズオプション（プリセットなど）が使用可能になります。
;; インストール方法: M-x package-install RET modus-themes RET

(provide '05-theme)
;;; 05-theme.el ends here
