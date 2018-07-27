;;; rtags-init.el -- C/C++ with rtags
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package rtags
  :ensure t
  :defer t
  :bind (:map c++-mode-map (("M-." . rtags-find-symbol-at-point)
                            ("M-," . rtags-location-stack-back)))
  :config

  (use-package helm-rtags
    :ensure t)

  (use-package company-rtags
    :ensure t)

  (use-package flycheck-rtags
    :ensure t))

;; (defun cquery//enable ()
;;   (condition-case nil
;;       (lsp-cquery-enable)
;;     (user-error nil)))

;;   (use-package cquery
;;     :commands lsp-cquery-enable
;;     :init (add-hook 'c-mode-common-hook #'cquery//enable)
;;     :config
;;     (setq cquery-extra-init-params '(:index (:comments 2) :cacheFormat "msgpack"))
;;     (setq company-transformers nil company-lsp-async t company-lsp-cache-candidates nil)
;;     (setq cquery-project-roots '("/spare/local/saksham/src/super" )))

(provide 'rtags-init)
;;; rtags-init.el ends here
