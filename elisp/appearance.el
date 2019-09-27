;;; appearance.el --- Appearance settings
;;; Commentary:
;;; Contains settings related to appearance

;;; Code:

(require 'use-package)

;; Highlight the current line
(global-hl-line-mode)

(use-package zerodark-theme
  :defer t
  :ensure t)
(use-package darkokai-theme
  :defer t
  :ensure t)
(use-package jbeans-theme
  :defer t
  :ensure t)
(use-package doom-themes
  :defer t
  :ensure t)

(defun setTheme (themeName)
  "Set the theme to THEMENAME."
  (interactive "sWhat theme do you want to use? ")
  (if (display-graphic-p)
      (load-theme (intern themeName) t)))

(defun setFont (fntName)
  "Set the font to FNTNAME."
  (interactive "sWhat font name do you want to set? ")
  (set-face-attribute 'default nil
                      :family fntName
                      :height 110
                      :weight 'normal
                      :width 'normal))

(defun disableBells ()
  "Disable some graphical bells and whistles (literally)."
  (interactive)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (blink-cursor-mode -1)
  (menu-bar-mode -1))

(defun frameActions ()
  "Do actions to set up appearance of frame."
  (interactive)
  (let ((myTheme "doom-tomorrow-night") (myFont "Source Code Pro For Powerline"))
    (setTheme myTheme)
    (setFont myFont)))

(defun new-frame-setup (frame)
  "Describe if FRAME is graphical."
  (if (display-graphic-p frame)
      (frameActions)
    (message "not a window system")))

(if (daemonp)
    (add-hook 'after-make-frame-functions
        (lambda (frame)
            (select-frame frame)
            (frameActions)))
    (frameActions))

(use-package mode-line)

(provide 'appearance)
;;; appearance.el ends here
