;;; erc-init.el -- erc config
;;; Commentary:

;;; Code:

(require 'use-package)
(require 'erc)

(use-package erc-hl-nicks
  :ensure t)

(erc-autojoin-mode t)
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

(setq erc-log-channels-directory "~/.erclogs/"
      erc-save-buffer-on-part t
      erc-save-queries-on-quit t
      erc-log-write-after-send t
      erc-log-write-after-insert t)

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

(setq erc-button-url-regexp
      "\\([-a-zA-Z0-9_=!?#$@~`%&*+\\/:;,]+\\.\\)+[-a-zA-Z0-9_=!?#$@~`%&*+\\/:;,]*[-a-zA-Z0-9\\/]")

(require 'notify)
(defun ysph-erc-privmsg-notify (proc res)
  (cl-flet ((rtrim-string (s) (replace-regexp-in-string "\\([[:space:]\n]*$\\)" "" s)))
    (let ((channel-buffers     (erc-channel-list proc))
          (sender              (or (car (split-string (erc-response.sender res) "!"))
                                   (erc-response.sender res)))
          (target-channel-name (car (erc-response.command-args res)))
          (xwindow-class       (rtrim-string (shell-command-to-string "stumpish current-window-class"))))
      (unless (or (string= xwindow-class "Emacs") ; we are in an emacs frame
                  (member (get-buffer target-channel-name) channel-buffers)) ; this is a channel message
        (progn (notify "Instant message!"
                       (format "Direct message from %s" sender)
                       :timeout  120000
                       :app "ERC")
               nil        ; we never want this to interrupt processing
               )))))
(add-hook 'erc-server-PRIVMSG-functions 'ysph-erc-privmsg-notify)

(defface erc-header-line-disconnected
  '((t (:foreground "black" :background "indianred")))
  "Face to use when ERC has been disconnected.")

(defun erc-update-header-line-show-disconnected ()
  "Use a different face in the header-line when disconnected."
  (erc-with-server-buffer
    (cond ((erc-server-process-alive) 'erc-header-line)
          (t 'erc-header-line-disconnected))))

(setq erc-header-line-face-method 'erc-update-header-line-show-disconnected)

(require 'erc-image)
(add-to-list 'erc-modules 'image)
(erc-update-modules)

(require 'znc)

(provide 'erc-init)
;;; erc-init.el ends here
