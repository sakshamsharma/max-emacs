;;; helm-init.el -- The best package ever!
;;; Commentary: Thanks to vikraman for this :)

;;; Code:

(require 'use-package)

(use-package helm
  :ensure t
  :bind
  (("M-x"     . helm-M-x)
   ("C-x b"   . helm-mini)
   ("C-x C-b" . helm-buffers-list)
   ("C-x C-f" . helm-find-files)
   ("C-x C-d" . helm-browse-project))
  :config
  (use-package helm-config)
  (use-package helm-command
    :config (setq helm-M-x-fuzzy-match t))
  (helm-mode 1)
  (helm-autoresize-mode t)
  (helm-adaptive-mode t)

  (when (executable-find "curl")
    (setq helm-net-prefer-curl))

  (setq helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t
        helm-split-window-in-side-p t
        helm-move-to-line-cycle-in-source t
        helm-ff-search-library-in-sexp t
        helm-ff-file-name-history-use-recentf t
        helm-semantic-fuzzy-match t
        helm-scroll-amount 8)

  (bind-keys :map helm-map
             ("<tab>" . helm-execute-persistent-action)
             ("C-i" . helm-execute-persistent-action)
             ("C-z" . helm-select-action))

  (use-package helm-ring
    :bind (("M-y" . helm-show-kill-ring)))
  (use-package helm-projectile
    :ensure t :defer t)
  (use-package helm-swoop
    :ensure t :defer t
    :bind
    (("M-i" . helm-swoop)
     ("M-I" . helm-swoo-back-to-last-point)
     ("C-c M-i" . helm-multi-swoop)
     ("C-x M-i" . helm-multi-swoop-all))
    :config
    (bind-keys :map isearch-mode-map
               ("M-i" . helm-swoop-from-isearch))
    (bind-keys :map helm-swoop-map
               ("M-i" . helm-multi-swoop-all-from-helm-swoop)
               ("C-r" . helm-previous-line)
               ("C-s" . helm-next-line))
    (bind-keys :map helm-multi-swoop-map
               ("C-r" . helm-previous-line)
               ("C-s" . helm-next-line))
    )
  (use-package helm-make
    :ensure t :defer t
    :config
    (setq helm-make-do-save t))
  (use-package helm-ag :ensure t :defer t)
  (use-package helm-ls-git :ensure t :defer t))
  
(provide 'helm-init)
;;; helm-init.el ends here
