;;; proof.el -- Org mode
;;; Commentary:

;;; Code:

(require 'use-package)

;; Since proof-general doesn't have a package on melpa
(load "~/.emacs.d/lisp/PG/generic/proof-site")
(use-package company-coq
  :ensure t
  :config
  (add-hook 'coq-mode-hook #'company-coq-mode)
  (custom-set-variables
   '(coq-prog-args '("-I" "SRC"))))

(provide 'proof)
;;; proof.el ends here
