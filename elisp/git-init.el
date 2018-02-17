;;; git-init.el -- The best package ever!
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package magit
  :ensure t
  :defer t
  :bind (("C-c C-g" . magit-status)))

(use-package diff-hl
  :defer t
  :ensure t)

(provide 'git-init)
;;; git-init.el ends here
