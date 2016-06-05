;;; scala-init.el -- scala with ensime
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package ensime
  :commands ensime ensime-mode
  :ensure t
  :config
  (add-hook 'scala-mode-hook
            (lambda ()
              (ensime-scala-mode-hook)
              (make-local-variable 'company-backends)
              (projectile-visit-project-tags-table)
              (setq company-backends
                    '(ensime-company
                      (company-keywords
                       company-dabbrev-code
                       company-etags
                       company-yasnippet)))))

  :bind (("C-c C-v C-e" . ensime-print-errors-at-point)
         ("C-c C-v C-t" . ensime-print-type-at-point)
         ("C-c C-e" . ensime-print-errors-at-point)
         ("C-c C-t" . ensime-print-type-at-point))
  )

(use-package sbt-mode
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
