;;; scheme-init.el -- scheme
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package racket-mode
  :ensure t
  :config
  (add-hook 'racket-mode-hook
            (lambda ()
              (define-key racket-mode-map (kbd "C-c r") 'racket-run))))

(use-package geiser
  :ensure t)

(use-package ac-geiser
  :ensure t
  :config
  (add-hook 'geiser-mode-hook 'ac-geiser-setup)
  (add-hook 'geiser-repl-mode-hook 'ac-geiser-setup)
  (eval-after-load "auto-complete"
    '(add-to-list 'ac-modes 'geiser-repl-mode)))

(use-package paredit
  :config
  (autoload 'enable-paredit-mode "paredit" t)
  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           #'enable-paredit-mode))

(use-package eldoc
  :ensure t
  :config
  (eldoc-add-command
   'paredit-backward-delete
   'paredit-close-round))

(use-package quack
  :ensure t)

(provide 'scheme-init)
;;; scheme-init.el ends here
