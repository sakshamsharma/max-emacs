;;; misc-init.el -- Miscellaneous packages
;;; Commentary:

;;; Code:

(require 'use-package)

(defun use-packages (names)
  "Use-package on list of NAMES."
  (pcase names
    (`(,p . ,ps)
     (progn
       (eval `(use-package ,p :ensure t :defer t))
       (use-packages ps)))
    (_ t)
    ))

(use-packages '(magit
                on-screen
                auto-complete
                markdown-mode
                multi-term
                js2-mode
                unicode-fonts
                auctex))

(use-package smbc
  :ensure t)

(use-package diminish
  :ensure t
  :config
  (diminish 'auto-revert-mode)
  (diminish 'yas-minor-mode))

;; Misc
(tabbar-mode 0)
(unicode-fonts-setup)

;; Multi-term settings
(setq multi-term-program "/bin/zsh")
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)))
(add-hook 'term-mode-hook
          (lambda ()
            (define-key term-raw-map (kbd "C-y") 'term-paste)))

;; JS2 mode
(flycheck-mode t)
(setq js-indent-level 2)
(add-hook 'js2-mode-hook 'flycheck-mode)

;; Kill backup files!
(setq make-backup-files nil
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      echo-keystrokes 0.1
      visible-bell t)

(provide 'misc-init)
;;; misc-init.el ends here
