;;; irony-init.el -- C/C++
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package irony
  :ensure t
  :mode (("\\.cpp\\'" . c++-mode)
         ("\\.cc\\'"  . c++-mode)
         ("\\.hpp\\'" . c++-mode)
         ("\\.hh\\'"  . c++-mode)
         ("\\.c\\'"   . c-mode)
         ("\\.h\\'"   . c-mode))
  :functions global-semantic-stickyfunc-mode
  :config

  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

  (use-package flycheck-irony
    :ensure t
    :config
    (eval-after-load 'flycheck
      '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)))

  (use-package company-irony-c-headers
    :ensure t
    :config
    (eval-after-load 'company
      '(add-to-list
        'company-backends '(company-irony-c-headers company-irony))))

  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

  (use-package semantic
    :ensure t
    :config
    ;; (require 'semantic/bovine/gcc)
    (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
    (global-semantic-idle-summary-mode 1)
    (semantic-mode 1))

  (use-package clang-format
    :ensure t
    :config
    (global-set-key [C-M-tab] 'clang-format-region)))

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(provide 'irony-init)
;;; irony-init.el ends here
