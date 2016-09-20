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
                auto-complete
                markdown-mode
                multi-term
                js2-mode
                unicode-fonts
                rainbow-delimiters
                auctex))

(use-package smbc
  :ensure t)

;; Use C-c right or left to get back previous buffer states
(use-package winner
  :ensure t
  :defer t
  :config
  (winner-mode 1))

(use-package dot-mode
  :ensure t
  :config
  (global-set-key [(control ?.)] (lambda () (interactive) (dot-mode 1)
                                   (message "Dot mode activated."))))

(use-package smartparens-config
  :ensure smartparens
  :config
  (progn
    (show-smartparens-global-mode t))
  (smartparens-global-mode t))

(use-package nlinum-relative
  :ensure t
  :config
  ;; something else you want
  (nlinum-relative-on)
  (add-hook 'prog-mode-hook 'nlinum-relative-mode)
  (setq nlinum-relative-redisplay-delay 0)      ;; delay
  (setq nlinum-relative-current-symbol "->")      ;; or "" for display current line number
  (setq nlinum-relative-offset 1)                 ;; 1 if you want 0, 2, 3...
  )

(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'markdown-mode-hook 'turn-on-smartparens-strict-mode)

(use-package switch-window
  :ensure t
  :bind (("M-o" . switch-window)
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

;; Misc
;;(unicode-fonts-setup)

;; Multi-term settings
(setq multi-term-program "/bin/zsh")
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)))
(add-hook 'term-mode-hook
          (lambda ()
            (define-key term-raw-map (kbd "C-y") 'term-paste)))

;; JS2 mode
(setq js-indent-level 2)
(add-hook 'js2-mode-hook 'flycheck-mode)

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

(provide 'misc-init)
;;; misc-init.el ends here
