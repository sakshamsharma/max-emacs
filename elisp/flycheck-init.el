;;; flycheck-init.el -- Checking on the go!
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package flycheck
  :ensure t
  :defer 5
  :diminish flycheck-mode
  :config (global-flycheck-mode))

(provide 'flycheck-init)
;;; flycheck-init.el ends here
