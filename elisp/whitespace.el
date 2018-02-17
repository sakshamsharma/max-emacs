;;; whitespace.el -- Whitespace magic
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package ethan-wspace
  :ensure t
  :defer t
  :config
  (setq mode-require-final-newline nil)
  (global-ethan-wspace-mode 1))

(use-package ws-butler
  :ensure t
  :defer t
  :commands ws-butler-mode
  :config (progn
	    (add-hook 'c-mode-common-hook 'ws-butler-mode)
	    (add-hook 'python-mode-hook 'ws-butler-mode)
	    (add-hook 'cython-mode-hook 'ws-butler-mode)))

(provide 'whitespace)
;;; whitespace.el ends here
