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
              (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
              (push
               '("onepage" "pdflatex \'\\def\\onep{1} \\input{dual.tex}\'" TeX-run-TeX nil t
                 :help "Run pdflatex with onepage on file")
               TeX-command-list)
              (push
               '("twopage" "pdflatex \'\\def\\twop{1} \\input{dual.tex}\'" TeX-run-TeX nil t
                 :help "Run pdflatex with twopage on file")
               TeX-command-list)))
  (use-package company-auctex
    :ensure t
    :config
    (company-auctex-init))
  (use-package latex-preview-pane
    :ensure t)
  :bind (("C-<tab>" . TeX-complete-symbol)))

;; ========
;; doc-view
;; ========
(require 'doc-view)

;; Continous scrolling in doc view
(setq doc-view-continuous t)

;; view docs and scroll the page while in another buffer
(fset 'doc-prev "\C-xo\C-x[\C-xo")
(fset 'doc-next "\C-xo\C-x]\C-xo")
(global-set-key (kbd "M-[") 'doc-prev)
(global-set-key (kbd "M-]") 'doc-next)

;; Zooming in doc view with control+mouse
(global-set-key [C-mouse-4] 'text-scale-increase)
(global-set-key [C-wheel-up] 'text-scale-decrease)

(provide 'tex-init)
;;; tex-init.el ends here
