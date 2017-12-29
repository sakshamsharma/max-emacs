;;; flix-init.el -- Flix mode
;;; Commentary:

;;; Code:

(use-package flix-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.flix\\'" . flix-mode)))

(provide 'flix-init)
;;; flix-init.el ends here
