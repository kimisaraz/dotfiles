(require 'search-web)

(add-to-list 'search-engines '("rurema" . "http://rurema.clear-code.com/query:%s/"))
(add-to-list 'search-engines '("rails" . "http://api.rubyonrails.org/?q=%s"))
(add-to-list 'search-engines '("dict" . "dict:///%s"))

(defun my:search-web-at-point-or-region ()
  (interactive)
  (if (region-active-p)
      (search-web-region)
    (search-web-at-point)))
