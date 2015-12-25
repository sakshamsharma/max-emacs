;;; installed-settings.el --- settings for packages I have installed
;;; Commentary:
;;; Refer to package-management.el for list of installed packages

;;; Code:

(require 'magit)
(define-key global-map (kbd "C-c m") 'magit-status)

(require 'markdown-mode)

(require 'unicode-fonts)
(unicode-fonts-setup)

(require 'tabbar)
(tabbar-mode 1)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20151112.2030/dict/")
(ac-config-default)

(add-to-list 'load-path "which-folder-ace-jump-mode-file-in/")
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(require 'multi-term)
(setq multi-term-program "/bin/zsh")
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)))
(add-hook 'term-mode-hook
          (lambda ()
            (define-key term-raw-map (kbd "C-y") 'term-paste)))

;; dart mode
(require 'flycheck)
(require 'dart-mode)
(setq dart-executable-path "/opt/dart-sdk/bin/dart")
(setq dart-analysis-server-snapshot-path "/opt/dart-sdk/bin/snapshots/analysis_server.dart.snapshot")
(setq dart-debug t)
(setq dart-enable-analysis-server t)
(add-to-list 'auto-mode-alist '("\\.dart\\'" . dart-mode))
(add-hook 'dart-mode-hook 'dart-file-handle)
(add-hook 'dart-mode-hook 'flycheck-mode)(setq dart-enable-analysis-server t)
(add-hook 'dart-mode-hook 'flycheck-mode)

;; js2-mode
;; Requires jshint for flychecking
(require 'js2-mode)
(flycheck-mode t)
(setq js-indent-level 2)
(add-hook 'js2-mode-hook 'flycheck-mode)

;; Org mode shortcuts
;; The following lines are always needed. Choose your own keys.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(provide 'installed-settings.el)
;;; installed-settings.el ends here
