(require 'direx)

(defun my:direx-jump-to-project-root-other-window ()
  (interactive)
  (or (ignore-errors
        (direx-project:jump-to-project-root-other-window) t)
      (direx:jump-to-directory-other-window)))
