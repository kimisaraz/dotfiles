;;; disable-windmove.el --- windmoveのキーバインドを無効化
;;
;;; Commentary:
;;
;; このファイルはPreludeのコアモジュールより前にロードされる。
;; windmove-default-keybindingsにadviceをかけてキーバインドを設定させない。
;; windmoveのデフォルトキーバインド（Shift+矢印キー）を無効化し、
;; 代わりにM-o（my:other-window-or-split）でウィンドウ間を移動する。

;;; Code:

;; windmove-default-keybindingsを何もしないようにする
(defun my:disable-windmove-keybindings (orig-fun &rest args)
  "windmove-default-keybindingsを無効化するadvice。"
  nil)

(with-eval-after-load 'windmove
  (advice-add 'windmove-default-keybindings :around #'my:disable-windmove-keybindings))

(provide 'disable-windmove)
;;; disable-windmove.el ends here
