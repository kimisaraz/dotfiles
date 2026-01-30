;; ファイル名の設定
(set-file-name-coding-system 'cp932)
(setq locale-coding-system 'cp932)

;; 変換/無変換を無視
(global-set-key (kbd "<convert>")     'ignore)
(global-set-key (kbd "<non-convert>") 'ignore)
