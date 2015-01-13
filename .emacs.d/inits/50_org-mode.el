;;; Basic
;; Default location to look for Org files
(setq org-directory (concat my:dropbox-directory "org/"))

(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))

;;; Agenda
;; The files to be used for agenda display
(setq org-agenda-files (list org-directory))

;;; Tasks
;; 完了状態になった時、CLOSEDタイムスタンプを付与する
(setq org-log-done 'time)

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
