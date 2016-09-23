;;; helm-init.el -- The best package ever!
;;; Commentary: Thanks to vikraman for this :)

;;; Code:

(require 'use-package)

(use-package helm
  :ensure t
  :diminish helm-mode
  :bind
  (("M-x"     . helm-M-x)
   ("C-x b"   . helm-mini)
   ("M-s"     . helm-mini)
   ("C-x C-b" . helm-buffers-list)
   ("C-x C-f" . helm-find-files)
   ("C-x C-d" . helm-browse-project))
  :config

  (helm-mode 1)
  (helm-autoresize-mode 1)
  (helm-adaptive-mode 1)

  (when (executable-find "curl")
    (setq helm-net-prefer-curl 1))

  (setq helm-buffers-fuzzy-matching 1
        helm-recentf-fuzzy-match 1
        helm-split-window-in-side-p 1
        helm-move-to-line-cycle-in-source 1
        helm-ff-search-library-in-sexp 1
        helm-ff-file-name-history-use-recentf 1
        helm-semantic-fuzzy-match 1
        helm-M-x-fuzzy-match 1
        helm-scroll-amount 8)

  (bind-keys :map helm-map
             ("<tab>" . helm-execute-persistent-action)
             ("C-i" . helm-execute-persistent-action)
             ("C-z" . helm-select-action))

  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-z") 'helm-select-action)

  (use-package helm-ring
    :bind (("M-y" . helm-show-kill-ring)))
  (use-package helm-projectile
    :ensure t :defer t)
  (use-package helm-swoop
    :ensure t :defer t
    :bind
    (("M-i" . helm-swoop)
     ("M-I" . helm-swoop-back-to-last-point)
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
