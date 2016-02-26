;;; appearance.el --- Appearance settings
;;; Commentary:
;;; Contains settings related to appearance

;;; Code:

(require 'use-package)

(use-package spaceline
  :ensure t)
(use-package spacemacs-theme
  :ensure t)

;; To ensure theme etc are completely implemented
;; When running in daemon mode (which is, all the time)
(if (daemonp)
    (add-hook 'after-make-frame-functions
        (lambda (frame)
            (select-frame frame)
            (load-theme 'spacemacs-dark t)
            (tool-bar-mode -1)
            (scroll-bar-mode -1)
            (blink-cursor-mode -1)
            )))

;; Again, to fix some stuff which doesn't work in non-daemon mode
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (blink-cursor-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(setq default-frame-alist '((font . "Source Code Pro for Powerline-12")))

(provide 'appearance)
;;; appearance.el ends here
