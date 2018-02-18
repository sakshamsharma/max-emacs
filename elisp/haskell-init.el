;;; haskell-init.el -- haskell
;;; Commentary:
;;; Intrero is a one-size-fits-all.

;;; Code:

(require 'use-package)

(use-package haskell-mode
  :ensure t
  :mode "\\.hs\\'"
  :config
  (use-package intero
    :ensure t
    :config
    (intero-global-mode 1))
  (setq haskell-stylish-on-save t))

(provide 'haskell-init)
;;; haskell-init.el ends here
