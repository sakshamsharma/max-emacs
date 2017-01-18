;;; holy.el --- Load configs for holy config
;;; Commentary:

;;; Code:
(defvar mode-evil 0)
(defun keymapper (key func)
  "Bind KEY to FUNC."
  (local-set-key (kbd key) func))

(use-package holy-init :load-path "elisp/")

(provide 'holy)
;;; holy.el ends here
