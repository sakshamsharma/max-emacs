;;; java-init.el -- scala with ensime
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package eclim
  :ensure t
  :config
  (use-package company-emacs-eclim
    :ensure t))

(provide 'java-init)
;;; java-init.el ends here
