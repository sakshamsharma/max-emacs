;;; git-init.el -- The best package ever!
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package magit
  :ensure t
  :bind (("C-c C-g" . magit-status))
  :bind (("M-p" . magit-push-to-remote))
  :config
  (use-package diff-hl
    :ensure t)
  (add-hook 'git-commit-mode-hook (lambda() (setq fill-column 76))))

(use-package git-gutter-fringe+
  :defer t
  :ensure t)

(provide 'git-init)
;;; git-init.el ends here
