;;; 30-engine-mode.el --- Web search engine configuration
;;
;;; Commentary:
;;
;; engine-modeを使ったWeb検索エンジンの設定

;;; Code:

(use-package engine-mode
  :ensure t
  :config
  (engine-mode t)
  (defengine rurema
    "http://rurema.clear-code.com/query:%s/")
  (defengine rails
    "http://api.rubyonrails.org/?q=%s")
  (defengine dict
    "dict:///%s"))

(provide '30-engine-mode)
;;; 30-engine-mode.el ends here
