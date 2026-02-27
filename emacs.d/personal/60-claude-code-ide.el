;;; 60-claude-code-ide.el --- Claude Code IDE 連携
;;
;;; Commentary:
;;
;; MCP (Model Context Protocol) を介した Claude Code の Emacs 連携。
;; Claude Code CLI (`claude`) がインストール済みで PATH に通っている必要がある。

;;; Code:

;; 依存パッケージ
(use-package inheritenv
  :ensure t)

;; GitHub からインストール (MELPA 未登録)
;; package-vc-install が MELPA の依存解決を行うため (例: websocket)、
;; 古いアーカイブキャッシュによる 404 を防ぐために事前にリフレッシュする。
(unless (package-installed-p 'claude-code-ide)
  (package-refresh-contents)
  (package-vc-install "https://github.com/manzaltu/claude-code-ide.el"))

(use-package claude-code-ide
  :bind ("C-c C-'" . claude-code-ide-menu)
  :custom
  (claude-code-ide-terminal-backend 'vterm)
  :config
  (claude-code-ide-emacs-tools-setup))

(provide '60-claude-code-ide)
;;; 60-claude-code-ide.el ends here
