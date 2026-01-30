;;; 20-typescript.el --- TypeScript mode configuration
;;
;;; Commentary:
;;
;; TypeScript mode indentation and behavior settings.

;;; Code:

;; TypeScript インデント設定
(with-eval-after-load 'typescript-mode
  ;; インデント幅を2スペースに設定
  (setq typescript-indent-level 2)

  ;; typescript-mode-hookでも明示的に設定
  (add-hook 'typescript-mode-hook
            (lambda ()
              (setq indent-tabs-mode nil)
              (setq tab-width 2))))

(provide '20-typescript)
;;; 20-typescript.el ends here
