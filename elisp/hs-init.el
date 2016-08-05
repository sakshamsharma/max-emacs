;;; hs-init.el -- haskell
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package haskell-mode
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'company-mode)
  (setq haskell-process-type 'stack-ghci)
  (setq haskell-process-path-ghci "stack ghci")
  (setq haskell-process-args-stack-ghci '())

  ;; Jump to imports with F8
  (eval-after-load 'haskell-mode
    '(define-key haskell-mode-map [f8] 'haskell-navigate-imports))
  (eval-after-load
      'haskell-mode '(progn
                       (define-key haskell-mode-map (kbd "C-c C-l")
                         'haskell-process-load-or-reload)
                       (define-key haskell-mode-map (kbd "C-c C-z")
                         'haskell-interactive-switch)
                       (define-key haskell-mode-map (kbd "C-c C-n C-t")
                         'haskell-process-do-type)
                       (define-key haskell-mode-map (kbd "C-c C-n C-i")
                         'haskell-process-do-info)
                       (define-key haskell-mode-map (kbd "C-c C-n C-c")
                         'haskell-process-cabal-build)
                       (define-key haskell-mode-map (kbd "C-c C-n c")
                         'haskell-process-cabal)))
  (eval-after-load
      'haskell-cabal '(progn
                        (define-key haskell-cabal-mode-map (kbd "C-c C-z")
                          'haskell-interactive-switch)
                        (define-key haskell-cabal-mode-map (kbd "C-c C-k")
                          'haskell-interactive-mode-clear)
                        (define-key haskell-cabal-mode-map (kbd "C-c C-c")
                          'haskell-process-cabal-build)
                        (define-key haskell-cabal-mode-map (kbd "C-c c")
                          'haskell-process-cabal))))

(use-package ghc
  :config
  (autoload 'ghc-init "stack ghc" nil t)
  (autoload 'ghc-debug "stack ghc" nil t)
  (add-hook 'haskell-mode-hook (lambda () (ghc-init)))
  (add-to-list 'company-backends 'company-ghc)
  (custom-set-variables '(company-ghc-show-info t))

  :bind (("M-s" . helm-mini)))

;; Jump to definition with M-.
(custom-set-variables
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-tags-on-save t)
 '(haskell-process-type 'stack-ghci))

(let ((my-stack-path (expand-file-name "~/.local/bin")))
  (setenv "PATH" (concat my-stack-path path-separator (getenv "PATH")))
  (add-to-list 'exec-path my-stack-path))

;; To let emacs know how to align haskell comments
(eval-after-load "align"
  '(add-to-list 'align-rules-list
                '(haskell-types
                  (regexp . "\\(\\s-+\\)\\(::\\|∷\\)\\s-+")
                  (modes quote (haskell-mode literate-haskell-mode)))))
(eval-after-load "align"
  '(add-to-list 'align-rules-list
                '(haskell-assignment
                  (regexp . "\\(\\s-+\\)=\\s-+")
                  (modes quote (haskell-mode literate-haskell-mode)))))
(eval-after-load "align"
  '(add-to-list 'align-rules-list
                '(haskell-arrows
                  (regexp . "\\(\\s-+\\)\\(->\\|→\\)\\s-+")
                  (modes quote (haskell-mode literate-haskell-mode)))))
(eval-after-load "align"
  '(add-to-list 'align-rules-list
                '(haskell-left-arrows
                  (regexp . "\\(\\s-+\\)\\(<-\\|←\\)\\s-+")
                  (modes quote (haskell-mode literate-haskell-mode)))))

(provide 'hs-init)
;;; hs-init.el ends here
