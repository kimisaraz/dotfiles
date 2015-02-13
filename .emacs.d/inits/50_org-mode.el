;;; Basic
;; Default location to look for Org files
(setq org-directory (concat my:dropbox-directory "org/"))

(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))

;;; Capture
;; Default target for storing notes
(setq org-default-notes-file (concat org-directory "agenda/tasks.org"))

;; Capture templates
(setq org-capture-templates
      '(("t" "Tasks" entry
         (file+headline nil "Inbox")
         "* TODO %?\n  %i")
        ("T" "Tasks (with timestamp)" entry
         (file+headline nil "Inbox")
         "* TODO %?\n  %U\n  %i\n  %a")
        ("j" "Journal" entry
         (file+datetree (concat org-directory "journal.org"))
         "* %?\n  %i")
        ("J" "Journal (with timestamp and annotation)" entry
         (file+datetree (concat org-directory "journal.org"))
         "* %?\n  %U\n  %i\n  %a"))
      )

;;; Agenda
;; The files to be used for agenda display
(setq org-agenda-files (list (concat org-directory "agenda")))

;; 時間表示が1桁のとき、0埋めで表示する
(setq org-agenda-time-leading-zero t)

;;; Tasks
;; 完了状態になった時、CLOSEDタイムスタンプを付与する
(setq org-log-done 'time)

;; 状態の変化をLOGBOOK drawerに保存する
(setq org-log-into-drawer t)

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "|" "CANCELED(c)")))

;; 依存タスクが完了していない場合、DONE状態への変更をブロックする
(setq org-enforce-todo-dependencies t)

;; 未完了のチェックボックスを持つエントリーがDONE状態になるのをブロックする
(setq org-enforce-todo-checkbox-dependencies t)

;; Enable org-habit
;; http://orgmode.org/manual/Tracking-your-habits.html
(add-to-list 'org-modules 'org-habit)

;;; Tags
;; タグ列
(setq org-tags-column -80)

;;; Properties
;; グローバルプロパティの定義
(setq org-global-properties
      '(("rating_ALL". "1 2 3 4 5")
        ("STYLE_ALL". "habit")))

;;; Babel
;; http://orgmode.org/worg/org-contrib/babel/languages/ob-doc-dot.html
(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t)
   (emacs-lisp . t)))

;; http://orgmode.org/manual/Code-evaluation-security.html#Code-evaluation-security
(defun my:org-confirm-babel-evaluate (lang body)
  (not (string= lang "dot")))
(setq org-confirm-babel-evaluate 'my:org-confirm-babel-evaluate)

;; Edit 'dot' code blocks on graphviz-dot-mode
(add-to-list 'org-src-lang-modes '("dot" . graphviz-dot))

;; Fontify code in code blocks
(setq org-src-fontify-natively t)

;;; Export
(setq org-export-with-sub-superscripts nil)
