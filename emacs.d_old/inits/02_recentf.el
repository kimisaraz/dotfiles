;; http://d.hatena.ne.jp/tomoya/20110217/1297928222
(setq recentf-save-file (expand-file-name "recentf" user-emacs-directory))
(setq recentf-max-saved-items 2000)
;; (setq recentf-auto-cleanup 10)
;; (run-with-idle-timer 30 t 'recentf-save-list)
;; (setq recentf-exclude '("recentf"))
(recentf-mode 1)
