;;; 20-yaml.el --- YAML mode configuration
;;
;;; Commentary:
;;
;; YAML mode settings and expand-region integration fix.

;;; Code:

;; yaml-mode を先にロードして expand-region の警告を解決
(use-package yaml-mode
  :ensure t
  :mode ("\\.ya?ml\\'" . yaml-mode)
  :config
  ;; expand-region が参照する変数を定義（バグ回避）
  (defvar yaml-indent-offset 2
    "Indentation offset for YAML files."))

(provide '20-yaml)
;;; 20-yaml.el ends here
