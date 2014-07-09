(add-to-list 'load-path "~/.emacs.d/site-lisp/evil-leader")
(require 'evil-leader)
(global-evil-leader-mode)

(evil-leader/set-leader ",")

(evil-leader/set-key
  "kb" 'kill-buffer
  "sf" 'find-file
  "vs" 'split-window-horizontally
  "sw" 'split-window-vertically
  "bs" 'switch-to-buffer)

(provide 'init-evil-leader)