;;; misc-init.el -- Miscellaneous packages
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package markdown-mode
  :ensure t
  :defer t)

(use-package unicode-fonts
  :ensure t
  :defer t)

(use-package nix-mode
  :ensure t
  :defer t)

;; Sweet relative numbering
(use-package nlinum-relative
  :ensure t
  :defer t
  :config
  (nlinum-relative-on)
  (add-hook 'prog-mode-hook 'nlinum-relative-mode)
  (setq nlinum-relative-redisplay-delay 0.5)   ;; delay
  (setq nlinum-relative-current-symbol "->") ;; or "" for current line
  (setq nlinum-relative-offset 1))

(use-package smbc
  :defer t
  :ensure t)

(use-package switch-window
  :ensure t
  :bind (;; other-window shows a number when switching
         ;; ("M-o"   . switch-window)
         ("M-o"   . other-window)
         ("C-x o" . other-window)))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package diminish
  :ensure t
  :config
  (diminish 'auto-revert-mode)
  (diminish 'yas-minor-mode))

(use-package saveplace
  :config (save-place-mode))

;; Indents the file according to current settings
(use-package dtrt-indent
  :ensure t
  :defer t
  :config
  (setq dtrt-indent-mode 1))

(use-package all-the-icons
  :ensure t)

(use-package multi-term
  :ensure t
  :config
  (setq multi-term-program "/usr/bin/env zsh")
  (add-hook 'term-mode-hook
            (lambda ()
              (setq term-buffer-maximum-size 10000)))
  :bind (:map term-raw-map (("C-y" . term-paste)
                            ("M-o" . other-window))))

;; Kill backup files!
(setq make-backup-files nil
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      echo-keystrokes 0.1
      visible-bell t)

(use-package exec-path-from-shell
  :ensure t)

(use-package pdf-tools
  :ensure t)

(use-package undo-tree
  :ensure t
  :defer t)


(provide 'misc-init)
;;; misc-init.el ends here
