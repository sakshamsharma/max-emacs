;;; package-management.el --- settings for package manager
;;; Commentary:
;;; Start loading the package manager

;;; Code:
(require 'package)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "667e296942c561382fe0a8584c26be0fe7a80416270c3beede8c6d69f2f77ccc" "04d735f8b10046cbfc7a002f199cac24e3db78b2d19a5f6c8ea182493f3c0655" default)))
 '(send-mail-function nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(defvar required-packages
  '(
    magit
    spaceline
    spacemacs-theme
    on-screen
    yasnippet
    ace-jump-mode
    tabbar
    ido
    powerline
    auto-complete
    markdown-mode
    multi-term
    dart-mode
    helm
    js2-mode
    spaceline
    anzu
    nyan-mode
    fancy-battery
    eyebrowse
    window-numbering
    unicode-fonts
    diminish
    haskell-mode
    ) "a list of packages to ensure are installed at launch.")

; method to check if all packages are installed
(defun packages-installed-p ()
  (cl-loop for p in required-packages
        when (not (package-installed-p p)) do (cl-return nil)
        finally (cl-return t)))

; if not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)
  ; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;; Some packages I like to load whenever they get time
(require 'sudo-save)

(provide 'package-management.el)
;;; package-management.el ends here
