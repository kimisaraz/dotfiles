;;; 10-line-numbers.el --- Line numbers customizations
;;
;;; Commentary:
;;
;; Disable line numbers display.

;;; Code:

;; Disable line numbers in the left margin
(if (fboundp 'global-display-line-numbers-mode)
    (global-display-line-numbers-mode -1)
  (global-nlinum-mode -1))

(provide '10-line-numbers)
;;; 10-line-numbers.el ends here
