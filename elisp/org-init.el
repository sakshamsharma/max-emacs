;;; org-init.el -- Org mode
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package org
  :ensure t
  :config
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (setq org-log-done t)
  )
  
(provide 'org-init)
;;; org-init.el ends here
