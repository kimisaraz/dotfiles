;; 月曜始まりで表示する
(setq calendar-week-start-day 1)

;; 今日をマークする
(add-hook 'calendar-today-visible-hook 'calendar-mark-today)
