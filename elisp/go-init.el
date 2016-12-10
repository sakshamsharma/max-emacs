;;; go-init.el -- Go!
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package go-mode
  :ensure t
  :config
  (add-hook 'before-save-hook 'gofmt-before-save)

  (use-package company-go
    :ensure t
    :config
    (add-to-list 'company-backends 'company-go)
    (setq company-tooltip-limit 20)                      ; bigger popup window
    (setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
    (setq company-echo-delay 0)                          ; remove annoying blinking
    (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
    (defun makefile-tabs-are-less-evil ()
      (interactive)
      (setq ethan-wspace-errors (remove 'tabs ethan-wspace-errors)))
    (add-hook 'go-mode-hook 'makefile-tabs-are-less-evil)

    (defun my-go-mode-hook ()
      ;; Call Gofmt before saving
      (add-hook 'before-save-hook 'gofmt-before-save)
      ;; Godef jump key binding
      (keymapper "M-." 'godef-jump)
      (keymapper "M-," 'pop-tag-mark)
      )
    (add-hook 'go-mode-hook 'my-go-mode-hook)
    )

  (use-package go-eldoc
    :ensure t
    :config
    (add-hook 'go-mode-hook 'go-eldoc-setup)))

(provide 'go-init)
;;; go-init.el ends here
