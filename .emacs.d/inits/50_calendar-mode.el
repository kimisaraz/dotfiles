;; 月曜始まりで表示する
(setq calendar-week-start-day 1)

(add-hook 'calendar-mode-hook
          (lambda ()
            (setq-local show-trailing-whitespace nil)))
