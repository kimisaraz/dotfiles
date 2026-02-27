;;; early-init.el --- init.el より前に読み込まれる設定
;;
;;; Commentary:
;;
;; Emacs 27+ で init.el より前に評価される。

;;; Code:

;; Homebrew の libgccjit には gcc ドライバが含まれないため
;; JIT native compilation は失敗する。無効にして warning を抑制する。
;; パッケージはバイトコンパイル版で動作するので実用上の影響はない。
(setq native-comp-jit-compilation nil)

;;; early-init.el ends here
