(add-to-list 'load-path "~/.emacs.d/site-lisp/evil-leader")
(require 'evil-leader)
(global-evil-leader-mode)

(evil-leader/set-leader ",")

(evil-leader/set-key
  "kb" 'kill-buffer
  "sf" 'find-file
  "vs" 'split-window-horizontally
  "sw" 'split-window-vertically
  "es" 'ecb-show-ecb-windows
  "eh" 'ecb-hide-ecb-windows
  "ea" 'ecb-activate
  "ed" 'ecb-deactivate
  "bs" 'switch-to-buffer)

(provide 'init-evil-leader)