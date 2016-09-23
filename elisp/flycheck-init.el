;;; flycheck-init.el -- Checking on the go!
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(provide 'flycheck-init)
;;; flycheck-init.el ends here
