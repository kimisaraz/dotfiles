;;; 10-macos.el --- macOS specific customizations
;;
;;; Commentary:
;;
;; macOS specific settings.

;;; Code:

;; Prevent macOS from intercepting key combinations
;; This stops the emoji picker from capturing Cmd+Ctrl+Space
(when (eq system-type 'darwin)
  ;; Don't pass Command key combinations to macOS
  (setq mac-pass-command-to-system nil)
  ;; Don't pass Control key combinations to macOS
  (setq mac-pass-control-to-system nil)

  ;; Automatically switch to ASCII input when using Emacs keybindings
  ;; This prevents Japanese input from interfering with C-x, M-x, etc.
  (when (fboundp 'mac-auto-ascii-mode)
    (mac-auto-ascii-mode 1))

  ;; Prelude の exec-path-from-shell はデフォルトシェル (zsh) で PATH を取得するが、
  ;; fish の PATH 設定が反映されない。fish から直接 PATH を取得して上書きする。
  (let ((fish-path (string-trim
                    (shell-command-to-string
                     "/opt/homebrew/bin/fish -i -c 'printenv PATH' 2>/dev/null"))))
    (when (> (length fish-path) 0)
      (setenv "PATH" fish-path)
      (setq exec-path (append (parse-colon-path fish-path)
                              (list exec-directory)))))

  )

(provide '10-macos)
;;; 10-macos.el ends here
