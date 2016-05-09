;;; init.el --- Main load file for emacs
;;; Commentary: No longer do I keep a ~/.emacs file.

;;; Code:

;; Add .emacs.d/elisp/ subdirectory to load path
(setq main-src-path (concat user-emacs-directory "elisp"))
(add-to-list 'load-path main-src-path)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(require 'use-package-conf)

;; Settings specific files
(use-package functions       :load-path "elisp/")
(use-package appearance      :load-path "elisp/")
(use-package keybindings     :load-path "elisp/")
(use-package settings        :load-path "elisp/")
(use-package mode-line       :load-path "elisp/")
(use-package misc-init       :load-path "elisp/")
(use-package aggress-indent  :load-path "elisp/")
(use-package erc-init        :load-path "elisp/")
(use-package erc-nick-colors :load-path "elisp/")

;; Package specific configurations
(use-package neotree-init    :load-path "elisp/")
(use-package helm-init       :load-path "elisp/")
(use-package company-init    :load-path "elisp/")
(use-package projectile-init :load-path "elisp/")
(use-package avy-ace-init    :load-path "elisp/")
(use-package sudo-save       :load-path "elisp/")
(use-package gtc-init        :load-path "elisp/")

;; Language specific files
;;(use-package haskell-init    :load-path "elisp/")
(use-package hs-init         :load-path "elisp/")
(use-package tex-init        :load-path "elisp/")
(use-package ts-init         :load-path "elisp/")
(use-package py-init         :load-path "elisp/")
(use-package scala-init      :load-path "elisp/")
(use-package web-init        :load-path "elisp/")


;; Welcome message
(setq initial-major-mode 'lisp-interaction-mode)
(setq initial-scratch-message "\
      ___           ___           ___           ___           ___
     /  /\\         /__/\\         /  /\\         /  /\\         /  /\\
    /  /:/_       |  |::\\       /  /::\\       /  /:/        /  /:/_
   /  /:/ /\\      |  |:|:\\     /  /:/\\:\\     /  /:/        /  /:/ /\\
  /  /:/ /:/_   __|__|:|\\:\\   /  /:/~/::\\   /  /:/  ___   /  /:/ /::\\
 /__/:/ /:/ /\\ /__/::::| \\:\\ /__/:/ /:/\\:\\ /__/:/  /  /\\ /__/:/ /:/\\:\\
 \\  \\:\\/:/ /:/ \\  \\:\\~~\\__\\/ \\  \\:\\/:/__\\/ \\  \\:\\ /  /:/ \\  \\:\\/:/~/:/
  \\  \\::/ /:/   \\  \\:\\        \\  \\::/       \\  \\:\\  /:/   \\  \\::/ /:/
   \\  \\:\\/:/     \\  \\:\\        \\  \\:\\        \\  \\:\\/:/     \\__\\/ /:/
    \\  \\::/       \\  \\:\\        \\  \\:\\        \\  \\::/        /__/:/
     \\__\\/         \\__\\/         \\__\\/         \\__\\/         \\__\\/
")

