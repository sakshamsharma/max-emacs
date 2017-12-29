;;; scala-init.el -- scala with ensime
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package ensime
  :ensure t
  :pin melpa-stable
  :config
  ;; For complex scala files
  (setq max-lisp-eval-depth 500000)
  (setq max-specpdl-size 100000)

  (add-hook 'scala-mode-hook
            (lambda ()
              (ensime-scala-mode-hook)
              (make-local-variable 'company-backends)
              (projectile-visit-project-tags-table)
              (ensime-company-enable)
              (setq prettify-symbols-alist scala-prettify-symbols-alist)
              (prettify-symbols-mode)))

  :bind (:map scala-mode-map (("C-c C-v C-e" . ensime-print-errors-at-point)
                              ("C-c C-v C-t" . ensime-print-type-at-point)
                              ("C-c C-e" . ensime-print-errors-at-point)
                              ("C-c C-t" . ensime-print-type-at-point)
                              ("M-." . ensime-edit-definition)
                              ("M-," . ensime-pop-find-definition-stack))))

(use-package scala-mode
  :ensure t
  :pin melpa-stable
  :interpreter
  ("scala" . scala-mode))

(use-package sbt-mode
  :ensure t
  :pin melpa-stable
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(defun scala-mode-newline-comments ()
  "Custom newline appropriate for `scala-mode'."
  ;; shouldn't this be in a post-insert hook?
  (interactive)
  (newline-and-indent)
  (scala-indent:insert-asterisk-on-multiline-comment))

(provide 'scala-init)
;;; scala-init.el ends here
