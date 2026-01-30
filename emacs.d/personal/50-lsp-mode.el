;;; 50-lsp-mode.el --- LSP configuration for various languages
;;
;;; Commentary:
;;
;; LSP mode configuration for Ruby, TypeScript, and JavaScript

;;; Code:

(with-eval-after-load 'lsp-mode
  ;; プロジェクトルートを自動検出
  (setq lsp-auto-guess-root t)

  ;; プロジェクトルートマーカー
  ;; .git, Gemfile, package.jsonなどでプロジェクトを認識
  (setq lsp-project-root-markers
        '(".git" "Gemfile" "package.json" "tsconfig.json" "jsconfig.json" ".projectile"))

  ;; 毎回プロジェクトを尋ねない
  (setq lsp-auto-configure t))

;; Ruby用LSP設定は無効化
;; (with-eval-after-load 'ruby-mode
;;   (setq lsp-disabled-clients '(ruby-lsp-ls rubocop-ls))
;;   (setq lsp-solargraph-use-bundler nil)
;;   (add-hook 'ruby-mode-hook 'lsp))

;; TypeScript用LSP設定
(with-eval-after-load 'typescript-mode
  (add-hook 'typescript-mode-hook 'lsp))

;; JavaScript用LSP設定
(with-eval-after-load 'js-mode
  (add-hook 'js-mode-hook 'lsp))

(provide '50-lsp-mode)
;;; 50-lsp-mode.el ends here
