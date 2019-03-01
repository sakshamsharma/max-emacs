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
  (setq flycheck-gcc-language-standard "c++14")
  (setq flycheck-clang-language-standard "c++14")
  (c-set-offset 'inlambda 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(use-package lsp-mode
  :ensure t
  :commands lsp)
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package cquery
  :ensure t
  :defer t
  :config
  (use-package company-lsp
    :ensure t
    :config
    (push 'company-lsp company-backends))
  (use-package helm-lsp
    :load-path "./")
  (use-package helm-xref
    :ensure t
    :config
    (setq xref-show-xrefs-function 'helm-xref-show-xrefs))

  (with-eval-after-load 'projectile
    (setq projectile-project-root-files-top-down-recurring
          (append '("compile_commands.json"
                    ".cquery")
                  projectile-project-root-files-top-down-recurring)))

  (setq cquery-executable "/spare/local/saksham/m2/envs/clang40/bin/cquery")
  (setq cquery-extra-init-params '(:index (:comments 2) :cacheFormat "msgpack"))
  (setq cquery-extra-args '("--log-file=/tmp/cq.log"))
  (setq cquery-cache-dir "/spare/local/saksham/.cquery_cached_index"))

(defun cquery//enable ()
  (interactive)
  (require 'cquery)
  (add-hook 'c++-mode-hook #'lsp))

(defun ccls//enable ()
  (interactive)
  (require 'ccls)
  (add-hook 'c++-mode-hook #'lsp))

(use-package ccls
  :ensure t
  :defer t
  :config
  (setq ccls-executable "/spare/local/saksham/.conda/envs/clang60/bin/ccls")
  (setq ccls-args '("--init={\"cacheDirectory\":\"/spare/tmp/saksham/ccls\", \
                            \"index\": {\"threads\": 4}, \
                            \"clang\": {\"resourceDir\": \"/spare/local/saksham/.conda/envs/clang60/lib/clang/6.0.1/\"}, \
                            \"completion\": {\"filterAndSort\": true}}"))
  (use-package company-lsp
    :ensure t
    :config
    (push 'company-lsp company-backends))
  (use-package helm-lsp
    :load-path "./")
  (use-package helm-xref
    :ensure t
    :config
    (setq xref-show-xrefs-function 'helm-xref-show-xrefs)))


(provide 'cpp-init)
;;; cpp-init.el ends here
