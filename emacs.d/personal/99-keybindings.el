;;; 99-keybindings.el --- Custom keybindings
;;
;;; Commentary:
;;
;; カスタムキーバインド設定

;;; Code:

;;; キーの解放
;; flyspell
(with-eval-after-load 'flyspell
  ;; C-;を解放(consult-bufferで使用するため)
  (define-key flyspell-mode-map (kbd "C-;") nil)) ; was flyspell-auto-correct-previous-word

;; prelude-mode
(with-eval-after-load 'prelude-mode
  ;; M-oを解放(my:other-window-or-splitで使用するため)
  (define-key prelude-mode-map (kbd "M-o") nil)
  ;; C-S-<return>を解放(org-insert-todo-headingで使用するため)
  (define-key prelude-mode-map [(control shift return)] nil)) ; was crux-smart-open-line-above

;; undo-tree
(with-eval-after-load 'undo-tree
  ;; C-_とM-_を解放(C-/とC-?にも割り当てられているのでそちらを使う)
  (define-key undo-tree-map (kbd "C-_") nil) ; was undo-tree-undo
  (define-key undo-tree-map (kbd "M-_") nil)) ; was undo-tree-redo

;;; キーの定義
;; General
(keyboard-translate ?\C-h ?\C-?) ; C-hをバックスペースに変更
(global-set-key (kbd "M-SPC")          'cycle-spacing) ; was just-one-space
(global-set-key (kbd "M-k")            'kill-this-buffer) ; was kill-sentence
(global-set-key (kbd "M-]")            'next-buffer)
(global-set-key (kbd "M-[")            'previous-buffer)
(global-set-key (kbd "C-x <C-return>") 'cua-set-rectangle-mark)
(global-set-key (kbd "M-Y")            'yank-pop)
;; TODO preludeデフォルトだとM-sがsmartparensに奪われてしまうのをなんとかする
;; (global-set-key (kbd "M-s M")          'imenu)
;; (global-set-key (kbd "M-s O")          'occur)

;; 多分不要
;; ;; Override macOS emoji input with easy-mark (Cmd+Ctrl+Space = C-M-SPC)
;; ;; easy-mark extends the selection with each press
;; (global-set-key (kbd "C-M-SPC") 'easy-mark)

;; anzu
(global-set-key (kbd "M-%")   'anzu-query-replace) ; was query-replacep
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp) ; was query-replace-regexp
(global-set-key (kbd "C-%")   'anzu-replace-at-cursor-thing)

;; consult
(global-set-key (kbd "C-;") 'consult-buffer) ; was flyspell-auto-correct-previous-word

;; crux
(global-set-key (kbd "M-O")     'crux-swap-windows)
(global-set-key (kbd "C-x TAB") 'crux-cleanup-buffer-or-region) ; was indent-rigidly

;; expand-region
(global-set-key (kbd "C-@")   'er/expand-region) ; was set-mark-command, cua-set-mark
(global-set-key (kbd "C-M-@") 'er/contract-region) ; was mark-sexp

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
(global-set-key (kbd "C-<") 'point-undo)
(global-set-key (kbd "C->") 'point-redo)

;; smartparens
(define-key sp-keymap (kbd "C-M-f") 'sp-forward-sexp) ; was forward-sexp
(define-key sp-keymap (kbd "C-M-b") 'sp-backward-sexp) ; was backward-sexp

;; vertico
(with-eval-after-load 'vertico
  ;; C-;でミニバッファを閉じる（consult-buffer のトグル動作）
  (define-key vertico-map (kbd "C-;") 'abort-recursive-edit))

;; TODO install
;; string-inflection
;; (global-set-key (kbd "M-U") 'string-inflection-upcase)
;; (global-set-key (kbd "M-L") 'string-inflection-underscore)
;; (global-set-key (kbd "M-C") 'string-inflection-camelcase)

;; Mine
(global-set-key (kbd "M-K")       'my:pop-killed-file-name-list)
(global-set-key (kbd "M-o")       'my:other-window-or-split) ; was prefix for facemenu-set-*
(global-set-key (kbd "C-w")       'my:kill-region-or-subword-backward-kill) ; was kill-region
(global-set-key (kbd "M-u")       'my:upcase-region-or-word) ; was upcase-word
(global-set-key (kbd "M-l")       'my:downcase-region-or-word) ; was downcase-word
(global-set-key (kbd "M-c")       'my:capitalize-region-or-word) ; was capitalize-word
(global-set-key (kbd "C-x S-TAB") 'my:indent-whole-buffer)

(provide '99-keybindings)
;;; 99-keybindings.el ends here
