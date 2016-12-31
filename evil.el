;;; evil.el --- Load configs for evil config
;;; Commentary:

;;; Code:
(defvar mode-evil 1)
(defun keymapper (key func)
  "Bind KEY to FUNC."
  (local-set-key (kbd key) func)
  ;; (define-key evil-normal-state-map (kbd key) func)
  ;; (define-key evil-insert-state-map (kbd key) func)
  ;; (define-key evil-visual-state-map (kbd key) func)
  )

(use-package evil-init        :load-path "elisp/")

(require 'cl-lib)
(cl-loop for (mode . state) in '((text-mode . normal)
                                 (exwm-mode . emacs)
                                 (sauron-mode . emacs)
                                 (prog-mode . normal)
                                 (comint-mode . normal)
                                 (shell-mode . insert)
                                 (git-commit-mode . insert)
                                 (git-rebase-mode . emacs)
                                 (grep-mode . emacs)
                                 (bc-menu-mode . emacs)
                                 (magit-branch-manager-mode . emacs)
                                 (rdictcc-buffer-mode . emacs)
                                 (dired-mode . emacs)
                                 (wdired-mode . normal))
         do (evil-set-initial-state mode state))

(provide 'evil)
;;; evil.el ends here
