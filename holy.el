;;; holy.el --- Load configs for holy config
;;; Commentary:

;;; Code:
(defvar mode-evil 0)
(defun keymapper (key func)
  "Bind KEY to FUNC."
  (local-set-key (kbd key) func))

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
(use-package web-init        :load-path "elisp/")
;; (use-package rust-init       :load-path "elisp/")
;; (use-package proof           :load-path "elisp/")

(provide 'holy)
;;; holy.el ends here
