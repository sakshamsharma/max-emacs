;;; cc-init.el -- haskell
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package cc-mode
  :ensure t
  :config

  (use-package semantic
    :ensure t)
  (use-package stickyfunc-enhance
    :ensure t)

  (c-add-style "my-style"
               '("linux"
                 (indent-tabs-mode . nil)        ; use spaces rather than tabs
                 (c-basic-offset . 4)            ; indent by four spaces
                 (c-offsets-alist . ((inline-open . 0)  ; custom indentation rules
                                     (brace-list-open . 0)
                                     (statement-case-open . +)))))

  (global-set-key (kbd "<f5>") (lambda ()
                                 (interactive)
                                 (setq-local compilation-read-command nil)
                                 (call-interactively 'compile)))

  (setq c-toggle-auto-newline -1)

  ;; Debugging
  (setq
   ;; use gdb-many-windows by default
   gdb-many-windows t

   ;; Non-nil means display source file containing the main routine at startup
   gdb-show-main t)

  (defun my-c++-mode-hook ()
    (c-set-style "my-style")
    (auto-fill-mode)
    (c-toggle-auto-hungry-state 1)
    (c-toggle-auto-newline -1)
    (c-set-offset 'arglist-intro '+)    ; Break long declarations into newlines
    (c-set-offset 'inline-open '+)
    (c-set-offset 'block-open '+)
    (c-set-offset 'brace-list-open '+)  ; all "opens" indented by the c-indent-level
    (c-set-offset 'case-label '+)       ; indent case labels by c-indent-level, too

    ;; Completions
    ;; Use this in your project root for local completions (.dir-locals.el)
    ;; ((nil . ((company-clang-arguments . ("-I/home/<user>/project_root/include1/"
    ;; "-I/home/<user>/project_root/include2/")))))
    (global-company-mode)
    ;; (setq company-backends (delete 'company-semantic company-backends))
    ;; (add-to-list 'company-backends 'company-c-headers)
    (add-to-list 'company-c-headers-path-system
                 "/usr/lib/gcc/x86_64-pc-linux-gnu/4.9.3/include/g++-v4")
    (define-key c-mode-map  [(tab)] 'company-complete)
    (define-key c++-mode-map  [(tab)] 'company-complete)

    ;; Semantic mode completions
    (global-semanticdb-minor-mode 1)
    (global-semantic-idle-scheduler-mode 1)
    (semantic-add-system-include
     "/usr/lib/gcc/x86_64-pc-linux-gnu/4.9.3/include/g++-v4")
    (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
    (global-semantic-idle-summary-mode 1)
    (semantic-mode 1))

  (add-hook 'c-mode-hook 'my-c++-mode-hook)
  (add-hook 'c++-mode-hook 'my-c++-mode-hook))

(provide 'cc-init)
;;; cc-init.el ends here
