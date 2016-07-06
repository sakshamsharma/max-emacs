;;; appearance.el --- Appearance settings
;;; Commentary:
;;; Contains settings related to appearance

;;; Code:

(require 'use-package)

(use-package powerline
  :ensure t
  :config
  (powerline-default-theme)
  (custom-set-faces
   '(powerline-active1 ((t (:background "#eee8d5" :foreground "#215264"))))))

;; Highlight the current line
(global-hl-line-mode)

(use-package cursor-chg
  :ensure t
  :config
  ;; Turn on cursor change when Emacs is idle
  (toggle-cursor-type-when-idle 1)
  ;; Turn on change for overwrite, read-only, and input mode
  (change-cursor-mode 1))

(use-package color-theme-sanityinc-solarized
  :ensure t)

;; To ensure theme etc are completely implemented
;; When running in daemon mode (which is, all the time)
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (select-frame frame)
                ;;(load-theme 'spacemacs-dark t)
                (load-theme 'sanityinc-solarized-dark t)
                (tool-bar-mode -1)
                (scroll-bar-mode -1)
                (blink-cursor-mode -1)
                (menu-bar-mode -1)
                (setq default-frame-alist '((font . "Literation Mono Powerline-14")))
                (set-frame-font "Literation Mono Powerline-14" nil t)
                (set-face-attribute 'default nil :height 140)
                (set-frame-parameter (selected-frame) 'alpha '(90 90))
                (add-to-list 'default-frame-alist '(alpha 90 90)))))

;; Again, to fix some stuff which doesn't work in non-daemon mode
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (blink-cursor-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  ;;(load-theme 'spacemacs-dark t)
  (load-theme 'sanityinc-solarized-dark t)
  (set-frame-parameter (selected-frame) 'alpha '(90 90))
  (add-to-list 'default-frame-alist '(alpha 90 90))
  (setq default-frame-alist '((font . "Literation Mono Powerline-14")))
  (set-frame-font "Literation Mono Powerline-14" nil t)
  (set-face-attribute 'default nil :height 140)
  (scroll-bar-mode -1))

(provide 'appearance)
;;; appearance.el ends here
