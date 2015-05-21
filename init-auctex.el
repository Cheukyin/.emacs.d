(add-to-list 'load-path "~/.emacs.d/site-lisp/auctex-11.88")

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(load "cdlatex.el" nil t t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'latex-mode-hook 'turn-on-cdlatex)   ; with Emacs latex mode

(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(setq TeX-PDF-mode t)

(add-hook 'LaTeX-mode-hook
          (lambda () (set (make-variable-buffer-local 'TeX-electric-math)
                          (cons "$" "$"))))

;; In this way, you can `C-c C-o C-b` to fold every item in the buffer
;; and use mouse-click to unfold it
(add-hook 'LaTeX-mode-hook
          (lambda () (TeX-fold-mode 1))); Automatically activate TeX-fold-mode.

(provide 'init-auctex)
