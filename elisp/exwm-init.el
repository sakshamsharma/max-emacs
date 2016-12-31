;;; exwm-init.el -- My window manager
;;; Commentary:

;;; Code:

(require 'use-package)

(defun launch (command)
  "Run the command COMMAND as async."
  (interactive)
  (start-file-process-shell-command command nil command))

(defun pair-launch (bind)
  "Map keybinding from BIND to its command."
  (exwm-input-set-key (kbd (car bind))
                      (lambda ()
                        (launch (cdr (funcall bind))))))


(defun exwm-x--next-exwm-buffer ()
  "Switch to next exwm buffer."
  (let ((buffer
         (car (cl-remove-if-not
               #'(lambda (buf)
                   (with-current-buffer buf
                     (eq major-mode 'exwm-mode)))
               (buffer-list)))))
    (when buffer
      (exwm-workspace-switch-to-buffer buffer))))

(defun kill-exwm-buffer (&optional buffer-or-name)
  "Kill BUFFER-OR-NAME, if current buffer is a exwm buffer."
  (interactive)
  (let ((buffer (or buffer-or-name
                    (current-buffer))))
    (with-current-buffer buffer
      (if (eq major-mode 'exwm-mode)
          (progn (kill-buffer buffer))
        (message "This buffer is not a exwm buffer!")))))

(use-package xelb
  :ensure t
  :config
  (use-package exwm
    :ensure t
    :config
    (use-package cl-generic
      :ensure t)
    (require 'exwm-config)
    (exwm-config-default)
    (setq exwm-workspace-number 9)

    (exwm-input-set-key (kbd "s-<return>")
                        (lambda () (interactive)
                          (launch "urxvt")))

    (exwm-input-set-key (kbd "<XF86AudioLowerVolume>")
                        (lambda () (interactive)
                          (launch "amixer --card 1 -q set PCM 5%-")))

    (exwm-input-set-key (kbd "M-3")
                        (lambda () (interactive)
                          (launch "amixer --card 1 -q set PCM 5%-")))

    (exwm-input-set-key (kbd "<XF86AudioRaiseVolume>")
                        (lambda () (interactive)
                          (launch "amixer --card 1 -q set PCM 5%+")))

    (exwm-input-set-key (kbd "M-4")
                        (lambda () (interactive)
                          (launch "amixer --card 1 -q set PCM 5%+")))

    (exwm-input-set-key (kbd "<XF86MonBrightnessDown>")
                        (lambda () (interactive)
                          (launch "xbacklight -steps 1 -time 1 -dec 6")))

    (exwm-input-set-key (kbd "<XF86MonBrightnessUp>")
                        (lambda () (interactive)
                          (launch "xbacklight -steps 1 -time 1 -inc 8")))

    (exwm-input-set-key (kbd "<print>")
                        (lambda () (interactive)
                          (launch "gnome-screenshot")))

    (exwm-input-set-key (kbd "<s-print>")
                        (lambda () (interactive)
                          (launch "name=$HOME/\"Screen-\"`date`.png && import $name")))

    (exwm-input-set-key (kbd "s-l")
                        (lambda () (interactive)
                          (launch "xscreensaver-command -lock")))

    (exwm-input-set-key (kbd "M-o")
                        (lambda () (interactive)
                          (switch-window)))

    (exwm-input-set-key (kbd "<s-f1>")
                        (lambda () (interactive)
                          (launch "google-chrome-beta")))

    (exwm-input-set-key (kbd "<s-f3>")
                        (lambda () (interactive)
                          (launch "pcmanfm")))

    (exwm-input-set-key (kbd "s-s") 'exwm-input-release-keyboard)
    (exwm-input-set-key (kbd "s-q") 'kill-exwm-buffer)
    (exwm-input-set-key (kbd "C-x m") 'exwm-workspace-move-window)

    (setenv "SHELL" "/bin/zsh")

    ;; (require 'exwm-cm)
    ;; Make all Emacs frames opaque.
    ;; (setq window-system-default-frame-alist '((x . ((alpha . 100)))))
    ;; Assign everything else a 80% opacity.
    ;; (setq exwm-cm-opacity 100)
    ;; (exwm-cm-enable)

    (add-hook 'exwm-manage-finish-hook
              (lambda ()
                (when (and exwm-class-name
                           (string= exwm-class-name "URxvt"))
                  (setq-local exwm-input-prefix-keys '(?\C-x ?\C-a)))
                (when (and exwm-class-name
                           (string= exwm-class-name "Google-chrome-beta"))
                  (setq-local exwm-input-prefix-keys '(?\C-x ?\C-a)))))

    (display-battery-mode 1)
    ))

(provide 'exwm-init)
;;; exwm-init.el ends here
