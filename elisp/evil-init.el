;;; evil-init.el -- My evil configuration.
;;; Commentary:

;;; Code:

;; Settings specific files
(use-package functions)
(use-package appearance)
(use-package keybindings)
(use-package settings)
(use-package whitespace)
(use-package misc-init)

;; Package specific configurations
(use-package neotree-init)
(use-package flycheck-init)
(use-package helm-init)
(use-package company-init)
(use-package projectile-init)
(use-package git-init)
(use-package org-init)
(use-package sp-init)

(defun kill-cur-buf ()
  "Call kill on current buffer."
  (interactive)
  (kill-buffer (current-buffer)))

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
  (vmap ";" 'evil-ex)
  ;; (nmap ":" 'evil-repeat-find-char)

  (nmap "M-." 'nil)

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

  (evil-ex-define-cmd "q[uit]" 'kill-cur-buf)

  ;; Make movement keys work like they should
  (nmap "<remap> <evil-next-line>" 'evil-next-visual-line)
  (nmap "<remap> <evil-previous-line>" 'evil-previous-visual-line)
  (mmap "<remap> <evil-next-line>" 'evil-next-visual-line)
  (mmap "<remap> <evil-previous-line>" 'evil-previous-visual-line)

  ;; (find-function-on-key (kbd "M-."))

  ;; Make horizontal movement cross lines
  (setq-default evil-cross-lines t)

  ;; Evil packages
  (use-package evil-nerd-commenter
    :ensure t
    :config
    ;; Emacs key bindings
    (global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines))

  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key
      "<SPC>" 'helm-M-x
      "f" 'helm-find-files
      "b" 'helm-mini
      "g" 'magit-status
      "s" 'helm-swoop
      "ci" 'evilnc-commenct-or-uncomment-lines
      "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
      "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
      "cc" 'evilnc-copy-and-comment-lines
      "cp" 'evilnc-comment-or-uncomment-paragraphs
      "cr" 'comment-or-uncomment-region
      "cv" 'evilnc-toggle-invert-comment-line-by-line
      "."  'evilnc-copy-and-comment-operator
      "\\" 'evilnc-comment-operator
      ))

  (use-package key-chord
    :ensure t
    :config
    (key-chord-mode 1)
    (setq key-chord-one-key-delay 0.5) ; default 0.2
    (setq key-chord-two-keys-delay 0.2) ; default 0.2
    (key-chord-define evil-normal-state-map "//"
                      #'evilnc-comment-or-uncomment-lines)
    (key-chord-define evil-insert-state-map "jk"
                      #'evil-normal-state))

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
    (evil-ex-define-cmd "ie[dit]" 'evil-multiedit-ex-match))

  (use-package evil-numbers
    :ensure t
    :defer t
    :config
    (nmap "C-a" 'evil-numbers/inc-at-pt)
    (nmap "C-z" 'evil-numbers/dec-at-pt))

  (use-package ranger
    :ensure t
    :defer t
    :config
    (ranger-override-dired-mode t))

  (defun my-jump-to-tag ()
    (interactive)
    (evil-emacs-state)
    (call-interactively (key-binding (kbd "M-.")))
    (evil-change-to-previous-state (other-buffer))
    (evil-change-to-previous-state (current-buffer)))

  (define-key evil-normal-state-map (kbd "C-]") 'my-jump-to-tag)

  (eval-after-load 'evil-core
    '(evil-set-initial-state 'magit-popup-mode 'emacs))

  ;; (eval-after-load 'evil-core
  ;;   '(evil-set-initial-state 'neotree-mode 'evil))
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)

  (eval-after-load 'evil-core
    '(evil-set-initial-state 'dired-mode 'emacs)))

;; Language specific files
(use-package slime-init)
(use-package irony-init)
(use-package go-init)
(use-package haskell-init)
(use-package scala-init)

(provide 'evil-init)

;;; evil-init.el ends here
