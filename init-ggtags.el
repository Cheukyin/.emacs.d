(require 'ggtags)

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

(provide 'init-ggtags)



;; ;; this variables must be set before load helm-gtags
;; ;; you can change to any prefix key of your choice
;; (setq helm-gtags-prefix-key "\C-cg")

;; (require 'helm-gtags)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t

 helm-gtags-suggested-key-mapping t
 )

(add-hook 'c-mode-hook 'semantic-mode)
(add-hook 'c++-mode-hook 'semantic-mode)
(add-hook 'python-mode-hook 'semantic-mode)
(add-hook 'asm-mode-hook 'semantic-mode)

(add-hook 'c-mode-hook 'global-semantic-stickyfunc-mode)
(add-hook 'c++-mode-hook 'global-semantic-stickyfunc-mode)
(add-hook 'python-mode-hook 'global-semantic-stickyfunc-mode)
(add-hook 'asm-mode-hook 'global-semantic-stickyfunc-mode)

;; ;; Enable helm-gtags-mode in Dired so you can jump to any tag
;; ;; when navigate project tree with Dired
;; (add-hook 'dired-mode-hook 'helm-gtags-mode)

;; ;; Enable helm-gtags-mode in Eshell for the same reason as above
;; (add-hook 'eshell-mode-hook 'helm-gtags-mode)

;; ;; Enable helm-gtags-mode in languages that GNU Global supports
;; (add-hook 'c-mode-hook 'helm-gtags-mode)
;; (add-hook 'c++-mode-hook 'helm-gtags-mode)
;; (add-hook 'java-mode-hook 'helm-gtags-mode)
;; (add-hook 'asm-mode-hook 'helm-gtags-mode)

;; key bindings
(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)