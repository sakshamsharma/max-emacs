;;; use-package-conf.el --- Package management at its best
;;; Commentary:

;;; Code:

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; Set up use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'bind-key)                ;; if you use any :bind variant

(setq inhibit-default-init t)

(provide 'use-package-conf)
;;; use-package-conf.el ends here

