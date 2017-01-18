;;; holy-init.el -- Holy code
;;; Commentary:

;;; Code:

(require 'use-package)

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
(use-package go-init)
(use-package rust-init)

(provide 'holy-init)

;;; holy-init.el ends here
