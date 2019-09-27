;;; mode-line.el --- Mode-Line settings
;;; Commentary:
;;; Contains settings related to mode-line

;;; Code:

(defvar my-mode-line-format
              (list mode-line-front-space
                    mode-line-client
                    mode-line-modified
                    mode-line-remote
                    mode-line-frame-identification
                    mode-line-buffer-identification
                    "  "
                    mode-line-position
                    vc-mode
                    ;; mode-line-misc-info
                    mode-line-modes
                    " [["
                    '(:eval (propertize server-name
                                        'face '(:foreground "dodger blue"
                                                            :height 0.9
                                                            :weight normal)))
                    "]] "
                    mode-line-end-spaces))

;; (setq-default mode-line-format 'my-mode-line-format)
;; (setq auto-revert-check-vc-info t)

(use-package doom-modeline
  :ensure t
  :config
  (doom-modeline-def-modeline 'my-doom-modeline
    '(bar workspace-name window-number modals matches buffer-info checker remote-host buffer-position selection-info)
    '(objed-state misc-info persp-name fancy-battery debug lsp minor-modes process vcs))
  (defun setup-custom-doom-modeline ()
    (doom-modeline-set-modeline 'my-doom-modeline 'default))
  (add-hook 'doom-modeline-mode-hook 'setup-custom-doom-modeline)
  (doom-modeline-mode 1)
  (setq doom-modeline-icon t)
  (setq doom-modeline-lsp t)
  ;; Don't compact font caches during GC. Fixes lags.
  (setq inhibit-compacting-font-caches t))

(provide 'mode-line)
;;; mode-line.el ends here
