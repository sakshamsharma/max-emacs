;;; py-init.el -- ts
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package elpy
  :ensure t
  :functions (elpy-enable)
  :mode ("\\.py\\'" . python-mode)
  :config
  (elpy-enable))
  ;; :bind (:map python-mode-map (("M-." . elpy-goto-definition)
  ;;                              ("M-,"))))

;; (use-package anaconda-mode
;;   :ensure t
;;   :mode ("\\.py\\'" . python-mode)
;;   :config
;;   (add-hook 'python-mode-hook 'anaconda-mode)
;;   (add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;;   (use-package company-anaconda
;;     :ensure t))

(provide 'py-init)
;;; py-init.el ends here
