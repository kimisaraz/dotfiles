;;; 01-general.el --- General Emacs settings
;;
;;; Commentary:
;;
;; General behavior and UI settings.

;;; Code:

;;; ロケール設定
;; 時刻表示を日本語にする（org-mode のタイムスタンプなどに影響）
(setq system-time-locale "ja_JP.UTF-8")

;;; 文字コード設定
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;;; カレンダー設定
(with-eval-after-load 'calendar
  ;; 曜日を1文字の日本語で表示
  (setq calendar-day-name-array ["日" "月" "火" "水" "木" "金" "土"])
  ;; カレンダーのヘッダー部分も日本語に
  (setq calendar-day-header-array ["日" "月" "火" "水" "木" "金" "土"])
  ;; 週の開始を月曜日に設定
  (setq calendar-week-start-day 1)

  ;; 今日をマークする
  (add-hook 'calendar-today-visible-hook 'calendar-mark-today)

  ;; 祝日をマークする
  (setq calendar-mark-holidays-flag t)
  (add-hook 'calendar-today-visible-hook 'calendar-mark-holidays)
  (add-hook 'calendar-today-invisible-hook 'calendar-mark-holidays))

;; 祝日をカレンダーに表示
(use-package japanese-holidays
  :ensure t
  :config
  (with-eval-after-load 'calendar
    (setq calendar-holidays japanese-holidays)))

;; Emacsからの質問をy/nで回答する
(fset 'yes-or-no-p 'y-or-n-p)
;; スタートアップメッセージを非表示
(setq inhibit-startup-screen t)

;; Emacsの終了時に確認する
(setq confirm-kill-emacs 'y-or-n-p)

;;; 選択範囲のハイライト
;; 選択範囲（リージョン）をハイライト表示する
(transient-mark-mode 1)

;;; インデントの設定
;; TABの表示幅
(setq-default tab-width 2) ; 初期値は8
;; インデントにタブ文字を使用しない
(setq-default indent-tabs-mode nil)

;;; cua-modeの矩形編集を利用
;; cua-set-rectangle-markのデフォルトキーバインド(<C-return>)を無効にする
(setq cua-rectangle-mark-key [])
;; cua-modeをオン
(cua-mode t)
;; CUAキーバインドを無効にする
(setq cua-enable-cua-keys nil)
;; cua-global-keymapのリマップを削除
;; 矩形編集機能だけを使用し、他のコマンドへの影響を排除
(with-eval-after-load 'cua-base
  ;; スクロール系
  (define-key cua-global-keymap [remap scroll-up] nil)
  (define-key cua-global-keymap [remap scroll-down] nil)
  (define-key cua-global-keymap [remap scroll-up-command] nil)
  (define-key cua-global-keymap [remap scroll-down-command] nil)
  ;; yank/paste系
  (define-key cua-global-keymap [remap yank] nil)
  (define-key cua-global-keymap [remap clipboard-yank] nil)
  (define-key cua-global-keymap [remap x-clipboard-yank] nil)
  (define-key cua-global-keymap [remap yank-pop] nil)
  ;; mark系
  (define-key cua-global-keymap [remap set-mark-command] nil)
  (define-key cua-global-keymap [remap exchange-point-and-mark] nil))

;;; スクロール設定
;; バッファの端でスクロールしようとした時、エラーではなく端にカーソルを移動
(setq scroll-error-top-bottom t)

;;; シンボリックリンクの実体パスを参照する
(setq-default find-file-visit-truename t)

;;; カーソル位置のファイルパスやアドレスを "C-x C-f" で開く
(ffap-bindings)

;; ベル音を無効にする
(setq ring-bell-function 'ignore)

;; バッファの自動再読み込み
(global-auto-revert-mode 1)

;;; 同名バッファの識別文字列を変更する
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;;; ミニバッファ履歴の設定
(savehist-mode 1)
(setq history-length 500)
(setq history-delete-duplicates t)

;;; *scratch*バッファの初期メッセージを非表示にする
(setq initial-scratch-message nil)

;;; recentf設定
;; 最近開いたファイルの最大保存数を増やす
(setq recentf-max-saved-items 2000)
;; 除外するファイルパターン
(setq recentf-exclude '(".recentf"))
;; 存在しないファイルを自動クリーンアップ
(setq recentf-auto-cleanup 10)
;; 30秒ごとに自動保存（強制終了時のデータ喪失を防ぐ）
(run-with-idle-timer 30 t 'recentf-save-list)

;;; xref設定（検索バックエンド）
;; xref-find-references、project-find-regexp、denote-grep などで使用される
;; ripgrep (rg) があれば使用し、なければ grep を使用
(when (>= emacs-major-version 28)
  (setq xref-search-program
        (if (executable-find "rg")
            'ripgrep
          'grep)))

;;; ファイルタイプとモードの関連付け
;; mode→拡張子順で定義する
(setq auto-mode-alist
      (append '(
                ("Dockerfile\\'" . dockerfile-mode)
                ("\\.schema\\'" . ruby-mode)
                ("\\.bashrc\\'" . sh-mode)
                ("\\.envrc\\'" . sh-mode)
                ("\\.zshrc\\'" . sh-mode)
                )
              auto-mode-alist))

(provide '01-general)
;;; 01-general.el ends here
