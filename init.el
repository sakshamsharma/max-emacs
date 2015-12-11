;;; init.el --- Main load file for emacs
;;; Commentary: No longer do I keep a ~/.emacs file.

;;; Code:

;; Add Emacs subdirectories to load path
(setq main-src-path (concat user-emacs-directory "lib"))
(add-to-list 'load-path main-src-path)

;; Load basic tweaks file
(require 'settings.el)

;; Load custom functions
(require 'functions.el)

;; Load keybindings
(require 'keybindings.el)

;; Load settings for package manager and package list
(require 'package-management.el)

;; Installed packages settings
(require 'installed-settings.el)

;; Load appearance file
(require 'appearance.el)

;; =========================
;; =========================
;; Package specific settings
;; =========================
;; =========================

;; ========
;; doc-view
;; ========
(require 'doc-view)

;; Continous scrolling in doc view
(setq doc-view-continuous t)

;; view docs and scroll the page while in another buffer
(fset 'doc-prev "\C-xo\C-x[\C-xo")
(fset 'doc-next "\C-xo\C-x]\C-xo")
(global-set-key (kbd "M-[") 'doc-prev)
(global-set-key (kbd "M-]") 'doc-next)

;; Zooming in doc view with control+mouse
(global-set-key [C-mouse-4] 'text-scale-increase)
(global-set-key [C-wheel-up] 'text-scale-decrease)

;; =========
;; save-hist
;; =========
(require 'savehist)

;; Saving emacs history
(savehist-mode 1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
(setq savehist-file "~/.emacs.d/savehist")

;; =====
;; mouse
;; =====
(require 'mouse)
(xterm-mouse-mode t)

(tool-bar-mode -1)

(setq default-frame-alist '((font . "Source Code Pro for Powerline-12")))

;; Welcome message
;(setq initial-major-mode 'lisp-interaction-mode)
;(setq initial-scratch-message "\
;;      ___           ___           ___           ___           ___     
;;     /  /\         /__/\         /  /\         /  /\         /  /\    
;;    /  /:/_       |  |::\       /  /::\       /  /:/        /  /:/_   
;;   /  /:/ /\      |  |:|:\     /  /:/\:\     /  /:/        /  /:/ /\  
;;  /  /:/ /:/_   __|__|:|\:\   /  /:/~/::\   /  /:/  ___   /  /:/ /::\ 
;; /__/:/ /:/ /\ /__/::::| \:\ /__/:/ /:/\:\ /__/:/  /  /\ /__/:/ /:/\:\
;; \  \:\/:/ /:/ \  \:\~~\__\/ \  \:\/:/__\/ \  \:\ /  /:/ \  \:\/:/~/:/
;;  \  \::/ /:/   \  \:\        \  \::/       \  \:\  /:/   \  \::/ /:/ 
;;   \  \:\/:/     \  \:\        \  \:\        \  \:\/:/     \__\/ /:/  
;;    \  \::/       \  \:\        \  \:\        \  \::/        /__/:/   
;;     \__\/         \__\/         \__\/         \__\/         \__\/    
;")
