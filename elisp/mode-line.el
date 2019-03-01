;;; mode-line.el --- Mode-Line settings
;;; Commentary:
;;; Contains settings related to mode-line

;;; Code:

(setq-default mode-line-format
              (list mode-line-front-space
                    mode-line-client
                    mode-line-modified
                    mode-line-remote
                    mode-line-frame-identification
                    mode-line-buffer-identification
                    "  "
                    mode-line-position
                    vc-mode
                    mode-line-misc-info
                    mode-line-modes
                    " [["
                    '(:eval (propertize server-name
                                        'face '(:foreground "dodger blue"
                                                            :height 0.9
                                                            :weight normal)))
                    "]] "
                    mode-line-end-spaces))

(setq auto-revert-check-vc-info t)

(provide 'mode-line)
;;; mode-line.el ends here
