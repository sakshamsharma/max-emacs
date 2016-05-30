;;; flycheck-init.el -- Checking on the go!
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package flycheck
  :ensure t
  :config
  (flycheck-mode 1)
  (use-package flycheck-package
    :ensure t
    :config
    (eval-after-load 'flycheck
      '(flycheck-package-setup))))

(provide 'flycheck-init)
;;; flycheck-init.el ends here
