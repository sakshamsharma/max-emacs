;;; web-init.el -- Web stuff
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package web-mode
  :ensure t)

(use-package php-mode
  :ensure t)

(use-package scss-mode
  :ensure t
  :config
  (autoload 'scss-mode "scss-mode")
  (setq scss-compile-at-save nil)
  (add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode)))

(use-package helm-css-scss
  :ensure t)

(provide 'web-init)
;;; web-init.el ends here
