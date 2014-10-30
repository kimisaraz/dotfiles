(when (executable-find "git")
  (require 'git-gutter-fringe+)
  (global-git-gutter+-mode t))
