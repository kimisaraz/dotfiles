;;; Basic
;; Default location to look for Org files
(setq org-directory (concat my:dropbox-directory "org/"))

;;; Tasks
;; 完了状態になった時、CLOSEDタイムスタンプを付与する
(setq org-log-done 'time)
