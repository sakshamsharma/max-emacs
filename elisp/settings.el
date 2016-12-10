;;; settings.el --- Contains basic settings for my emacs
;;; Commentary:
;;; Contains the settings for tabspaces etc.

;;; Code:

;; Stop startup message
(setq inhibit-startup-message 1)

(setq-default scroll-step 4)
(setq-default visible-bell 1)

(setq-default kill-whole-line 1)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(setq tramp-default-method "ssh")
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))

(autoload 'zap-up-to-char "misc"
  "Kill up to, but not including ARGth occurrence of CHAR.
  \(fn arg char)"
  'interactive)
(global-set-key "\M-z" 'zap-up-to-char)

(recentf-mode 1)
(setq-default recent-save-file "~/.emacs.d/recentf")

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

(setq auto-save-file-name-transforms
      `((".*" , "~/.saves" t)))

(message "Deleting old backup files...")
(let ((week (* 60 60 24 7))
      (current (float-time (current-time))))
  (dolist (file (directory-files temporary-file-directory t))
    (when (and (backup-file-name-p file)
               (> (- current (float-time (fifth (file-attributes file))))
                  week))
      (message "%s" file)
      (delete-file file))))

(setq cua-enable-cua-keys nil)
(cua-mode)

;; Vim style non-jumpy scrolling
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

;; Save last location in file
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

;; Show matching parenthesis
(show-paren-mode t)

;; Set the frame title
(setq frame-title-format '(buffer-file-name "%f - Emacs" ("%b - Emacs")))

;; System file settings
(setq backup-by-copying-when-linked t)   ; Preserve hardlink
(setq backup-by-copying-when-mismatch t) ; Preserve owner and group of file

;; Indent with return
(define-key global-map (kbd "RET") 'newline-and-indent)

(defalias 'yes-or-no-p 'y-or-n-p)

;; save-hist
;; Saving emacs history
(require 'savehist)
(savehist-mode 1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
(setq savehist-file "~/.emacs.d/savehist")

;; mouse
(require 'mouse)
(xterm-mouse-mode)

(desktop-save-mode 1)
(setq line-move-visual 1) ; Line wrap on word endings
(visual-line-mode 1)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)


;; Why did I not know of this earlier? This is for CamelCase
(subword-mode)

(setq scroll-preserve-screen-position t)
;;(setq scroll-preserve-screen-position 'always)

;; Awesome package for proper pdf support
(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode))

(provide 'settings)
;;; settings.el ends here
