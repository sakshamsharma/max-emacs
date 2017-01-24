;;; go-init.el -- Go!
;;; Commentary:

;;; Code:

(require 'use-package)

(defun makefile-tabs-are-less-evil ()
  "Remove warnings for makefiles."
  (interactive)
  (setq ethan-wspace-errors (remove 'tabs ethan-wspace-errors)))

(use-package go-mode
  :ensure t
  :config
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook 'makefile-tabs-are-less-evil)

  (use-package company-go
    :ensure t
    :config
    (add-to-list 'company-backends 'company-go)
    (setq company-tooltip-limit 20)                      ; bigger popup window
    (setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
    (setq company-echo-delay 0)                          ; remove annoying blinking
    ;; (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

    (add-hook 'go-mode-hook
              (lambda ()
                (set (make-local-variable 'company-backends) '(company-go))
                (company-mode)))
    :bind (("M-." . godef-jump)
           ("M-," . pop-tag-mark))
    )

  (use-package go-eldoc
    :ensure t
    :config
    (add-hook 'go-mode-hook 'go-eldoc-setup)))

(provide 'go-init)
;;; go-init.el ends here
