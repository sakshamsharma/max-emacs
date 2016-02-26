;;; scala-init.el -- ts
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package ensime
  :ensure t
  :config
  (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
  :bind (("C-c C-v C-e" . ensime-print-errors-at-point)
         ("C-c C-v C-t" . ensime-print-type-at-point))
  )

(provide 'scala-init)
;;; scala-init.el ends here
