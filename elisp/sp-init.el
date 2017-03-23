;; sp-init.el -- smartparens
;;; Commentary: Thanks again to vikraman :)

;;; Code:

(require 'use-package)

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (require 'smartparens-config)
  (smartparens-global-mode t)
  (show-smartparens-global-mode t)
  (require 'smartparens-haskell)

  ;; keybindings

  (define-key smartparens-mode-map (kbd "C-M-f") 'sp-forward-sexp)
  (define-key smartparens-mode-map (kbd "C-M-b") 'sp-backward-sexp)

  (define-key smartparens-mode-map (kbd "C-M-d") 'sp-down-sexp)
  (define-key smartparens-mode-map (kbd "C-M-a") 'sp-backward-down-sexp)
  (define-key smartparens-mode-map (kbd "C-S-a") 'sp-beginning-of-sexp)
  (define-key smartparens-mode-map (kbd "C-S-d") 'sp-end-of-sexp)

  (define-key smartparens-mode-map (kbd "C-M-e") 'sp-up-sexp)
  (define-key smartparens-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)
  (define-key smartparens-mode-map (kbd "C-M-t") 'sp-transpose-sexp)

  (define-key smartparens-mode-map (kbd "C-M-n") 'sp-next-sexp)
  (define-key smartparens-mode-map (kbd "C-M-p") 'sp-previous-sexp)

  (define-key smartparens-mode-map (kbd "C-M-k") 'sp-kill-sexp)
  (define-key smartparens-mode-map (kbd "C-M-w") 'sp-copy-sexp)

  (define-key smartparens-mode-map (kbd "M-<delete>") 'sp-unwrap-sexp)
  (define-key smartparens-mode-map (kbd "M-<backspace>") 'sp-backward-unwrap-sexp)

  (define-key smartparens-mode-map (kbd "C-<right>") 'sp-forward-slurp-sexp)
  (define-key smartparens-mode-map (kbd "C-<left>") 'sp-forward-barf-sexp)
  (define-key smartparens-mode-map (kbd "C-M-<left>") 'sp-backward-slurp-sexp)
  (define-key smartparens-mode-map (kbd "C-M-<right>") 'sp-backward-barf-sexp)

  (define-key smartparens-mode-map (kbd "M-D") 'sp-splice-sexp)
  (define-key smartparens-mode-map (kbd "C-M-<delete>") 'sp-splice-sexp-killing-forward)
  (define-key smartparens-mode-map (kbd "C-M-<backspace>") 'sp-splice-sexp-killing-backward)
  (define-key smartparens-mode-map (kbd "C-S-<backspace>") 'sp-splice-sexp-killing-around)

  (define-key smartparens-mode-map (kbd "C-]") 'sp-select-next-thing-exchange)
  (define-key smartparens-mode-map (kbd "C-<left_bracket>") 'sp-select-previous-thing)
  (define-key smartparens-mode-map (kbd "C-M-]") 'sp-select-next-thing)

  (define-key smartparens-mode-map (kbd "M-F") 'sp-forward-symbol)
  (define-key smartparens-mode-map (kbd "M-B") 'sp-backward-symbol)

  (define-key smartparens-mode-map (kbd "H-t") 'sp-prefix-tag-object)
  (define-key smartparens-mode-map (kbd "H-p") 'sp-prefix-pair-object)
  (define-key smartparens-mode-map (kbd "H-s c") 'sp-convolute-sexp)
  (define-key smartparens-mode-map (kbd "H-s a") 'sp-absorb-sexp)
  (define-key smartparens-mode-map (kbd "H-s e") 'sp-emit-sexp)
  (define-key smartparens-mode-map (kbd "H-s p") 'sp-add-to-previous-sexp)
  (define-key smartparens-mode-map (kbd "H-s n") 'sp-add-to-next-sexp)
  (define-key smartparens-mode-map (kbd "H-s j") 'sp-join-sexp)
  (define-key smartparens-mode-map (kbd "H-s s") 'sp-split-sexp)

  ;; pair management
  ;; (sp-pair "'" nil :actions :rem)
  ;; (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)

  ;; haskell and agda pragmas
  ;; (sp-with-modes '(haskell-mode agda2-mode)
  ;;   (sp-local-pair "{-#" "#-}"))

  (sp-local-pair 'c++-mode "{" nil :post-handlers '((my-create-newline-and-enter-sexp "RET")))

  (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)
  (bind-key "C-(" 'sp---wrap-with-40 minibuffer-local-map)

  (defun my-create-newline-and-enter-sexp (&rest _ignored)
    "Open a new brace or bracket expression, with relevant newlines and indent. "
    (newline)
    (indent-according-to-mode)
    (forward-line -1)
    (indent-according-to-mode))

  ;; markdown-mode
  (sp-with-modes '(markdown-mode gfm-mode rst-mode)
    (sp-local-pair "*" "*"
                   :wrap "C-*"
                   :unless '(sp--gfm-point-after-word-p sp-point-at-bol-p)
                   :post-handlers '(("[d1]" "SPC"))
                   :skip-match 'sp--gfm-skip-asterisk)
    (sp-local-pair "**" "**"))

  ;; tex-mode latex-mode
  (sp-with-modes '(tex-mode plain-tex-mode latex-mode)
    (sp-local-tag "i" "\"<" "\">"))


  (defun sp--gfm-point-after-word-p (id action context)
    "Return t if point is after a word, nil otherwise.
This predicate is only tested on \"insert\" action."
    (when (eq action 'insert)
      (sp--looking-back-p (concat "\\(\\sw\\)" (regexp-quote id)))))

  (defun sp--gfm-skip-asterisk (ms mb me)
    (save-excursion
      (goto-char mb)
      (save-match-data (looking-at "^\\* "))))

  ;; html-mode
  (sp-with-modes '(html-mode sgml-mode)
    (sp-local-pair "<" ">"))
  (sp-local-tag '(sgml-mode html-mode) "<" "<_>" "</_>"
                :transform 'sp-match-sgml-tags)

  ;; racket-mode
  ;; (sp-with-modes '(racket-mode)
  ;;   (sp-local-pair "#|" "|#")
  ;;   (sp-local-pair "`" nil :actions nil))

  ;; lisp modes
  (sp-with-modes sp--lisp-modes
    (sp-local-pair "(" nil :bind "C-(")))

(provide 'sp-init)
;;; sp-init.el ends here
