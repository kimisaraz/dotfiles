;;; 45-denote.el --- Denote note-taking configuration
;;
;;; Commentary:
;;
;; Denote は、シンプルで効率的なノート管理システムです。
;; ファイル名ベースでメタデータを管理し、リンク機能やバックリンク、
;; タグによる分類をサポートします。
;;
;; この設定は denote マニュアルの 3.2 節の包括的な設定に基づいています。

;;; Code:

(use-package denote
  :ensure t
  :hook
  ((text-mode . denote-fontify-links-mode)
   (dired-mode . denote-dired-mode))
  :bind*
  (("C-c n n" . denote-create-note)
   ("C-c n o" . denote-open-or-create)
   ("C-c n s" . denote-create-note-in-subdirectory)
   ("C-c n d" . denote-dired)
   ("C-c n g" . denote-grep)
   ("C-c n l" . denote-link-or-create)
   ("C-c n L" . denote-link)
   ("C-c n b" . denote-backlinks)
   ("C-c n f" . denote-find-link)
   ("C-c n q c" . denote-query-contents-link)
   ("C-c n q f" . denote-query-filenames-link)
   ("C-c n r" . denote-rename-file)
   ("C-c n R" . denote-rename-file-using-front-matter))
  :bind
  ;; Dired モード専用キーバインド
  (:map dired-mode-map
   ("C-c C-d C-i" . denote-dired-link-marked-notes)
   ("C-c C-d C-r" . denote-dired-rename-files)
   ("C-c C-d C-k" . denote-dired-rename-marked-files-with-keywords)
   ("C-c C-d C-R" . denote-dired-rename-marked-files-using-front-matter))
  :config
  ;; ノート保存ディレクトリの設定（複数ディレクトリをリストで指定）
  ;; 末尾のスラッシュは denote が自動的に追加するため不要
  (setq denote-directory
        (list (expand-file-name "~/works/github.com/kimisaraz/notes/")
              (expand-file-name "~/works/github.com/kimisaraz/stpl_notes/")))

  ;; ファイル保存時の自動バッファ保存を無効化（手動保存が好ましい場合）
  (setq denote-save-buffers nil)

  ;; 事前定義されたキーワードのリスト
  (setq denote-known-keywords '("stpl" "project" "emacs" "denote" "org"))

  ;; 既存ファイルからキーワードを推論する
  (setq denote-infer-keywords t)

  ;; キーワードをアルファベット順にソート
  (setq denote-sort-keywords t)

  ;; ノート作成時のプロンプト設定
  ;; subdirectory
  ;; title: ノートのタイトル
  ;; keywords: キーワード(タグ)
  (setq denote-prompts '(subdirectory title keywords))

  ;; 除外するディレクトリの正規表現（nil = すべて含める）
  ;; assets と restricted を含めてすべてのサブディレクトリを管理対象にする
  (setq denote-excluded-directories-regexp nil)

  ;; 推論から除外するキーワードの正規表現
  (setq denote-keywords-to-not-infer-regexp nil)

  ;; リネーム時の確認動作
  ;; rewrite-front-matter: フロントマターの書き換え確認
  ;; modify-file-name: ファイル名変更の確認
  (setq denote-rename-confirmations '(rewrite-front-matter modify-file-name))

  ;; Org の日付選択インターフェースを使用
  (setq denote-date-prompt-use-org-read-date t)

  ;; バッファ名にノートのタイトルをタイトルを表示
  (denote-rename-buffer-mode 1)

  ;; denote 4.1.3 のバグ回避: 複数ディレクトリ使用時のパス検証を修正
  ;; denote-subdirectory-prompt が返す末尾スラッシュなしのパスと
  ;; denote-directories の末尾スラッシュありのパスを正しく比較する
  (defun denote--dir-in-denote-directory-p-fixed (directory)
    "Return non-nil if DIRECTORY is in variable `denote-directory'.
This is a fixed version that handles trailing slashes correctly."
    (let ((dir-normalized (file-name-as-directory (expand-file-name directory))))
      (seq-some
       (lambda (d)
         (string-prefix-p d dir-normalized))
       (denote-directories))))

  (advice-add 'denote--dir-in-denote-directory-p :override
              #'denote--dir-in-denote-directory-p-fixed))

(provide '45-denote)
;;; 45-denote.el ends here
