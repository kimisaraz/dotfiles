;;; 20-markdown.el --- Markdown mode configuration
;;
;;; Commentary:
;;
;; Markdown mode settings.
;; プレビュー用の変換コマンドに pandoc を使用する。
;;
;; プレビューのキーは markdown-mode-map にローカル定義されているため、
;; グローバルな C-c 系バインド（org など）とは衝突しない:
;;   C-c C-c l  markdown-live-preview-mode  ; Emacs 内 eww でライブプレビュー
;;   C-c C-c p  markdown-preview            ; ブラウザでプレビュー
;;   C-c C-c v  markdown-export-and-preview ; HTML 書き出し + ブラウザ
;;   C-c C-c e  markdown-export             ; HTML 書き出しのみ

;;; Code:

(use-package markdown-mode
  :ensure t
  :mode (("\\.md\\'"       . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
         ("README\\.md\\'" . gfm-mode))
  :custom
  ;; pandoc で GFM -> 単体 HTML5 に変換する。
  ;; リストで渡すとシェルのクォート処理を経ずに引数が渡るため安全。
  ;; --standalone で <head> を含む完結した HTML を出力し、プレビューが整う。
  (markdown-command '("pandoc"
                      "--from=gfm"
                      "--to=html5"
                      "--standalone"
                      "--metadata" "pagetitle=preview"))
  ;; ライブプレビューは横分割で表示する
  (markdown-live-preview-window-function #'markdown-live-preview-window-eww))

(provide '20-markdown)
;;; 20-markdown.el ends here
