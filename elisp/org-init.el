;;; org-init.el -- Org mode
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package org
  :ensure t
  :config
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (define-key global-map "\C-cg" 'org-show-subtree)
  (add-hook 'org-mode-hook 'turn-on-visual-line-mode)
  (setq org-log-done t)
  (eval-after-load "org"
    '(require 'ox-md nil t)))

(provide 'org-init)
;;; org-init.el ends here
