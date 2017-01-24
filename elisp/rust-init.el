;;; rust-init.el -- rust
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package rust-mode
  :ensure t
  :config

  (use-package racer
    :ensure t)


  (add-hook 'rust-mode-hook  #'company-mode)
  (add-hook 'rust-mode-hook  #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  ;;(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
  (add-hook 'rust-mode-hook
            '(lambda ()
               (setq racer-cmd "/usr/local/bin/racer")
               (setq racer-rust-src-path (concat (getenv "HOME")
                                                 "/.rust/src"))
               (local-set-key (kbd "TAB") #'company-indent-or-complete-common)))

  (setq company-idle-delay 0.2))

(use-package flycheck-rust
  :ensure t)

(provide 'rust-init)
;;; rust-init.el ends here
