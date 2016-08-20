;;; whitespace.el -- Whitespace magic
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package ethan-wspace
  :ensure t
  :config
  (setq mode-require-final-newline nil)
  (global-ethan-wspace-mode 1))

(provide 'whitespace)
;;; whitespace.el ends here
