;;; git-init.el -- The best package ever!
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package magit
  :ensure t
  :bind (("C-c C-g" . magit-status))
  :config
  (use-package diff-hl
    :ensure t)
  (add-hook 'git-commit-mode-hook (lambda() (setq fill-column 76))))

(provide 'git-init)
;;; git-init.el ends here
