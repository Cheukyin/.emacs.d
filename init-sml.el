(add-to-list 'load-path "~/.emacs.d/site-lisp/sml-mode")
(load "sml-mode.el" nil t t)

(autoload 'sml-mode "sml-mode" "Major mode for editing SML." t)
(autoload 'run-sml "sml-proc" "Run an inferior SML process." t)

(provide 'init-sml)