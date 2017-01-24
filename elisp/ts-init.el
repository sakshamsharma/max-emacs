;;; ts-init.el -- ts
;;; Commentary:

;;; Code:

(require 'use-package)

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
  :bind (("M-." . tide-jump-to-definition-reuse-window)))

(setq typescript-indent-level 2)

(provide 'ts-init)
;;; ts-init.el ends here
