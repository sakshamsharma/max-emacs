;;; installed-settings.el --- settings for packages I have installed
;;; Commentary:
;;; Refer to package-management.el for list of installed packages

;;; Code:

(require 'magit)
(define-key global-map (kbd "C-c m") 'magit-status)

(require 'powerline)
(require 'powerline-separators)
(powerline-default-theme)
;(setq powerline-default-separator wave)

(require 'markdown-mode)

(require 'spaceline-config)
(require 'spaceline-segments)
(require 'spaceline)
;(spaceline-workspace-numbers-unicode 1)
;(spaceline-window-numbers-unicode 1)

(spaceline-spacemacs-theme)
(spaceline-toggle-workspace-number)
(spaceline-toggle-battery-on)
(spaceline-toggle-flycheck-info-on)
(display-battery-mode 1)
(nyan-mode 1)
(anzu-mode 1)
(eyebrowse-mode 1)
(window-numbering-mode 1)

(require 'unicode-fonts)
(unicode-fonts-setup)

;;============================================================
(require 'helm)
(require 'helm-config)
(require 'helm-net)
(require 'helm-files)
(require 'helm-command)
(helm-mode 1)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-net-prefer-curl))

(helm-autoresize-mode t)
(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

; keep a list of recently opened files
(recentf-mode 1)
(setq-default recent-save-file "~/.emacs.d/recentf")

(global-set-key (kbd "C-x C-f") 'helm-find-files)

(global-set-key (kbd "C-x b") 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match    t)

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-file-name-history-use-recentf t ; should show recent files at the top
      helm-scroll-amount                    8); scroll 8 lines other window using M-<next>/M-<prior>

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
;;============================================================

(require 'tabbar)
(tabbar-mode 1)

(require 'yasnippet)

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

;; AucTeX
;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; (setq-default TeX-master nil)
;; (add-hook 'LaTeX-mode-hook 'visual-line-mode)
;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; (setq reftex-plug-into-AUCTeX t)
;; (setq TeX-PDF-mode t)

;; ;; Use Skim as viewer, enable source <-> PDF sync
;; ;; make latexmk available via C-c C-c
;; (add-hook 'LaTeX-mode-hook (lambda ()
;;   (push
;;     '("onepage" "pdflatex \'\\def\\onep{1} \\input{dual.tex}\' " TeX-run-TeX nil t
;;       :help "Run pdflatex with onepage on file")
;;     TeX-command-list)))

;; (add-hook 'LaTeX-mode-hook (lambda ()
;;   (push
;;     '("twopage" "pdflatex \'\\def\\twop{1} \\input{dual.tex}\' " TeX-run-TeX nil t
;;       :help "Run pdflatex with twopage on file")
;;     TeX-command-list)))

;; (add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "onepage")))



(provide 'installed-settings.el)
;;; installed-settings.el ends here
