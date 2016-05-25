;;; scheme-init.el -- scheme
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package racket-mode
  :ensure t
  :config
  (add-hook 'racket-mode-hook
            (lambda ()
              (define-key racket-mode-map (kbd "C-c r") 'racket-run))))

(provide 'scheme-init)
;;; scheme-init.el ends here
