;;; dired-sidebar-init.el -- dired-sidebar
;;; Commentary:
;;; https://github.com/jojojames/dired-sidebar

(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :config
  (when (eq system-type 'windows-nt)
    (setq dired-sidebar-use-all-the-icons nil))

  (setq dired-sidebar-use-term-integration t)
  ;; (setq dired-sidebar-use-custom-font t)
  ;; (setq dired-sidebar-face
  ;;       (cond
  ;;        ((eq system-type 'darwin)
  ;;         '(:family "Helvetica" :height 140))
  ;;        ((eq system-type 'windows-nt)
  ;;         '(:family "Times New Roman" :height 130))
  ;;        (:default
  ;;         '(:family "Arial" :height 140))))

  (use-package all-the-icons-dired
    ;; M-x all-the-icons-install-fonts
    :ensure t
    :commands (all-the-icons-dired-mode)))

(provide 'dired-sidebar-init)
;;; dired-sidebar-init.el ends here
