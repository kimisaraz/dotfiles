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
         (file+headline (concat org-directory "agenda/tasks.org") "Inbox")
         "* TODO %?\n  %i")
        ("T" "Tasks (with timestamp)" entry
         (file+headline (concat org-directory "agenda/tasks.org") "Inbox")
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

;;; Tasks
;; 完了状態になった時、CLOSEDタイムスタンプを付与する
(setq org-log-done 'time)

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")))

;; 依存タスクが完了していない場合、DONE状態への変更をブロックする
(setq org-enforce-todo-dependencies t)

;; Enable org-habit
;; http://orgmode.org/manual/Tracking-your-habits.html
(add-to-list 'org-modules 'org-habit)

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
