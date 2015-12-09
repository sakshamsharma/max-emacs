;;; appearance.el --- src/appearance.el
;;; Commentary:
;;; Contains settings related to appearance

;;; Code:

;; Set up theme
(setq custom-safe-themes t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/")
;(load-theme 'spacemacs-dark t)
(load-theme 'wombat t)

;; Ensure you don't get to see the buttons at the top in window mode
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (blink-cursor-mode -1)
  (tool-bar-mode -1))

;; Ditch scrollbars
(scroll-bar-mode -1)

(provide 'appearance.el)
;;; appearance.el ends here
