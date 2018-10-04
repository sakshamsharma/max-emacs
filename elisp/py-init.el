;;; py-init.el -- ts
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package elpy
  :ensure t
  :functions (elpy-enable)
  :mode ("\\.py\\'" . python-mode)
  :config
  (setq python-indent-offset 2)
  :bind ((:map python-mode-map (("M-." . xref-find-definitions)
                                ("M-," . pop-tag-mark)
                                ("M-]" . xref-find-definitions)))
         (:map elpy-mode-map (("M-." . elpy-goto-definition)))))

(use-package cython-mode
  :ensure t
  :bind (:map cython-mode-map (("M-]" . xref-find-definitions)
                               ("M-," . pop-tag-mark))))

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
