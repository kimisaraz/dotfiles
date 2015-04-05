;; General
(keyboard-translate ?\C-h ?\C-?) ; C-hをバックスペースにする
(global-set-key (kbd "C-x C-S-j")      'dired-jump)
(global-set-key (kbd "C-x <C-return>") 'cua-set-rectangle-mark)
(global-set-key (kbd "M-k")            'kill-this-buffer) ; was kill-sentence
(global-set-key (kbd "M-,")            'bs-cycle-next)
(global-set-key (kbd "M-.")            'bs-cycle-previous)
(global-set-key (kbd "M-Y")            'cua-paste-pop)
(global-set-key (kbd "M-s I")          'imenu)
(global-set-key (kbd "M-s O")          'occur)

;; anzu
(global-set-key (kbd "M-%")   'anzu-query-replace) ; was query-replace
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp) ; was query-replace-regexp
(global-set-key (kbd "C-%")   'anzu-replace-at-cursor-thing)

;; auto-complete
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete) ; was completion-at-point
(define-key ac-menu-map (kbd "C-n") 'next-line) ; was ac-next
(define-key ac-menu-map (kbd "C-p") 'previous-line) ; was ac-previous

;; direx
(global-set-key (kbd "C-x C-j") 'my:direx-jump-to-project-root-other-window) ; was dired-jump

;; duplicate-thing
(global-set-key (kbd "C-M-y") 'duplicate-thing)

;; expand-region
(global-set-key (kbd "C-@")   'er/expand-region) ; was set-mark-command, cua-set-mark
(global-set-key (kbd "C-M-@") 'er/contract-region) ; was mark-sexp

;; git-gutter+
(define-key git-gutter+-mode-map (kbd "C-c g n") 'git-gutter+-next-hunk)
(define-key git-gutter+-mode-map (kbd "C-c g p") 'git-gutter+-previous-hunk)
(define-key git-gutter+-mode-map (kbd "C-c g d") 'git-gutter+-show-hunk)
(define-key git-gutter+-mode-map (kbd "C-c g r") 'git-gutter+-revert-hunks)
(define-key git-gutter+-mode-map (kbd "C-c g s") 'git-gutter+-stage-hunks)
(define-key git-gutter+-mode-map (kbd "C-c g c") 'git-gutter+-commit)
(define-key git-gutter+-mode-map (kbd "C-c g C") 'git-gutter+-stage-and-commit)
(define-key git-gutter+-mode-map (kbd "C-c g U") 'git-gutter+-unstage-whole-buffer)

;; helm
(global-set-key (kbd "C-;")       'helm-mini)
(global-set-key (kbd "C-_")       'helm-resume)
(global-set-key (kbd "M-x")       'helm-M-x) ; was execute-extended-command
(global-set-key (kbd "M-y")       'helm-show-kill-ring) ; was yank-pop, cua-paste-pop
(global-set-key (kbd "C-x b")     'helm-buffers-list) ; was switch-to-buffer
(global-set-key (kbd "C-x B")     'helm-recentf)
(global-set-key (kbd "C-x C-f")   'helm-find-files) ; was find-file, find-file-at-point
(global-set-key (kbd "M-s i")     'helm-imenu)
(global-set-key (kbd "M-s o")     'helm-occur)
(global-set-key (kbd "C-h a")     'helm-apropos) ; was apropos-command
(define-key helm-map (kbd "C-M-n") 'helm-next-source)
(define-key helm-map (kbd "C-M-p") 'helm-previous-source)
(define-key helm-map (kbd "C-w")   'backward-kill-word) ; was helm-yank-text-at-point
(define-key helm-map (kbd "C-S-w") 'helm-yank-text-at-point)

;; helm-ag
(global-set-key (kbd "M-s a") 'helm-ag)
(global-set-key (kbd "M-s p") 'helm-ag-project-root)

;; helm-ls-git
(global-set-key (kbd "C-x C-l")   'helm-ls-git-ls) ; was downcase-region

;; helm-swoop
(define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
(define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
(define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
(define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; open-junk-file
(global-set-key (kbd "C-x j") 'open-junk-file)

;; org
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c C-l") 'org-insert-link-global)
(global-set-key (kbd "C-c C-o") 'org-open-at-point-global)
(define-key org-mode-map (kbd "C-S-f") 'org-shiftright)
(define-key org-mode-map (kbd "C-S-b") 'org-shiftleft)
(define-key org-mode-map (kbd "C-S-p") 'org-shiftup)
(define-key org-mode-map (kbd "C-S-n") 'org-shiftdown)
(define-key org-mode-map (kbd "M-F")   'org-metaright)
(define-key org-mode-map (kbd "M-B")   'org-metaleft)
(define-key org-mode-map (kbd "M-P")   'org-metaup)
(define-key org-mode-map (kbd "M-N")   'org-metadown)

;; point-undo
(global-set-key (kbd "M-[") 'point-undo)
(global-set-key (kbd "M-]") 'point-redo)

;; popwin
(global-set-key (kbd "C-^") popwin:keymap)

;; smartparens
(define-key sp-keymap (kbd "C-M-f") 'sp-forward-sexp) ; was forward-sexp
(define-key sp-keymap (kbd "C-M-b") 'sp-backward-sexp) ; was backward-sexp

;; string-inflection
(global-set-key (kbd "M-U") 'string-inflection-upcase)
(global-set-key (kbd "M-L") 'string-inflection-underscore)
(global-set-key (kbd "M-C") 'string-inflection-camelcase)

;; Mine
(global-set-key (kbd "M-K")       'my:pop-killed-file-name-list)
(global-set-key (kbd "M-o")       'my:other-window-or-split) ; was prefix for facemenu-set-*
(global-set-key (kbd "C-w")       'my:kill-region-or-backward-kill-word) ; was kill-region
(global-set-key (kbd "M-u")       'my:upcase-region-or-word) ; was upcase-word
(global-set-key (kbd "M-l")       'my:downcase-region-or-word) ; was downcase-word
(global-set-key (kbd "M-c")       'my:capitalize-region-or-word) ; was capitalize-word
(global-set-key (kbd "C-x TAB")   'my:format-whole-buffer) ; was indent-rigidly
(global-set-key (kbd "C-x S-TAB") 'my:indent-whole-buffer)
(global-set-key (kbd "M-s s")     'my:search-web-at-point-or-region)
(global-set-key (kbd "M-s M-s")   'my:search-web-at-point-or-region)
