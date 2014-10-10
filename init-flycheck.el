(add-to-list 'load-path "/home/cheukyin/.emacs.d/site-lisp/flycheck")
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(provide 'init-flycheck)