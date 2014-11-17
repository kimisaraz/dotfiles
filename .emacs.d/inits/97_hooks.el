;; ファイルが #! から始まる場合、+xを付けて保存する
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
