;; Emacsからの質問をy/nで回答する
(fset 'yes-or-no-p 'y-or-n-p)
;; スタートアップメッセージを非表示
(setq inhibit-startup-screen t)

;;; パスの設定
(add-to-list 'exec-path "/usr/local/bin")

;;; インデントの設定
;; TABの表示幅
(setq-default tab-width 4) ; 初期値は8
;; インデントにタブ文字を使用しない
(setq-default indent-tabs-mode nil)

;;; 現在行のハイライト
(global-hl-line-mode t)

;;; 括弧の対応関係のハイライト
;; 対応する括弧を強調して表示する
(setq show-paren-delay 0) ; 表示までの秒数。初期値は0.125
(show-paren-mode t) ; 有効化
;; ;; parenのスタイル: expressionは括弧内も強調表示
;; (setq show-paren-style 'expression)
;; ;; フェイスを変更する
;; (set-face-background  'show-paren-match-face nil)
;; (set-face-underline-p  'show-paren-match-face "yellow")

;;; バックアップとオートセーブの設定
;; バックアップとオートセーブファイルを~/.emacs.d/backups/へ集める
(defvar my:backup-directory (expand-file-name "backups/" user-emacs-directory))
(add-to-list 'backup-directory-alist (cons "." my:backup-directory))
(setq auto-save-file-name-transforms `((".*", my:backup-directory t)))
;; オートセーブファイル作成までの秒間隔
(setq auto-save-timeout 60) ; 初期値は30
;; オートセーブファイル作成までのタイプ間隔
(setq auto-save-interval 150) ; 初期値は300

;;; cua-modeの矩形編集を利用
;; cua-modeをオン
(cua-mode t)
;; CUAキーバインドを無効にする
(setq cua-enable-cua-keys nil)

;;; シンボリックリンクの実体パスを参照する
(setq-default find-file-visit-truename t)

;;; カーソル位置のファイルパスやアドレスを "C-x C-f" で開く
(ffap-bindings)

;; ベル音を無効にする
(setq ring-bell-function 'ignore)

;; 同名バッファの識別文字列を変更する
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; バッファの自動再読み込み
(global-auto-revert-mode 1)

;;; ミニバッファ履歴の設定
(savehist-mode 1)
(setq history-length 500)
(setq history-delete-duplicates t)
