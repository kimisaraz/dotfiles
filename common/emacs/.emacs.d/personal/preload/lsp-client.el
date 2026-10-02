;;; lsp-client.el --- Prelude の LSP クライアント選択
;;
;;; Commentary:
;;
;; Prelude 2.0 から LSP クライアントを `prelude-lsp-client' で選ぶようになった。
;; デフォルトは Eglot だが、lsp-mode を使い続けるためここで切り替える。
;; defcustom より前に設定する必要があるので preload/ に配置する。

;;; Code:

(setq prelude-lsp-client 'lsp-mode)

(provide 'lsp-client)
;;; lsp-client.el ends here
