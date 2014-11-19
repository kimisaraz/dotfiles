(require 'popwin)
(popwin-mode 1)

(push '("^\\*helm.*\\*$" :regexp t :height 0.45) popwin:special-display-config)
