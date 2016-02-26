;;; neotree-init.el -- neotree
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package neotree
  :config
  (progn
    (setq-default neo-smart-open t)    ;  every time when the neotree window is
                                       ;  opened, it will try to find current
                                       ;  file and jump to node.
    (setq-default neo-dont-be-alone t) ; Don't allow neotree to be the only open
                                       ; window
    )
  (global-set-key [f8] 'neotree-toggle)

  (progn
    (bind-keys
     :map neotree-mode-map
      ("<C-return>" . neotree-change-root)
      ("C"          . neotree-change-root)
      ("c"          . neotree-create-node)
      ("+"          . neotree-create-node)
      ("d"          . neotree-delete-node)
      ("r"          . neotree-rename-node)))

  )

(provide 'neotree-init)
;;; neotree-init.el ends here
