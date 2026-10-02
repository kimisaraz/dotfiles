;;; 15-vterm.el --- vterm 設定
;;
;;; Commentary:
;;
;; vterm ターミナルエミュレータの設定。
;; prelude-mode (グローバル minor mode) のキーバインド (例: C-a) が
;; ターミナルへのキー送信を横取りするのを、emulation-mode-map-alists で上書きする。
;; prelude-mode 自体は無効にしない (グローバルなので他バッファに影響するため)。

;;; Code:

;; vterm バッファで prelude-mode のキーバインドより優先するキーマップ
(defvar my/vterm-override-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-a") #'vterm--self-insert)
    (define-key map (kbd "C-b") #'vterm--self-insert)
    map)
  "vterm バッファで prelude-mode より優先するキーマップ。")

(defvar my/vterm-override-mode-alist
  `((vterm-override-keys . ,my/vterm-override-map))
  "emulation-mode-map-alists 用の alist。")

(defvar-local vterm-override-keys nil
  "non-nil のとき my/vterm-override-map を有効にする。")

(use-package vterm
  :ensure t
  :config
  ;; emulation-mode-map-alists は全 minor mode より優先される
  (add-to-list 'emulation-mode-map-alists 'my/vterm-override-mode-alist)
  :hook
  (vterm-mode . (lambda ()
                  (setq-local vterm-override-keys t)
)))

(provide '15-vterm)
;;; 15-vterm.el ends here
