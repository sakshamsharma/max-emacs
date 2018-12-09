;;; cpp-init.el -- C/C++ core config.
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package clang-format
  :ensure t
  :bind (:map c++-mode-map (("C-c i" . clang-format-region)
                            ("C-c u" . clang-format-buffer)))
  :config
  (setq clang-format-style-option "google"))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(use-package ggtags
  :ensure t)

(defun enable-gtags-imenu ()
  (setq-local imenu-create-index-function #'ggtags-build-imenu-index))

(defun my-c++-mode-hook()
  "Set c++ vars."
  (c-set-offset 'inlambda 0)
  (ggtags-mode 1))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

;; (use-package helm-xref
;;   :ensure t
;;   :config
;;   (setq xref-show-xrefs-function 'helm-xref-show-xrefs))

(provide 'cpp-init)
;;; cpp-init.el ends here
