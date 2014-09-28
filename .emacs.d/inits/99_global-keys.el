;; (keyboard-translate ?\C-h ?\C-?) ; C-hと<del>を置き換える
(define-key global-map (kbd "C-h")     'delete-backward-char)
(define-key global-map (kbd "C-x ?")   'help-command)
(define-key global-map (kbd "M-o")     'other-window)
(define-key global-map (kbd "C-x C-l") 'toggle-truncate-lines)
(define-key global-map (kbd "M-k")     'kill-this-buffer)
