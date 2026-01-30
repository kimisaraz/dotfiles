;; ファイルが #! から始まる場合、+xを付けて保存する
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; find-fileした際に、行末の空白をハイライトして表示する
(add-hook 'find-file-hook
          (lambda ()
            (setq-local show-trailing-whitespace t)))
