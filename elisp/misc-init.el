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

(use-packages '(on-screen
                markdown-mode
                unicode-fonts
                rainbow-delimiters))

;; Use C-c right or left to get back previous buffer states
(use-package winner
  :ensure t
  :defer t
  :config
  (winner-mode 1))

(use-package nix-mode
  :ensure t)

;; Sweet relative numbering
(use-package nlinum-relative
  :ensure t
  :config
  (nlinum-relative-on)
  (add-hook 'prog-mode-hook 'nlinum-relative-mode)
  (setq nlinum-relative-redisplay-delay 0.5)   ;; delay
  (setq nlinum-relative-current-symbol "->") ;; or "" for current line
  (setq nlinum-relative-offset 1))

(use-package eyebrowse
  :ensure t
  :config
  (eyebrowse-mode t))

(use-package smbc
  :ensure t)

(use-package switch-window
  :ensure t
  :bind (
         ;; other-window shows a number when switching
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
  :init (save-place-mode))

;; Indents the file according to current settings
(use-package dtrt-indent
  :ensure t)

(use-package all-the-icons
  :ensure t)

(use-package change-inner
  :ensure t
  :config
  (global-set-key (kbd "M-S-i") 'change-inner)
  (global-set-key (kbd "M-S-o") 'change-outer))

(use-package multi-term
  :ensure t
  :config
  (setq multi-term-program "/bin/zsh")
  (add-hook 'term-mode-hook
            (lambda ()
              (setq term-buffer-maximum-size 10000)))
  :bind (:map term-raw-map (("C-y" . term-paste)
                            ("M-o" . other-window))))
  ;; (add-hook 'term-mode-hook
  ;;           (lambda ()
  ;;             (define-key term-raw-map (kbd "C-y") 'term-paste)
  ;;             (define-key term-raw-map (kbd "M-o") 'other-window)
  ;;             )))

(use-package js2-mode
  :ensure t
  :config
  (setq js-indent-level 2)
  (add-hook 'js2-mode-hook 'flycheck-mode))

;; Kill backup files!
(setq make-backup-files nil
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      echo-keystrokes 0.1
      visible-bell t)

;; Dired fun
(eval-after-load "dired-aux"
  '(add-to-list 'dired-compress-file-suffixes
                '("\\.zip\\'" ".zip" "unzip")))

(use-package exec-path-from-shell
  :ensure t)

;; (use-package multiple-cursors
;;   :ensure t
;;   :config
;;   (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;;   (global-set-key (kbd "C->") 'mc/mark-next-like-this)
;;   (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;;   (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install))

(use-package bison-mode
  :ensure t)

(use-package undo-tree
  :ensure t)

(provide 'misc-init)
;;; misc-init.el ends here
