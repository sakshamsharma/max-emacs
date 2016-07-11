;;; git-init.el -- The best package ever!
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package magit
  :ensure t
  :bind (("C-c C-g" . magit-status)))

(use-package diff-hl
  :ensure t)

(provide 'git-init)
;;; git-init.el ends here
