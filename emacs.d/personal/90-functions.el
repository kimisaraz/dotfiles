;;; 90-functions.el --- Custom utility functions
;;
;;; Commentary:

;; My custom utility functions.

;;; Code:

(require 'subword)

;; 最近閉じたバッファを復元
;; http://d.hatena.ne.jp/kitokitoki/20100608/p2
(defvar my:killed-file-name-list nil)
(defun my:push-killed-file-name-list ()
  "Push the file name of the killed buffer to the list."
  (when (buffer-file-name)
    (push (expand-file-name (buffer-file-name)) my:killed-file-name-list)))
(defun my:pop-killed-file-name-list ()
  "Pop and open the most recently killed file."
  (interactive)
  (unless (null my:killed-file-name-list)
    (find-file (pop my:killed-file-name-list))))
;; kill-buffer-hook (バッファを消去するときのフック) に関数を追加
(add-hook 'kill-buffer-hook 'my:push-killed-file-name-list)

;; ウィンドウが分割していればウィンドウを切り替える
;; 分割していなければ分割する
;; http://d.hatena.ne.jp/rubikitch/20100210/emacs
(defun my:other-window-or-split ()
  "Switch to other window, or split horizontally if only one window."
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))

;; リージョンが活性化していればリージョンを削除
;; 非活性であれば直前の単語を削除
;; http://d.hatena.ne.jp/kiwanami/20091222/1261504543
(defun my:kill-region-or-subword-backward-kill ()
  "Kill region if active, otherwise kill previous subword."
  (interactive)
  (if (region-active-p)
      (kill-region (point) (mark))
    (subword-backward-kill 1)))

;; リージョンが活性化していればリージョンを、非活性であれば単語を大文字化
(defun my:upcase-region-or-word ()
  "Upcase region if active, otherwise upcase word."
  (interactive)
  (if (region-active-p)
      (upcase-region (point) (mark))
    (upcase-word 1)))

;; リージョンが活性化していればリージョンを、非活性であれば単語を小文字化
(defun my:downcase-region-or-word ()
  "Downcase region if active, otherwise downcase word."
  (interactive)
  (if (region-active-p)
      (downcase-region (point) (mark))
    (downcase-word 1)))

;; リージョンが活性化していればリージョンを、非活性であれば単語をキャピタライズ
(defun my:capitalize-region-or-word ()
  "Capitalize region if active, otherwise capitalize word."
  (interactive)
  (if (region-active-p)
      (capitalize-region (point) (mark))
    (capitalize-word 1)))

