;;; py-init.el -- ts
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package anaconda-mode
  :ensure t
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode)

  (add-to-list 'python-shell-extra-pythonpaths "/home/saksham/code/movi/movi")
  (use-package company-anaconda
    :ensure t)

  (use-package pyvenv
    :ensure t
    :config
    (setenv "WORKON_PATH" "$HOME/.envs")))

(provide 'py-init)
;;; py-init.el ends here
