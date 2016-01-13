;;; ts-init.el -- ts
;;; Commentary:

;;; Code:

(require 'use-package)

;; (use-package typescript
;;   :ensure t
;;   :config
;;   (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
;;   (use-package tss
;;     :ensure t
;;     :config
;;     (setq tss-popup-help-key "C-:")
;;     (setq tss-jump-to-definition-key "C->")
;;     (setq tss-implement-definition-key "C-c i")
;;     (tss-config-default)
;;     ))

(use-package tide
  :ensure t
  :config
  (add-hook 'typescript-mode-hook
            (lambda ()
              (tide-setup)
              (flycheck-mode +1)
              (setq flycheck-check-syntax-automatically '(save mode-enabled))
              (eldoc-mode +1)
              (company-mode-on)))
  ;; aligns annotation to the right hand side
  (setq typescript-indent-level 2)
  (setq company-tooltip-align-annotations t))


(provide 'ts-init)
;;; ts-init.el ends here
