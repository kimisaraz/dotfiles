(require 'search-web)

(add-to-list 'search-web-engines '("rurema" "http://rurema.clear-code.com/query:%s/" nil))
(add-to-list 'search-web-engines '("rails" "http://api.rubyonrails.org/?q=%s" nil))
(add-to-list 'search-web-engines '("dict" "dict:///%s" nil))
