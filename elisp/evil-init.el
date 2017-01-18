;;; evil-init.el -- Org mode
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

(use-package evil
  :ensure t
  :config
  (evil-mode 1)

  (defun nmap (keys fxn)
    "Maps KEYS to FXN in Normal Mode."
    (define-key evil-normal-state-map (kbd keys) fxn))

  (defun mmap (keys fxn)
    "Maps KEYS to FXN in Motion Mode."
    (define-key evil-motion-state-map (kbd keys) fxn))

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
  (nmap "<remap> <evil-next-line>" 'evil-next-visual-line)
  (nmap "<remap> <evil-previous-line>" 'evil-previous-visual-line)
  (mmap "<remap> <evil-next-line>" 'evil-next-visual-line)
  (mmap "<remap> <evil-previous-line>" 'evil-previous-visual-line)

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
    ;; Highlights all matches of the selection in the buffer.
    (define-key evil-visual-state-map "R" 'evil-multiedit-match-all)

    ;; Match the word under cursor (i.e. make it an edit region). Consecutive
    ;; presses will incrementally add the next unmatched match.
    (define-key evil-normal-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
    ;; Match selected region.
    (define-key evil-visual-state-map (kbd "M-d") 'evil-multiedit-match-and-next)

    ;; Same as M-d but in reverse.
    (define-key evil-normal-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)
    (define-key evil-visual-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)

    ;; OPTIONAL: If you prefer to grab symbols rather than words, use
    ;; `evil-multiedit-match-symbol-and-next` (or prev).

    ;; Restore the last group of multiedit regions.
    (define-key evil-visual-state-map (kbd "C-M-D") 'evil-multiedit-restore)

    ;; RET will toggle the region under the cursor
    (define-key evil-multiedit-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

    ;; ...and in visual mode, RET will disable all fields outside the selected
    ;; region
    (define-key evil-motion-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

    ;; For moving between edit regions
    (define-key evil-multiedit-state-map (kbd "C-n") 'evil-multiedit-next)
    (define-key evil-multiedit-state-map (kbd "C-p") 'evil-multiedit-prev)
    (define-key evil-multiedit-insert-state-map (kbd "C-n") 'evil-multiedit-next)
    (define-key evil-multiedit-insert-state-map (kbd "C-p") 'evil-multiedit-prev)

    ;; Allows you to invoke evil-multiedit with a regular expression
    (evil-ex-define-cmd "ie[dit]" 'evil-multiedit-ex-match)

    )

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
;; (use-package rust-init)

(provide 'evil-init)

;;; evil-init.el ends here
