;;; haskell-init.el -- haskell
;;; Commentary:
;;; Intrero is a one-size-fits-all.

;;; Code:

(require 'use-package)

(use-package intero
  :defer t
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'intero-mode))

(custom-set-variables
 '(haskell-stylish-on-save t))

(provide 'haskell-init)
;;; haskell-init.el ends here
