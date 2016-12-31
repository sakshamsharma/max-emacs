;;; holy.el --- Load configs for holy config
;;; Commentary:

;;; Code:
(defvar mode-evil 0)
(defun keymapper (key func)
  "Bind KEY to FUNC."
  (local-set-key (kbd key) func))

;; Settings specific files
(use-package functions)
(use-package appearance)
(use-package keybindings)
(use-package settings)
(use-package skeletons)
(use-package whitespace)
(use-package misc-init)
(use-package aggress-indent)
(use-package erc-init)
(use-package erc-nick-colors)

;; Package specific configurations
(use-package neotree-init)
(use-package flycheck-init)
(use-package helm-init)
(use-package company-init)
(use-package projectile-init)
(use-package avy-ace-init)
(use-package sudo-save)
(use-package gtc-init)
(use-package git-init)
(use-package org-init)
(use-package sp-init)

;; Language specific files
(use-package hs-init)
(use-package tex-init)
(use-package ts-init)
(use-package py-init)
(use-package scala-init)
(use-package java-init)
(use-package scheme-init)
(use-package slime-init)
(use-package irony-init)
(use-package web-init)
;; (use-package rust-init)
;; (use-package proof)

(provide 'holy)
;;; holy.el ends here
