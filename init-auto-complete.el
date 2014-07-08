;;;auto-complete

;;;if you want to change the color of the popup menu,you can search "candidate-face" && "selection-face"
;;;in auto-complete-config.el && auto-complete-clang.el and modify it.

(add-to-list 'load-path "~/.emacs.d/site-lisp/auto-complete-1.3.1")
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/auto-complete-1.3.1/dict")
;; (ac-config-default)

(global-auto-complete-mode t)

;shortcut for auto-completion
;(define-key ac-mode-map  [(control return)] 'auto-complete)
;autostart auto-completion
(setq ac-auto-start t)






;;;auto-complete-clang

;;;CPP&C Headers are found in "ac-clang-flags"
;;;Run  "  echo "" | g++ -v -x c++ -E - " , and you'll see the Header's Path of your Os

(add-to-list 'load-path "~/.emacs.d/site-lisp/auto-complete-clang")
(require 'auto-complete-clang)
(setq ac-auto-start t)
(setq ac-quick-help-delay 0.5)

(defun my-ac-config ()
  (setq ac-clang-flags
        (mapcar(lambda (item)(concat "-I" item))
               (split-string
                "
 /usr/include/c++/4.8
/usr/include/i386-linux-gnu/c++/4.8
 /usr/include/c++/4.8/backward
 /usr/lib/gcc/i686-linux-gnu/4.8/include
 /usr/local/include
 /usr/lib/gcc/i686-linux-gnu/4.8/include-fixed
 /usr/include/i386-linux-gnu
 /usr/include
.
../include
"
                )))

  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))
(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; ac-source-gtags
(my-ac-config)
(ac-config-default)

(provide 'init-company)