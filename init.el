;;; init.el --- Main load file for emacs
;;; Commentary:
;;; No longer do I keep a ~/.emacs file.

;;; Code:

(require 'package)

(setq gc-cons-threshold 100000000)

(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/")
                    ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(add-to-list 'load-path "elisp/")
(add-to-list 'load-path "lisp/")

(eval-when-compile
  (require 'use-package))

;; (load-file "$HOME/.emacs.d/holy.el")
;; (load-file "$HOME/.emacs.d/evil.el")
(use-package evil-init
  :load-path "elisp/")

;;(use-package exwm-init)

(setq gc-cons-threshold 8000000)

;; Welcome message
(setq initial-major-mode 'lisp-interaction-mode)
(setq initial-scratch-message "\
;;   ___               _____
;;  / _ \\             |  ___|
;; / /_\\ \\  ___   ___ | |__   _ __ ___    __ _   ___  ___
;; |  _  | / __| / _ \\|  __| | '_ ` _ \\  / _` | / __|/ __|
;; | | | || (__ |  __/| |___ | | | | | || (_| || (__ \\__ \\
;; \\_| |_/ \\___| \\___|\\____/ |_| |_| |_| \\__,_| \\___||___/

")

(provide 'init)
;;; init.el ends here
