;;; tex-init.el -- TeX
;;; Commentary:
;; Custom settings for LaTeX in EMACS

;;; Code:

(require 'use-package)

;; AucTeX settings

(use-package tex
  :ensure auctex
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-view-program-list '(("Zathura" "zathura %o")))
  (setq-default TeX-view-program-selection '((output-pdf "Zathura")))
  (setq-default TeX-master nil)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (visual-line-mode)
              (auto-fill-mode)
              (flyspell-mode)
              (LaTeX-math-mode)
              (turn-on-reftex)
              (setq reftex-plug-into-AUCTeX t)
              (setq TeX-PDF-mode t)
              (push
               '("onepage" "pdflatex \'\\def\\onep{1} \\input{dual.tex}\'" TeX-run-TeX nil t
                 :help "Run pdflatex with onepage on file")
               TeX-command-list)
               (push
                '("twopage" "pdflatex \'\\def\\twop{1} \\input{dual.tex}\'" TeX-run-TeX nil t
                  :help "Run pdflatex with twopage on file")
                TeX-command-list)
              ))
  :bind (("C-<tab>" . TeX-complete-symbol)))

(provide 'tex-init)
;;; tex-init.el ends here
