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
                tabbar
                powerline
                auto-complete
                markdown-mode
                multi-term
                dart-mode
                js2-mode
                nyan-mode
                unicode-fonts
                auctex
                ;undo-tree
                ))

;; Misc
(tabbar-mode 1)
(unicode-fonts-setup)
;(global-undo-tree-mode)
;(setq undo-tree-auto-save-history -1)

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


(provide 'misc-init)
;;; misc-init.el ends here
