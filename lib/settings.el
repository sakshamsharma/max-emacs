;;; settings.el --- Contains basic settings for my emacs
;;; Commentary:
;;; Contains the settings for tabspaces etc.

;;; Code:

; Stop startup message
(setq inhibit-startup-message 1)

(setq-default scroll-step 2)
(setq-default visible-bell 1)

(display-time)    ;; Show time in modeline
(column-number-mode 1) ;; Show column number in modeline

(setq-default kill-whole-line 1)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(electric-pair-mode 1)

(semantic-mode 1)

(scroll-bar-mode -1)
(scroll-bar-mode -1)

;; Fix font size
(set-face-attribute 'default nil :height 120)

;; Avoid cluttering folders with temporary files
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

(setq backup-directory-alist
      `((".*" . , "~/.saves")))
(setq auto-save-file-name-transforms
      `((".*" , "~/.saves" t)))

(autoload 'zap-up-to-char "misc"
  "Kill up to, but not including ARGth occurrence of CHAR.
  
  \(fn arg char)"
  'interactive)

(setq cua-enable-cua-keys nil)
(cua-mode)

; Vim style non-jumpy scrolling
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

; Save last location in file
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

; Show matching parenthesis
(show-paren-mode t)

; Indent with return
(define-key global-map (kbd "RET") 'newline-and-indent)

(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'settings.el)
;;; settings.el ends here
