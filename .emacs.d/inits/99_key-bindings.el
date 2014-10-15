;; General
(keyboard-translate ?\C-h ?\C-?) ; C-hと<del>のキーシーケンスを置き換える
(global-set-key (kbd "C-x ?")   'help-command)
(global-set-key (kbd "M-o")     'other-window)          ; ex prefix for facemenu-set-*
(global-set-key (kbd "C-x C-l") 'toggle-truncate-lines) ; ex downcase-region
(global-set-key (kbd "M-k")     'kill-this-buffer)      ; ex kill-sentence
(global-set-key (kbd "M-,")     'bs-cycle-next)
(global-set-key (kbd "M-.")     'bs-cycle-previous)

;; auto-complete
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete) ; ex completion-at-point
