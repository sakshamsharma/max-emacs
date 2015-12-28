;;; projectile-init.el -- Projectile for managing projects
;;; Commentary:

;;; Code:

(require 'use-package)

;; projectile
(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'helm
        projectile-enable-caching t
        projectile-switch-project-action 'helm-projectile)
  (helm-projectile-on))

(provide 'projectile-init)
;;; projectile-init.el ends here
