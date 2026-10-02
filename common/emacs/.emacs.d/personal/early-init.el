;;; early-init.el --- init.el より前に読み込まれる個人設定  -*- lexical-binding: t; -*-
;;
;;; Commentary:
;;
;; Prelude の early-init.el の最後に読み込まれる。
;; Prelude 側の設定を上書きできる。

;;; Code:

;; Homebrew の libgccjit には gcc ドライバが含まれないため
;; native compilation は失敗する。無効にして warning を抑制する。
;; パッケージはバイトコンパイル版で動作するので実用上の影響はない。
(setq native-comp-jit-compilation nil)
;; Prelude はインストール時の native compile を有効にしているので打ち消す
(setq package-native-compile nil)

;;; early-init.el ends here
