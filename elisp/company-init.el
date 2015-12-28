;;; company-init.el -- Complete anything
;;; Commentary: Thanks to vikraman for this :)

;;; Code:

(require 'use-package)

;; company-mode
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 2)
  (setq company-dabbrev-downcase nil)
  (add-hook 'after-init-hook 'global-company-mode)
  (add-to-list 'company-backends 'company-ghc))

(defun use-packages (names)
  "Use-package on list of NAMES."
  (pcase names
    (`(,p . ,ps)
     (progn
       (eval `(use-package ,p :ensure t :defer t))
       (use-packages ps)))
    (_ t)
    ))

(use-packages '(company-auctex
                company-cabal
                company-c-headers
                company-ghc
                company-ghci
                company-go
                company-inf-ruby
                company-irony
                company-math
                company-coq
                company-restclient
                company-quickhelp
                slime-company
                ))

(provide 'company-init)
;;; company-init.el ends here
