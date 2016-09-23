;;; init.el --- Main load file for emacs
;;; Commentary:
;;; No longer do I keep a ~/.emacs file.

;;; Code:

;; Add .emacs.d/elisp/ subdirectory to load path
(setq main-src-path (concat user-emacs-directory "elisp"))
(add-to-list 'load-path main-src-path)

(require 'package)

;; (if (fboundp 'gnutls-available-p)
;;     (fmakunbound 'gnutls-available-p))
;; (setq tls-program '("gnutls-cli --tofu -p %p %h")
;;       imap-ssl-program '("gnutls-cli --tofu -p %p %s")
;;       smtpmail-stream-type 'starttls
;;       starttls-extra-arguments '("--tofu"))

(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

(require 'use-package-conf)

;; Settings specific files
(use-package functions       :load-path "elisp/")
(use-package appearance      :load-path "elisp/")
(use-package keybindings     :load-path "elisp/")
(use-package settings        :load-path "elisp/")
(use-package skeletons       :load-path "elisp/")
(use-package whitespace      :load-path "elisp/")
(use-package misc-init       :load-path "elisp/")
(use-package aggress-indent  :load-path "elisp/")
(use-package erc-init        :load-path "elisp/")
(use-package erc-nick-colors :load-path "elisp/")

;; Package specific configurations
(use-package neotree-init    :load-path "elisp/")
(use-package flycheck-init   :load-path "elisp/")
(use-package helm-init       :load-path "elisp/")
(use-package company-init    :load-path "elisp/")
(use-package projectile-init :load-path "elisp/")
(use-package avy-ace-init    :load-path "elisp/")
(use-package sudo-save       :load-path "elisp/")
(use-package gtc-init        :load-path "elisp/")
(use-package git-init        :load-path "elisp/")
(use-package org-init        :load-path "elisp/")
(use-package sp-init         :load-path "elisp/")

;; Language specific files
(use-package hs-init         :load-path "elisp/")
(use-package tex-init        :load-path "elisp/")
(use-package ts-init         :load-path "elisp/")
(use-package py-init         :load-path "elisp/")
(use-package scala-init      :load-path "elisp/")
(use-package java-init       :load-path "elisp/")
(use-package scheme-init     :load-path "elisp/")
(use-package slime-init      :load-path "elisp/")
(use-package irony-init      :load-path "elisp/")
;; (use-package rust-init       :load-path "elisp/")
;; (use-package web-init        :load-path "elisp/")

;; Since proof-general doesn't have a package on melpa
;; (load "~/.emacs.d/lisp/PG/generic/proof-site")
;; (use-package company-coq
;;   :ensure t
;;   :config
;;   (add-hook 'coq-mode-hook #'company-coq-mode)
;;   (custom-set-variables
;;    '(coq-prog-args '("-I" "SRC"))))

;; Welcome message
(setq initial-major-mode 'lisp-interaction-mode)
(setq initial-scratch-message "\
;;      ___           ___           ___           ___           ___
;;     /  /\\         /__/\\         /  /\\         /  /\\         /  /\\
;;    /  /:/_       |  |::\\       /  /::\\       /  /:/        /  /:/_
;;   /  /:/ /\\      |  |:|:\\     /  /:/\\:\\     /  /:/        /  /:/ /\\
;;  /  /:/ /:/_   __|__|:|\\:\\   /  /:/~/::\\   /  /:/  ___   /  /:/ /::\\
;; /__/:/ /:/ /\\ /__/::::| \\:\\ /__/:/ /:/\\:\\ /__/:/  /  /\\ /__/:/ /:/\\:\\
;; \\  \\:\\/:/ /:/ \\  \\:\\~~\\__\\/ \\  \\:\\/:/__\\/ \\  \\:\\ /  /:/ \\  \\:\\/:/~/:/
;;  \\  \\::/ /:/   \\  \\:\\        \\  \\::/       \\  \\:\\  /:/   \\  \\::/ /:/
;;   \\  \\:\\/:/     \\  \\:\\        \\  \\:\\        \\  \\:\\/:/     \\__\\/ /:/
;;    \\  \\::/       \\  \\:\\        \\  \\:\\        \\  \\::/        /__/:/
;;     \\__\\/         \\__\\/         \\__\\/         \\__\\/         \\__\\/
")

(provide 'init)
;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-ghc-show-info t)
 '(custom-safe-themes
   (quote
    ("45712b65018922c9173439d9b1b193cb406f725f14d02c8c33e0d2cdad844613" default)))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote stack-ghci))
 '(haskell-tags-on-save t)
 '(safe-local-variable-values
   (quote
    ((flycheck-gcc-language-standard . c++11)
     (flycheck-clang-language-standard . c++11))))
 '(znc-servers
   (quote
    (("irc.varstack.com" 9002 t
      ((irc\.varstack\.com "saksham" "saksham")))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
