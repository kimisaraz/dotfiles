(require 'popwin)
(popwin-mode 1)

(push '("^\\*helm.*\\*$" :regexp t :height 0.45) popwin:special-display-config)
(push '(direx:direx-mode :position left :width 36 :dedicated t) popwin:special-display-config)
