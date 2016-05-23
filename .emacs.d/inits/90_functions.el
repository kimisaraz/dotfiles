;; 最近閉じたバッファを復元
;; http://d.hatena.ne.jp/kitokitoki/20100608/p2
(defvar my:killed-file-name-list nil)
(defun my:push-killed-file-name-list ()
  (when (buffer-file-name)
    (push (expand-file-name (buffer-file-name)) my:killed-file-name-list)))
(defun my:pop-killed-file-name-list ()
  (interactive)
  (unless (null my:killed-file-name-list)
    (find-file (pop my:killed-file-name-list))))
;; kill-buffer-hook (バッファを消去するときのフック) に関数を追加
(add-hook 'kill-buffer-hook 'my:push-killed-file-name-list)

;; ウィンドウが分割していればウィンドウを切り替える
;; 分割していなければ分割する
;; http://d.hatena.ne.jp/rubikitch/20100210/emacs
(defun my:other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))

;; リージョンが活性化していればリージョンを削除
;; 非活性であれば直前の単語を削除
;; http://d.hatena.ne.jp/kiwanami/20091222/1261504543
(defun my:kill-region-or-subword-backward-kill ()
  (interactive)
  (if (region-active-p)
      (kill-region (point) (mark))
    (subword-backward-kill 1)))

;; リージョンが活性化していればリージョンを、非活性であれば単語を大文字化
(defun my:upcase-region-or-word ()
  (interactive)
  (if (region-active-p)
      (upcase-region (point) (mark))
    (upcase-word 1)))

;; リージョンが活性化していればリージョンを、非活性であれば単語を小文字化
(defun my:downcase-region-or-word ()
  (interactive)
  (if (region-active-p)
      (downcase-region (point) (mark))
    (downcase-word 1)))

;; リージョンが活性化していればリージョンを、非活性であれば単語をキャピタライズ
(defun my:capitalize-region-or-word ()
  (interactive)
  (if (region-active-p)
      (capitalize-region (point) (mark))
    (capitalize-word 1)))

;; バッファを全体をインデント
(defun my:indent-whole-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

;; バッファを全体をフォーマット
(defun my:format-whole-buffer ()
  (interactive)
  (indent-region (point-min) (point-max))
  (delete-trailing-whitespace))

;; 現在日付を入力
(defun my:insert-today()
  (interactive)
  (insert (format-time-string "%Y-%m-%d" (current-time))))

;; 現在時刻を入力
(defun my:insert-now()
  (interactive)
  (insert (format-time-string "%H:%M:%S" (current-time))))
