;;; mode-line.el -- For spaceline and powerline
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package spaceline
  :ensure t
  :config
  (use-package spaceline-config
    :config
    (setq powerline-default-separator 'wave)
    (spaceline-define-segment line-column
      "The current line and column numbers."
      "l:%l c:%2c")

    (spaceline-helm-mode)
    (spaceline-toggle-battery-on)
    (spaceline-toggle-minor-modes-on)
    (spaceline-toggle-flycheck-info-on)
    (spaceline-toggle-buffer-encoding-off)
    (spaceline-toggle-buffer-encoding-abbrev-off)
    (spaceline-toggle-buffer-size-off)

    (spaceline-define-segment time
      "The current time."
      (format-time-string "%H:%M"))
    (spaceline-define-segment date
      "The current date."
      (format-time-string "%h %d"))
    (spaceline-toggle-time-on)
    (spaceline-emacs-theme 'date 'time)))
  
(provide 'mode-line)
;;; mode-line.el ends here
