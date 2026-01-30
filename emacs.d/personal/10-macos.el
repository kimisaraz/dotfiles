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

  ;; Homebrew のパスを明示的に追加（exec-path-from-shell で拾えない場合の保険）
  (add-to-list 'exec-path "/opt/homebrew/bin")
  (setenv "PATH" (concat "/opt/homebrew/bin:" (getenv "PATH")))
  )

(provide '10-macos)
;;; 10-macos.el ends here
