;;; ts-init.el -- ts
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package typescript
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
  (use-package tss
    :ensure t
    :config
    (setq tss-popup-help-key "C-:")
    (setq tss-jump-to-definition-key "C->")
    (setq tss-implement-definition-key "C-c i")
    (tss-config-default)
    ))
  
(provide 'ts-init)
;;; ts-init.el ends here