;; バッファ全体をインデント
(defun my:indent-whole-buffer ()
  "Indent the entire buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

;; バッファ全体をフォーマット
(defun my:format-whole-buffer ()
  "Format the entire buffer by indenting and removing trailing whitespace."
  (interactive)
  (indent-region (point-min) (point-max))
  (delete-trailing-whitespace))

;; 現在日付を入力
(defun my:insert-today()
  "Insert today's date in YYYY-MM-DD format."
  (interactive)
  (insert (format-time-string "%Y-%m-%d" (current-time))))

;; 現在時刻を入力
(defun my:insert-now()
  "Insert current time in HH:MM:SS format."
  (interactive)
  (insert (format-time-string "%H:%M:%S" (current-time))))

;; 現在のファイルパスをクリップボードにコピー
(defun my:copy-file-path (&optional absolute)
  "Copy the current buffer's file path to the clipboard."
  (interactive "P")
  (let ((file-path (buffer-file-name)))
    (if (not file-path)
        (message "Buffer is not visiting a file")
      (let* ((project-root (and (fboundp 'projectile-project-root)
                                (projectile-project-root)))
             (path-to-copy (cond
                            (absolute file-path)
                            (project-root (file-relative-name file-path project-root))
                            (t file-path))))
        (kill-new path-to-copy)
        (message "Copied: %s" path-to-copy)))))

;; クリップボードのURLからタイトルを取得してorg-link形式で挿入
(defun my:url-to-org ()
  "Insert org-mode link from URL in clipboard with auto-fetched title."
  (interactive)
  (let ((url (or (and (fboundp 'gui-get-selection)
                      (gui-get-selection 'CLIPBOARD))
                 (current-kill 0 t))))
    (if (not (string-prefix-p "http" url))
        (message "Error: No valid URL in clipboard")
      (message "Fetching title for: %s" url)
      (let ((title (my:fetch-url-title url)))
        (if title
            (insert (org-link-make-string url title))
          (message "Error: Failed to fetch title"))))))

(defun my:fetch-url-title (url)
  "Fetch the title of the webpage at URL."
  (condition-case err
      (with-current-buffer (url-retrieve-synchronously url t nil 5)
        (goto-char (point-min))
        (when (re-search-forward "<title>\\([^<]+\\)</title>" nil t)
          (let ((title (match-string 1)))
            (kill-buffer)
            (string-trim (decode-coding-string title 'utf-8)))))
    (error
     (message "Error fetching URL: %s" (error-message-string err))
     nil)))

;; GitHub URL を org-mode 用に変換して挿入(C-u prefix 付きでコピー)
(defun my:gh-url-to-org (url &optional copy-only)
  "Convert GitHub PR/Issue URL to text with org-mode link."
  (interactive
   (list (let ((clipboard-content (or (and (fboundp 'gui-get-selection)
                                            (gui-get-selection 'CLIPBOARD))
                                       (current-kill 0 t))))
           (read-string "GitHub PR/Issue URL: "
                        (when (and clipboard-content
                                   (string-prefix-p "https://github.com/" clipboard-content))
                          clipboard-content)))
         current-prefix-arg))
  (cond
   ;; Pull Request
   ((string-match "github\\.com/\\([^/]+\\)/\\([^/]+\\)/pull/\\([0-9]+\\)" url)
    (let* ((org (match-string 1 url))
           (repo (match-string 2 url))
           (number (match-string 3 url))
           (has-comment (string-match "#discussion" url))
           (clean-url (if has-comment
                          url
                        (format "https://github.com/%s/%s/pull/%s" org repo number)))
           (link-text (if has-comment
                          (format "%s#%s (comment)" repo number)
                        (format "%s#%s" repo number)))
           (command (format "gh pr view %s --repo %s/%s --json title --jq '.title'" number org repo))
           (title (string-trim (shell-command-to-string command))))
      (if (string-prefix-p "error" title)
          (message "Error: Failed to fetch PR information from GitHub")
        (let ((org-line (format "%s %s" title (org-link-make-string clean-url link-text))))
          (if copy-only
              (progn
                (kill-new org-line)
                (message "Copied: %s" org-line))
            (insert org-line)
            (message "Inserted: %s" org-line))))))
   ;; Issue
   ((string-match "github\\.com/\\([^/]+\\)/\\([^/]+\\)/issues/\\([0-9]+\\)" url)
    (let* ((org (match-string 1 url))
           (repo (match-string 2 url))
           (number (match-string 3 url))
           (clean-url (format "https://github.com/%s/%s/issues/%s" org repo number))
           (command (format "gh issue view %s --repo %s/%s --json title --jq '.title'" number org repo))
           (title (string-trim (shell-command-to-string command))))
      (if (string-prefix-p "error" title)
          (message "Error: Failed to fetch issue information from GitHub")
        (let ((org-line (format "%s %s" title (org-link-make-string clean-url (format "%s#%s" repo number)))))
          (if copy-only
              (progn
                (kill-new org-line)
                (message "Copied: %s" org-line))
            (insert org-line)
            (message "Inserted: %s" org-line))))))
   ;; Invalid URL
   (t (message "Error: Invalid GitHub PR/Issue URL format"))))

(provide '90-functions)
;;; 90-functions.el ends here
