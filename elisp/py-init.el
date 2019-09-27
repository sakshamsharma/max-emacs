;;; py-init.el -- ts
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package cython-mode
  :ensure t
  :defer 5
  :config
  (which-function-mode 0)
  :bind (:map cython-mode-map (("M-]" . xref-find-definitions)
                               ("M-," . pop-tag-mark))))

(defun pyls//enable ()
  "Enables pyls for all python files."
  (interactive)
  (require 'lsp-mode)
  (add-hook 'python-mode-hook #'lsp))

(provide 'py-init)
;;; py-init.el ends here
