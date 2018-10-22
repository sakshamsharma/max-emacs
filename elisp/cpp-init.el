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

(defun my-c++-mode-hook()
  "Set c++ vars."
  (c-set-offset 'inlambda 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(provide 'cpp-init)
;;; cpp-init.el ends here
