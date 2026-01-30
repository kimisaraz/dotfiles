;;; 40-org-mode.el --- Org-mode customizations
;;
;;; Commentary:
;;
;; Org-mode behavior customizations.

;;; Code:

(with-eval-after-load 'org
  ;;; Agenda設定
  ;; アジェンダファイルの場所
  (setq org-agenda-files '("~/works/github.com/kimisaraz/notes/"
                           "~/works/github.com/kimisaraz/stpl_notes/"))

  ;; 時間表示が1桁のとき、0埋めで表示する
  (setq org-agenda-time-leading-zero t)

  ;; 完了状態のタイムスタンプ/スケジュール/デッドラインは表示しない
  ;; (setq org-agenda-skip-timestamp-if-done t)
  ;; (setq org-agenda-skip-scheduled-if-done t)
  ;; (setq org-agenda-skip-deadline-if-done t)

  ;; 日付をYYYY-MM-DD 曜日形式で表示（祝日名を含む）
  (defun org-agenda-format-date-aligned (date)
    "Format a DATE string for display in the daily/weekly agenda."
    (require 'calendar)
    (let* ((dayname (aref calendar-day-name-array
                          (calendar-day-of-week date)))
           (day (cadr date))
           (month (car date))
           (year (nth 2 date))
           (holiday-list (calendar-check-holidays date)))
      (if holiday-list
          (format "%4d-%02d-%02d %s %s"
                  year month day dayname (car holiday-list))
        (format "%4d-%02d-%02d %s"
                year month day dayname))))
  (setq org-agenda-format-date 'org-agenda-format-date-aligned)

  ;;; タスク設定
  ;; C-c C-t で選択メニューを表示し、ワークフローごとに選択可能にする
  (setq org-use-fast-todo-selection t)

  ;; 完了状態になった時、CLOSEDタイムスタンプを付与する
  (setq org-log-done 'time)

  ;; 状態の変化をLOGBOOK drawerに保存する
  (setq org-log-into-drawer t)

  ;; 依存タスクが完了していない場合、DONE状態への変更をブロックする
  (setq org-enforce-todo-dependencies t)

  ;; 未完了のチェックボックスを持つエントリーがDONE状態になるのをブロックする
  (setq org-enforce-todo-checkbox-dependencies t)

  ;;; タグ設定
  ;; タグ列の位置（左端から95文字目）
  (setq org-tags-column 95)

  ;;; 時間表示設定
  ;; 時間を日数ではなく時間形式で表示する（clocktable用）
  (setq org-duration-format '(("h" . t) (special . h:mm)))

  ;;; テンプレート設定
  ;; org-tempo を有効にして <s TAB などのテンプレート展開を使えるようにする(非推奨)
  (require 'org-tempo))

(provide '40-org-mode)
;;; 40-org-mode.el ends here
