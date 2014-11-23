;; General
(keyboard-translate ?\C-h ?\C-?) ; C-hと<del>のキーシーケンスを置き換える
(global-set-key (kbd "C-x ?")   'help-command)
(global-set-key (kbd "M-k")     'kill-this-buffer)      ; ex kill-sentence
(global-set-key (kbd "M-,")     'bs-cycle-next)
(global-set-key (kbd "M-.")     'bs-cycle-previous)
(global-set-key (kbd "M-Y")     'cua-paste-pop)
(global-set-key (kbd "M-s I")   'imenu)
(global-set-key (kbd "M-s O")   'occur)

;; anzu
(global-set-key (kbd "M-%")   'anzu-query-replace) ; ex query-replace
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp) ; ex query-replace-regexp
(global-set-key (kbd "C-%")   'anzu-replace-at-cursor-thing)

;; auto-complete
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete) ; ex completion-at-point

;; direx
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)

;; expand-region
(global-set-key (kbd "C-@")   'er/expand-region) ; ex set-mark-command, cua-set-mark
(global-set-key (kbd "C-M-@") 'er/contract-region) ; ex mark-sexp

;; git-gutter+
(define-key git-gutter+-mode-map (kbd "C-c n") 'git-gutter+-next-hunk)
(define-key git-gutter+-mode-map (kbd "C-c p") 'git-gutter+-previous-hunk)
(define-key git-gutter+-mode-map (kbd "C-c d") 'git-gutter+-show-hunk)
(define-key git-gutter+-mode-map (kbd "C-c r") 'git-gutter+-revert-hunks)
(define-key git-gutter+-mode-map (kbd "C-c a") 'git-gutter+-stage-hunks)
(define-key git-gutter+-mode-map (kbd "C-c c") 'git-gutter+-commit)
(define-key git-gutter+-mode-map (kbd "C-c C") 'git-gutter+-stage-and-commit)
(define-key git-gutter+-mode-map (kbd "C-c U") 'git-gutter+-unstage-whole-buffer)

;; helm
(global-set-key (kbd "C-_")       'helm-resume)
(global-set-key (kbd "M-x")       'helm-M-x) ; ex execute-extended-command
(global-set-key (kbd "M-y")       'helm-show-kill-ring) ; ex yank-pop, cua-paste-pop
(global-set-key (kbd "C-x b")     'helm-mini) ; ex switch-to-buffer
(global-set-key (kbd "C-x B")     'helm-buffers-list)
(global-set-key (kbd "C-x C-f")   'helm-find-files) ; ex find-file, find-file-at-point
(global-set-key (kbd "C-x C-S-f") 'helm-recentf)
(global-set-key (kbd "M-s i")     'helm-imenu)
(global-set-key (kbd "M-s o")     'helm-occur)
(global-set-key (kbd "C-h a")     'helm-apropos) ; ex apropos-command
(define-key helm-map (kbd "C-M-n") 'helm-next-source)
(define-key helm-map (kbd "C-M-p") 'helm-previous-source)
(define-key helm-map (kbd "C-w")   'backward-kill-word) ; ex helm-yank-text-at-point
(define-key helm-map (kbd "C-S-w") 'helm-yank-text-at-point)

;; helm-ls-git
(global-set-key (kbd "C-x C-l")   'helm-ls-git-ls) ; ex downcase-region

;; point-undo
(global-set-key (kbd "M-[") 'point-undo)
(global-set-key (kbd "M-]") 'point-redo)

;; Mine
(global-set-key (kbd "M-K")       'my:pop-killed-file-name-list)
(global-set-key (kbd "M-o")       'my:other-window-or-split) ; ex prefix for facemenu-set-*
(global-set-key (kbd "C-w")       'my:kill-region-or-backward-kill-word) ; ex kill-region
(global-set-key (kbd "M-u")       'my:upcase-region-or-word) ; ex upcase-word
(global-set-key (kbd "M-l")       'my:downcase-region-or-word) ; ex downcase-word
(global-set-key (kbd "M-c")       'my:capitalize-region-or-word) ; ex capitalize-word
(global-set-key (kbd "C-x TAB")   'my:format-whole-buffer) ; ex indent-rigidly
(global-set-key (kbd "C-x S-TAB") 'my:indent-whole-buffer)
(global-set-key (kbd "M-s s")     'my:search-web-at-point-or-region)
