;; commandキーをmetaとして使用する
(setq ns-command-modifier (quote meta))
;; optionキーをsuperとして使用する
(setq ns-alternate-modifier (quote super))

;; ファイルを開いたときに、新たなフレームを作らない
(setq ns-pop-up-frames nil)

;; ファイル名の設定
(require 'ucs-normalize)
(set-file-name-coding-system 'utf-8-hfs)
(setq locale-coding-system 'utf-8-hfs)

;; フレームをフルスクリーンにする
(toggle-frame-fullscreen)
