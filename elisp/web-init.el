;;; web-init.el -- Web stuff
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (defun my-web-mode-hook ()
    "Hooks for Web mode."
    (setq web-mode-markup-indent-offset 2))
  (add-hook 'web-mode-hook  'my-web-mode-hook)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-js-indent-offset 2))

(use-package php-mode
  :ensure t)

(use-package scss-mode
  :ensure t
  :config
  (autoload 'scss-mode "scss-mode")
  (setq scss-compile-at-save nil)
  (add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode)))


(use-package js-mode
  :mode ("\\.json$" . js-mode)
  :init
  (progn
    (add-hook 'js-mode-hook (lambda () (setq js-indent-level 2)))))

(use-package js2-mode
  :ensure t
  :mode (("\\.js$" . js2-mode)
         ("Jakefile$" . js2-mode))
  :interpreter ("node" . js2-mode)
  :config
  (use-package company-tern
    :ensure t
    :config
    (add-to-list 'company-backends 'company-tern))
  (progn
    (add-hook 'js2-mode-hook (lambda () (setq js2-basic-offset 4))))
  :bind (("C-j" . join-line)
         ("C-c C-f" . projectile-find-file)))

(use-package helm-css-scss
  :ensure t)

(use-package pug-mode
  :ensure t)

(provide 'web-init)
;;; web-init.el ends here
