;; Common Lispパッケージを読み込む
(require 'cl)
;; Emacsからの質問をy/nで回答する
(fset 'yes-or-no-p 'y-or-n-p)
;; スタートアップメッセージを非表示
(setq inhibit-startup-screen t)

;;; パスの設定
(add-to-list 'exec-path "/usr/local/bin")

;;; タブ文字の表示幅
;; TABの表示幅
(setq-default tab-width 4) ; 初期値は8
;; インデントにタブ文字を使用しない
(setq-default indent-tabs-mode nil)

;;; cua-modeの矩形編集を利用
;; cua-modeをオン
(cua-mode t)
;; CUAキーバインドを無効にする
(setq cua-enable-cua-keys nil)

;;; カーソル位置のファイルパスやアドレスを "C-x C-f" で開く
(ffap-bindings)

;; ベル音を無効にする
(setq ring-bell-function 'ignore)

;; 同名バッファの識別文字列を変更する
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; バッファの自動再読み込み
(global-auto-revert-mode 1)
