;;; projectile-init.el -- Projectile for managing projects
;;; Commentary:

;;; Code:

(require 'use-package)

;; projectile
(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'helm
        projectile-enable-caching t
        projectile-switch-project-action 'helm-projectile)
  (helm-projectile-on)
  :bind  (("C-c C-p" . projectile-recentf)
          ("C-c C-f" . projectile-find-file)
          ("C-c f"   . helm-projectile-ag )))

(provide 'projectile-init)
;;; projectile-init.el ends here
