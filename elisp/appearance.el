;;; appearance.el --- Appearance settings
;;; Commentary:
;;; Contains settings related to appearance

;;; Code:

(require 'use-package)

;; Optional
;; Looks awesome, but I've moved on from this
;; (use-package powerline
;;   :ensure t
;;   :config
;;   (powerline-default-theme)
;;   (custom-set-faces
;;    '(powerline-active1 ((t (:background "#eee8d5" :foreground "#215264"))))))

;; Highlight the current line
(global-hl-line-mode)

;; Pretty dark theme :)
(use-package jbeans-theme
  :ensure t)

(use-package cursor-chg
  :ensure t
  :config
  ;; Turn on change for overwrite, read-only, and input mode
  ;; Also, gives a line cursor
  ;; ^ The only reason I have it here
  (change-cursor-mode 1))

;; To ensure theme etc are completely implemented
;; When running in daemon mode (which is, all the time)
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (select-frame frame)
                (load-theme 'jbeans t)

                ;; Font settings
                (setq default-frame-alist '((font . "Literation Mono Powerline-14")
                                            (alpha 95 95)))
                (set-face-attribute 'default nil :height 140)

                ;; Disable extra bells and whisles
                (tool-bar-mode -1)
                (scroll-bar-mode -1)
                (blink-cursor-mode -1)
                (menu-bar-mode -1))))


(setq default-frame-alist '((font . "Literation Mono Powerline-14")
                            (alpha 95 95)))

;; ;; Again, to fix some stuff which doesn't work in non-daemon mode
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))

  (load-theme 'jbeans t)
  (setq default-frame-alist '((font . "Literation Mono Powerline-14")
                              (alpha 95 95)))
  (set-face-attribute 'default nil :height 160)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (blink-cursor-mode -1)
  (menu-bar-mode -1))

(provide 'appearance)
;;; appearance.el ends here
