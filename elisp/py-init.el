;;; py-init.el -- ts
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package elpy
  :ensure t
  :config
  (elpy-enable)
  (iedit-quit))

(provide 'py-init)
;;; py-init.el ends here
