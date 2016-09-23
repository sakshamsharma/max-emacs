;;; cpp-init.el -- C/C++
;;; Commentary:
;;; CPP init file
;;; DEPRECATED

;;; Code:

(require 'use-package)

(use-package irony
  :ensure t
  :config

  ;; Define the modes/packages you need
  (use-package company-c-headers
    :ensure t)

  ;; Enable company mode globally
  (add-hook 'after-init-hook 'global-company-mode)

  ;; Here I define a function so it can be called anytime I want to load it
  (defun irony-comp-setup-basic()
    ;; A function to add path to company-c-headers
    (defun company-c-headers-includes ()
      ;; You just need to modify the path inside the quote to your header files path
      (add-to-list 'company-c-headers-path-system "$ROOTSYS/include")
      )
    ;; Now call this function so it add your path to company-c-header-path-system
    ;; (company-c-headers-includes)
    ;; Irony-mode configuration
    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'c-mode-hook 'irony-mode)
    (add-hook 'objc-mode-hook 'irony-mode)

    ;; replace the `completion-at-point' and `complete-symbol' bindings in
    ;; irony-mode's buffers by irony-mode's function
    (defun my-irony-mode-hook ()
      (define-key irony-mode-map [remap completion-at-point]
        'irony-completion-at-point-async)
      (define-key irony-mode-map [remap complete-symbol]
        'irony-completion-at-point-async))
    (add-hook 'irony-mode-hook 'my-irony-mode-hook)
    ;; This customize some backends to the company-backends I took it from my friend's code
    (custom-set-variables
     '(company-backends (quote (company-irony company-elisp company-bbdb company-nxml company-css company-eclim company-semantic company-clang company-xcode company-ropemacs company-cmake company-capf (company-dabbrev-code company-gtags company-etags company-keywords) company-oddmuse company-files company-dabbrev))))

    (custom-set-faces
     )

    ;; This add your company-c-headers to company-backends
    (add-to-list 'company-backends 'company-c-headers)

    ;; Default config for company-irony mode
    (eval-after-load 'company
      '(add-to-list
        'company-backends 'company-irony))

    ;; For irony mode I think
    (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
    )
  ;; Now call this function to active it
  ;; (irony-comp-setup-basic)

  (setq company-idle-delay              nil
        company-minimum-prefix-length   2
        company-show-numbers            t)
  )

(provide 'cpp-init)
;;; cpp-init.el ends here
