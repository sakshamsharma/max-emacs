;;; evil-init.el -- Org mode
;;; Commentary:

;;; Code:

(require 'use-package)

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

(use-package evil
  :ensure t
  :config
  (evil-mode 1)

  (defun nmap (keys fxn)
    "Maps KEYS to FXN in Normal Mode."
    (define-key evil-normal-state-map (kbd keys) fxn))

  (defun vmap (keys fxn)
    "Maps KEYS to FXN in Visual Mode."
    (define-key evil-visual-state-map (kbd keys) fxn))

  (defun imap (keys fxn)
    "Maps KEYS to FXN in Insert Mode."
    (define-key evil-insert-state-map (kbd keys) fxn))

  ;;; Escape key works for normal stuff
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

  ;; Swap ; with :
  (nmap ";" 'evil-ex)
  (nmap ":" 'evil-repeat-find-char)

  ;; Fix the ctrl-u scroll issue
  (nmap "C-u" 'evil-scroll-up)
  (vmap "C-u" 'evil-scroll-up)
  (imap "C-u" '(lambda ()
                 (interactive)
                 (evil-delete (point-at-bol) (point))))

  ;; Window switching made easy
  (nmap "C-l" 'evil-window-right)
  (nmap "C-h" 'evil-window-left)
  (nmap "C-j" 'evil-window-down)
  (nmap "C-k" 'evil-window-up)

  (nmap "C-p" 'helm-projectile)
  (nmap "C-S-p" 'helm-projectile-recentf)

  ;; Make movement keys work like they should
  (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>")
    'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>")
    'evil-previous-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>")
    'evil-next-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>")
    'evil-previous-visual-line)

  (find-function-on-key (kbd "M-."))

  ;; Make horizontal movement cross lines
  (setq-default evil-cross-lines t)

  ;; Evil packages
  (use-package evil-nerd-commenter
    :ensure t)

  (use-package key-chord
    :ensure t
    :config
    (key-chord-mode 1)
    (key-chord-define evil-normal-state-map "//"
                      #'evilnc-comment-or-uncomment-lines))

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode 1))

  (use-package evil-matchit
    :ensure t
    :config
    (global-evil-matchit-mode 1))

  (use-package evil-multiedit
    :ensure t
    :config
    (evil-multiedit-default-keybinds))

  (use-package evil-snipe
    :ensure t
    :config
    (evil-snipe-mode 1)
    (setq evil-snipe-scope 'whole-visible))

  (use-package evil-numbers
    :ensure t
    :config
    (nmap "C-a" 'evil-numbers/inc-at-pt)
    (nmap "C-z" 'evil-numbers/dec-at-pt))

  ;; Newer magit bindings
  (use-package evil-magit
    :ensure t)

  (use-package ranger
    :ensure t
    :config
    (ranger-override-dired-mode t)
    (setq ranger-cleanup-eagerly t)
    (setq ranger-dont-show-binary t))
  )

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
(use-package go-init         :load-path "elisp/")

(provide 'evil-init)

;;; evil-init.el ends here
