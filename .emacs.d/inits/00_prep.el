;; Common Lispパッケージを読み込む
(require 'cl)

(defvar my:dropbox-directory (expand-file-name "~/Dropbox/"))
(defvar my:backup-directory (expand-file-name "backups/" user-emacs-directory))
