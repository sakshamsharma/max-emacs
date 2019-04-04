;;; cpp-init.el -- C/C++ core config.
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package clang-format
  :ensure t
  :bind (:map c++-mode-map (("C-c i" . clang-format-region)
                            ("C-c u" . clang-format-buffer)))
  :config
  (setq clang-format-style-option "google"))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(use-package ggtags
  :ensure t
  :diminish ggtags-mode)

(defun my-c++-mode-hook()
  "Set c++ vars."
  ;; (ggtags-mode 1)
  (hs-minor-mode)
  (setq flycheck-gcc-language-standard "c++14")
  (setq flycheck-clang-language-standard "c++14")
  (c-set-offset 'inlambda 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(use-package lsp-mode
  :ensure t
  :commands lsp
  :config
  (setq lsp-ui-sideline-enable nil))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-sideline-enable nil))

(use-package cquery
  :ensure t
  :defer t
  :config
  (use-package company-lsp
    :ensure t
    :config
    (push 'company-lsp company-backends))
  (use-package helm-lsp)
  (use-package helm-xref
    :ensure t
    :config
    (setq xref-show-xrefs-function 'helm-xref-show-xrefs))

  (with-eval-after-load 'projectile
    (setq projectile-project-root-files-top-down-recurring
          (append '("compile_commands.json"
                    ".cquery")
                  projectile-project-root-files-top-down-recurring)))

  (setq cquery-extra-init-params '(:index (:comments 2) :cacheFormat "msgpack"))
  (setq cquery-extra-args '("--log-file=/tmp/cq.log"))
  (setq cquery-cache-dir "/spare/local/saksham/.cquery_cached_index"))

(defun cquery//enable ()
  (interactive)
  (require 'cquery)
  (add-hook 'c++-mode-hook #'lsp)
  (setq xref-prompt-for-identifier '(not xref-find-definitions
                                         xref-find-definitions-other-window
                                         xref-find-definitions-other-frame
                                         xref-find-references)))

(defun ccls//enable ()
  (interactive)
  (require 'ccls)
  (add-hook 'c++-mode-hook #'lsp)
  (define-key c++-mode-map (kbd "C-c C-h") '(lambda () (interactive) (ccls-navigate "L")))
  (define-key c++-mode-map (kbd "C-c C-j") '(lambda () (interactive) (ccls-navigate "D")))
  (define-key c++-mode-map (kbd "C-c C-k") '(lambda () (interactive) (ccls-navigate "U")))
  (define-key c++-mode-map (kbd "C-c C-l") '(lambda () (interactive) (ccls-navigate "R")))
  (setq xref-prompt-for-identifier '(not xref-find-definitions
                                         xref-find-definitions-other-window
                                         xref-find-definitions-other-frame
                                         xref-find-references)))

(use-package ccls
  :after projectile
  :config
  (setq ccls-args '("--init={\"cacheDirectory\":\"/spare/tmp/saksham/ccls\", \
                            \"index\": {\"threads\": 4}, \
                            \"clang\": {\"resourceDir\": \"/spare/local/saksham/.conda/envs/clang70/lib/clang/7.0.0/\"}, \
                            \"completion\": {\"filterAndSort\": true}}"))

  (use-package company-lsp
    :ensure t
    :config
    (push 'company-lsp company-backends))
  (use-package helm-lsp)
  (use-package helm-xref
    :ensure t
    :config
    (setq xref-show-xrefs-function 'helm-xref-show-xrefs)))


(provide 'cpp-init)
;;; cpp-init.el ends here
