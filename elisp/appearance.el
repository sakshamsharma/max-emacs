;;; appearance.el --- Appearance settings
;;; Commentary:
;;; Contains settings related to appearance

;;; Code:

(require 'use-package)

;; Optional. Works nicely without this too.
;; (use-package powerline
;;   :ensure t
;;   :config
;;   (powerline-default-theme)
;;   (custom-set-faces
;; '(powerline-active1 ((t (:background "#eee8d5" :foreground "#215264"))))))

;; Highlight the current line
(global-hl-line-mode)

;; Pretty dark theme :)
(use-package jbeans-theme
  :ensure t)
(use-package color-theme-sanityinc-tomorrow
  :ensure t)
(use-package doom-themes
  :ensure t)
(use-package zerodark
  :ensure t
  :config
  (zerodark-setup-modeline-format))

;; To ensure theme etc are completely implemented
;; When running in daemon mode (which is, all the time)
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (select-frame frame)
                (load-theme 'doom-tomorrow-night t)

                ;; (custom-set-faces
                ;;  '(powerline-active1 ((t (:background "#eee8d5" :foreground "#215264")))))

                ;; Font settings
                (setq default-frame-alist '((font . "Source Code Pro For Powerline-12")
                                            (alpha 95 95)))
                (set-face-attribute 'default nil :height 130)

                ;; Disable extra bells and whisles
                (tool-bar-mode -1)
                (scroll-bar-mode -1)
                (blink-cursor-mode -1)
                (menu-bar-mode -1))))


(setq default-frame-alist '((font . "Source Code Pro For Powerline-12")
                            (alpha 95 95)))
(set-face-attribute 'default nil :height 130)

;; ;; Again, to fix some stuff which doesn't work in non-daemon mode
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))

  (load-theme 'doom-tomorrow-night t)

  ;; (custom-set-faces
  ;;  '(powerline-active1 ((t (:background "#eee8d5" :foreground "#215264")))))
  (setq default-frame-alist '((font . "Source Code Pro For Powerline-12")
                              (alpha 95 95)))
  (set-face-attribute 'default nil :height 130)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (blink-cursor-mode -1)
  (menu-bar-mode -1))

(provide 'appearance)
;;; appearance.el ends here
