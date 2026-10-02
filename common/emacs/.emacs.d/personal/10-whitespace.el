;;; 10-whitespace.el --- Whitespace mode customizations
;;
;;; Commentary:
;;
;; Whitespace mode behavior customizations.

;;; Code:

;; Whitespace mode configuration
;; Remove 'lines-tail to disable coloring after 80 characters
(with-eval-after-load 'whitespace
  (setq whitespace-style '(face tabs empty trailing)))

(provide '10-whitespace)
;;; 10-whitespace.el ends here
