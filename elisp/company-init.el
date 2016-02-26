;;; company-init.el -- Complete anything
;;; Commentary: Thanks to vikraman for this :)

;;; Code:

(require 'use-package)

(defun complete-or-indent ()
  (interactive)
  (if (company-manual-begin)
      (company-complete-common)
    (indent-according-to-mode)))

;; company-mode
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 2)
  (setq company-dabbrev-downcase nil)
  (add-hook 'after-init-hook 'global-company-mode)

  (setq company-backends (delete 'company-semantic company-backends))

  ;; (add-to-list 'company-backends 'company-c-headers)
  ;; (add-to-list 'company-c-headers-path-system "/usr/lib/gcc/x86_64-pc-linux-gnu/4.9.3/include/g++-v")
  ;; (add-to-list 'company-c-headers-path-system "/usr/lib/gcc/x86_64-pc-linux-gnu/4.9.3/include/g++-v4/x86_64-pc-linux-gnu")
  ;; (add-to-list 'company-c-headers-path-system "/usr/lib/gcc/x86_64-pc-linux-gnu/4.9.3/include/g++-v4/backward")
  ;; (add-to-list 'company-c-headers-path-system "/usr/lib/gcc/x86_64-pc-linux-gnu/4.9.3/include")
  ;; (add-to-list 'company-c-headers-path-system "/usr/local/include")

  (add-to-list 'company-backends 'company-tern)
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
                company-tern
                ))

(provide 'company-init)
;;; company-init.el ends here
