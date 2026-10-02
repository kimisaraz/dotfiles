;;; 30-rg.el --- rg.el (ripgrep) configuration
;;
;;; Commentary:
;;
;; Configuration for rg.el - ripgrep integration for Emacs.

;;; Code:

(use-package rg
  :ensure t
  :config
  ;; rg.el の基本設定
  ;; プロジェクトルートからの検索を有効化
  (rg-enable-default-bindings))

(provide '30-rg)
;;; 30-rg.el ends here
