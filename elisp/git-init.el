;;; git-init.el -- The best package ever!
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package magit
  :ensure t
  :bind (("C-c C-g" . magit-status))
  :config
  (use-package magit-gerrit
    :ensure t
    :config
    (setq-default magit-gerrit-ssh-creds "stonegerrit.skae:29418")
    (setq-default magit-gerrit-remote "gerrit"))
  (use-package diff-hl
    :ensure t))

(provide 'git-init)
;;; git-init.el ends here
