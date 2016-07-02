;;; slime-init.el -- rust
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package slime
  :ensure t
  :config
  (use-package elisp-slime-nav
    :ensure t
    :config
    (slime-setup '(slime-fancy))
    (defun my-lisp-hook ()
      (elisp-slime-nav-mode)
      (turn-on-eldoc-mode))
    (add-hook 'emacs-lisp-mode-hook 'my-lisp-hook)))

(provide 'slime-init)
;;; slime-init.el ends here
