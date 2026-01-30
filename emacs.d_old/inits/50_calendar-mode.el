;; 月曜始まりで表示する
(setq calendar-week-start-day 1)

;; 今日をマークする
(add-hook 'calendar-today-visible-hook 'calendar-mark-today)

;; 祝日をカレンダーに表示
(require 'japanese-holidays)
(setq calendar-holidays
      (append japanese-holidays holiday-local-holidays holiday-other-holidays))
(setq mark-holidays-in-calendar t)
