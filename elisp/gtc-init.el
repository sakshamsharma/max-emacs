;;; gtc-init.el -- go to change-class
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package goto-chg
  :ensure t
  :commands goto-last-change
  ;; complementary to
  ;; C-x r m / C-x r l
  ;; and C-<space> C-<space> / C-u C-<space>
  :bind (("C-." . goto-last-change)
         ("C-," . goto-last-change-reverse)))

(use-package popup-imenu
  :commands popup-imenu
  :bind ("M-i" . popup-imenu))

(provide 'gtc-init)
;;; gtc-init.el ends here
