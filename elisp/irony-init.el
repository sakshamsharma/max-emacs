;;; irony-init.el -- C/C++
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package irony
  :ensure t
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)

  (defun my-c++-mode-hook ()
    (c-set-style "my-style")
    (auto-fill-mode)
    (c-toggle-auto-hungry-state 1)
    (c-toggle-auto-newline -1)
    (c-set-offset 'arglist-intro '+)    ; Break long declarations into newlines
    (c-set-offset 'inline-open '+)
    (c-set-offset 'block-open '+)
    (c-set-offset 'brace-list-open '+)  ; all "opens" indented by the c-indent-level
    (c-set-offset 'case-label '+)       ; indent case labels by c-indent-level, too
    )

  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (add-hook 'irony-mode-hook 'my-c++-mode-hook)

  (use-package semantic
    :ensure t
    :config
    (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
    (global-semantic-idle-summary-mode 1)
    (semantic-mode 1)))


(provide 'irony-init)
;;; irony-init.el ends here
