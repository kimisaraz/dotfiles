;; Use Cask for Emacs configuration
(require 'cask)
(cask-initialize)

;; Load configuration files from 'inits' directory
(require 'init-loader)
(init-loader-load)
