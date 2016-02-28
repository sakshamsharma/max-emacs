;;; aggress-indent.el -- Aggressive indenting
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package aggressive-indent
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
  (add-hook 'css-mode-hook #'aggressive-indent-mode))

(provide 'aggress-indent)
;;; aggress-indent.el ends here
