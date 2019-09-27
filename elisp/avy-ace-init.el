;;; avy-ace-init.el -- The best package ever!
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package avy
  :ensure t
  :defer 5
  :bind
  (("C-;"     . avy-goto-char)
   ("C-'"     . avy-goto-char-timer)
   ("C-c SPC" . avy-goto-word-or-subword-1))
  :config
  (avy-setup-default))

(use-package ace-window
  :ensure t
  :defer 5
  :bind
  (("C-."     . ace-window))
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(provide 'avy-ace-init)
;;; avy-ace-init.el ends here
