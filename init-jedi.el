(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-jedi")
(require 'jedi)

(add-to-list 'load-path "~/.emacs.d/site-lisp/pyvenv")
(require 'pyvenv)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional

(provide 'init-jedi)
