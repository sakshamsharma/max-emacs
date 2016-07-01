;;; rust-init.el -- rust
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package company-racer
  :ensure t)
(use-package racer
  :ensure t)
(use-package flycheck-rust
  :ensure t)

(use-package rust-mode
  :ensure t
  :config
  ;; Set path to racer binary
  (setq racer-cmd "/usr/local/bin/racer")

  ;; Set path to rust src directory
  (setq racer-rust-src-path "/home/saksham/.rust/src/")

  ;; Load rust-mode when you open `.rs` files
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

  ;; Setting up configurations when you load rust-mode
  (add-hook 'rust-mode-hook
            '(lambda ()
               ;; Use flycheck-rust in rust-mode
               (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
               (global-set-key (kbd "TAB") #'company-indent-or-complete-common)
               (setq company-tooltip-align-annotations t)
               (racer-mode)))

  ;; Use company-racer in rust mode
  (add-hook 'racer-mode-hook #'company-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (setq company-idle-delay 0.2))

(provide 'rust-init)
;;; rust-init.el ends here
