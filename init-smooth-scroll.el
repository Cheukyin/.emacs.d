(add-to-list 'load-path "~/.emacs.d/site-lisp/smooth-scroll")
(require 'smooth-scroll)
(smooth-scroll-mode t)

;; scroll one line at a time (less "jumpy" than defaults)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

(setq mouse-wheel-progressive-speed 3) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq scroll-conservatively  10000)

(provide 'init-smooth-scroll)