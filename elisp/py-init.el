;;; py-init.el -- ts
;;; Commentary:

;;; Code:

(require 'use-package)

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(use-package company-jedi
  :ensure t
  :config
  (add-hook 'python-mode-hook
            '(lambda ()
               (my/python-mode-hook))))
  
(provide 'py-init)
;;; py-init.el ends here
