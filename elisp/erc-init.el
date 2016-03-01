;;; erc-init.el -- erc config
;;; Commentary:

;;; Code:

(require 'use-package)
(require 'erc)

(use-package erc-hl-nicks
  :ensure t)

(erc-autojoin-mode t)
(setq erc-autojoin-channels-alist
      '((".*\\.freenode.net" "#gentoo-soc" "#navya")))
(erc-notify-mode 1)
(erc-spelling-mode 1)

;; check channels
(erc-track-mode t)
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"

                                "324" "329" "332" "333" "353" "477"))
;; don't show any of this
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

(defun erc-start-or-switch ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
  (if (get-buffer "irc.freenode.net:6667") ;; ERC already active?
      (erc-track-switch-buffer 1) ;; yes: switch to last active
    (when (y-or-n-p "Start ERC? ") ;; no: maybe start ERC
      (erc :server "irc.freenode.net" :port 6667 :nick "saksham" :full-name "Saksham Sharma"))))

;; switch to ERC with Ctrl+c e
(global-set-key (kbd "C-c C-e") 'djcb-erc-start-or-switch) ;; ERC

(define-minor-mode ncm-mode "" nil
  (:eval
   (let ((ops 0)
         (voices 0)
         (members 0))
     (maphash (lambda (key value)
                (when (erc-channel-user-op-p key)
                  (setq ops (1+ ops)))
                (when (erc-channel-user-voice-p key)
                  (setq voices (1+ voices)))
                (setq members (1+ members)))
              erc-channel-users)
     (format " %S/%S/%S" ops voices members))))

(defface erc-header-line-disconnected
  '((t (:foreground "black" :background "indianred")))
  "Face to use when ERC has been disconnected.")

(defun erc-update-header-line-show-disconnected ()
  "Use a different face in the header-line when disconnected."
  (erc-with-server-buffer
    (cond ((erc-server-process-alive) 'erc-header-line)
          (t 'erc-header-line-disconnected))))

(setq erc-header-line-face-method 'erc-update-header-line-show-disconnected)

(provide 'erc-init)
;;; erc-init.el ends here
