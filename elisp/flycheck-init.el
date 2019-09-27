;;; flycheck-init.el -- Checking on the go!
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package flycheck
  :ensure t
  :defer 1
  :init (global-flycheck-mode)
  (setq flycheck-display-errors-delay .3))

(provide 'flycheck-init)
;;; flycheck-init.el ends here
