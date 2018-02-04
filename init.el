;;; init.el --- Main load file for emacs
;;; Commentary:
;;; No longer do I keep a ~/.emacs file.

;;; Code:

(require 'package)

(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

(add-to-list 'load-path "elisp/")
(add-to-list 'load-path "lisp/")

(eval-when-compile
  (require 'use-package))

;; (load-file "$HOME/.emacs.d/holy.el")
(load-file "$HOME/.emacs.d/evil.el")

;; (load-file "$HOME/.emacs.d/elisp/smbc.el")

;;(use-package exwm-init)

;; (require 'proof-site "~/.emacs.d/lisp/PG/generic/proof-site")

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-dabbrev-downcase nil)
 '(company-ghc-show-info t)
 '(compilation-error-regexp-alist
   (quote
    (google3-build-log-parser-info google3-build-log-parser-warning google3-build-log-parser-error google-blaze-error google-log-error google-log-warning google-log-info google-log-fatal-message google-forge-python gunit-stack-trace absoft ada aix ant bash borland python-tracebacks-and-caml comma cucumber msft edg-1 edg-2 epc ftnchek iar ibm irix java jikes-file maven jikes-line clang-include gcc-include ruby-Test::Unit gnu lcc makepp mips-1 mips-2 msft omake oracle perl php rxp sparc-pascal-file sparc-pascal-line sparc-pascal-example sun sun-ada watcom 4bsd gcov-file gcov-header gcov-nomark gcov-called-line gcov-never-called perl--Pod::Checker perl--Test perl--Test2 perl--Test::Harness weblint guile-file guile-line)))
 '(evil-overriding-maps
   (quote
    ((go-mode)
     (Buffer-menu-mode-map)
     (color-theme-mode-map)
     (comint-mode-map)
     (compilation-mode-map)
     (grep-mode-map)
     (dictionary-mode-map)
     (ert-results-mode-map . motion)
     (Info-mode-map . motion)
     (speedbar-key-map)
     (speedbar-file-key-map)
     (speedbar-buffers-key-map))))
 '(gofmt-command "goimports")
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote stack-ghci))
 '(haskell-tags-on-save t)
 '(merlin-locate-in-new-window (quote never))
 '(package-selected-packages
   (quote
    (all-the-icons-dired dired-sidebar scala-mode buffer-stack neotree ranger go-eldoc pug-mode helm-css-scss scss-mode php-mode web-mode clang-format company-irony-c-headers flycheck-irony elisp-slime-nav evil-numbers evil-snipe evil-multiedit evil-matchit evil-surround key-chord evil-leader evil-nerd-commenter evil smartparens diff-hl magit goto-chg company-tern slime-company company-quickhelp company-restclient company-math company-irony company-go company-ghci company-ghc company-c-headers company-cabal company-auctex company helm-ls-git helm-ag helm-make helm-swoop helm-projectile helm flycheck erc-hl-nicks aggressive-indent undo-tree bison-mode pdf-tools multiple-cursors exec-path-from-shell js2-mode multi-term change-inner dtrt-indent switch-window eyebrowse nlinum-relative auctex rainbow-delimiters unicode-fonts markdown-mode on-screen ethan-wspace jbeans-theme use-package color-theme-sanityinc-tomorrow)))
 '(term-unbind-key-list (quote ("C-z" "C-x" "C-c" "C-h" "C-y" "<ESC>" (\, "M-o")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
