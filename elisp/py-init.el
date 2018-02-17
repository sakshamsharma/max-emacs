;;; py-init.el -- ts
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package elpy
  :ensure t
  :mode ("\\.py\\'" . python-mode)
  :config
  (elpy-enable))

(provide 'py-init)
;;; py-init.el ends here
