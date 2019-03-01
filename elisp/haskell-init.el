;;; haskell-init.el -- haskell
;;; Commentary:
;;; Intrero is a one-size-fits-all.

;;; Code:

(require 'use-package)

(use-package haskell-mode
  :ensure t
  :mode "\\.hs\\'"
  :bind (("C-c C-c C-l" . haskell-process-load-or-reload))
  :config
  (defvar haskell-font-lock-symbols)
  (setq haskell-font-lock-symbols t)
  (use-package intero
    :ensure t)
  (use-package flymake-hlint
    :ensure t
    :config
    (add-hook 'haskell-mode-hook 'flymake-hlint-load))
  (use-package hlint-refactor
    :ensure t
    :config
    (add-hook 'haskell-mode-hook 'hlint-refactor-mode))
  (setq haskell-stylish-on-save t))

(provide 'haskell-init)
;;; haskell-init.el ends here
