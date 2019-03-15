;;; company-init.el -- Complete anything
;;; Commentary:
;;; Thanks to vikraman for this :)

;;; Code:

(require 'use-package)

;; company-mode
(use-package company
  :ensure t
  :defer 1
  :diminish company-mode
  :functions company-complete-common
  :config
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 2)
  (add-hook 'after-init-hook 'global-company-mode)

  (use-package company-box
    :ensure t)

  (defun complete-or-indent ()
    "If there is no completion, then ident."
    (interactive)
    (if (company-manual-begin)
        (company-complete-common)
      (indent-according-to-mode)))

  (setq-default company-dabbrev-downcase nil))

(provide 'company-init)
;;; company-init.el ends here
