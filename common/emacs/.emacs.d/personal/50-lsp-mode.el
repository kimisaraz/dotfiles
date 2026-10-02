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
;; Prelude の prelude-ts は typescript-ts-mode にしか LSP を設定しないため、
;; tree-sitter の文法がなく typescript-mode で開いたときはここで起動する
(with-eval-after-load 'typescript-mode
  (add-hook 'typescript-mode-hook 'lsp))

;; JavaScript は Prelude の prelude-js が js-mode / js-ts-mode で
;; prelude-lsp-enable を呼ぶので、ここでは設定しない

(provide '50-lsp-mode)
;;; 50-lsp-mode.el ends here
