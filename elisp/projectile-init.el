;;; projectile-init.el -- Projectile for managing projects
;;; Commentary:

;;; Code:

(require 'use-package)

;; projectile
(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (projectile-mode)
  (setq projectile-completion-system 'helm
        projectile-enable-caching t
        projectile-switch-project-action 'helm-projectile)

  (setq projectile-project-root-files-functions
        '(projectile-root-top-down-recurring projectile-root-bottom-up)
        projectile-project-root-files-top-down-recurring
        '("compile_commands.json"))

  ;; fd is much faster than git ls-files.
  (if (executable-find "fd")
      (setq projectile-git-command
            "fd . --print0 --no-ignore-vcs --color never")
    (setq projectile-git-command
          "git ls-files -zco --exclude-standard && repo forall -c 'git ls-files | sed \"s#\(.*\)#$REPO_PATH\/\1#g\"' | tr '\n' '\0 2>/dev/null || true"))

  ;; Robust helm-projectile-ag
  (if (executable-find "repo-ag")
      (defun robust-helm-projectile-ag (&optional options)
        "Robust version of helm-projectile-ag."
        (interactive)
        (if (file-directory-p (concat (projectile-project-root) ".repo"))
            (setq helm-ag-base-command
                  "repo forall -c repo-ag")
          (setq helm-ag-base-command "ag --nocolor --nogroup"))
        (helm-projectile-ag options))

    (defun robust-helm-projectile-ag (&optional options)
      "Same as regular helm-projectile-ag."
      (interactive)
      (setq helm-ag-base-command "ag --nocolor --nogroup")
      (helm-projectile-ag options)))

  (helm-projectile-on)
  :bind  (("C-c C-p" . projectile-recentf)
          ("C-c C-f" . projectile-find-file)
          ("C-c o" . projectile-find-other-file)
          ("C-c f" . robust-helm-projectile-ag)))

(provide 'projectile-init)
;;; projectile-init.el ends here
