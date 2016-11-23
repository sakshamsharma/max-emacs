;;; keybindings.el --- the name is enough
;;; Commentary:
;;; Contains key bindings

;;; Code:

;; Some sane keybindings
(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)
(global-set-key [(control home)] 'beginning-of-buffer)
(global-set-key [(control end)] 'end-of-buffer)

;; Custom keybindings
(define-key esc-map [right] 'kill-word)         ;; esc -> kill-word
(define-key esc-map [left] 'backward-kill-word) ;; esc <- backward-kill-word

;; Setup Alt Keys
(global-set-key [(alt b)] `buffer-menu)
(global-set-key [(alt c)] `copy-region-as-kill)        ; ESC-w
(global-set-key [(alt g)] `goto-line)

;; Resize windows
(global-set-key (kbd "C-x <up>") 'shrink-window)
(global-set-key (kbd "C-x <down>") 'enlarge-window)
(global-set-key (kbd "C-x <left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-x <right>") 'enlarge-window-horizontally)

;; Other-window is M-o
(global-set-key "\M-o" 'other-window)

;; The awesome imenu, backed by semantic mode and helm
;; (global-set-key (kbd "C-c i") 'imenu)

;; Move to next and previous error/match with grep or compile
(global-set-key "\C-cn" 'next-error)
(global-set-key "\C-cp" 'previous-error)

;; Open newlines above current position
(global-set-key (kbd "C-S-o") 'open-line-above)

;; From vikraman's .emacs.d
;; These depend on functions defined in functions.el
(global-set-key (kbd "M-0")
                '(lambda () (interactive)
                   (global-text-scale-adjust (- text-scale-mode-amount))
                   (global-text-scale-mode -1)))
(global-set-key (kbd "M-+")
                '(lambda () (interactive) (global-text-scale-adjust 1)))
(global-set-key (kbd "M--")
                '(lambda () (interactive) (global-text-scale-adjust -1)))

;; Misc keybindings
(global-set-key (kbd "M-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))

(defun my-eval()
  (interactive)
  (if (region-active-p)
      (eval-region (region-beginning) (region-end) t)
    (call-interactively #'eval-last-sexp)))
(global-set-key (kbd "C-x C-e") #'my-eval)

(global-set-key (kbd "C-a") 'back-to-indentation-or-beginning)

(defun forward-or-backward-sexp (&optional arg)
  "Go to the matching parenthesis character if one is adjacent to point."
  (interactive "^p")
  (cond ((looking-at "\\s(") (forward-sexp arg))
        ((looking-back "\\s)" 1) (backward-sexp arg))
        ;; Now, try to succeed from inside of a bracket
        ((looking-at "\\s)") (forward-char) (backward-sexp arg))
        ((looking-back "\\s(" 1) (backward-char) (forward-sexp arg))))

(defun goto-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis. Else go to the
   opening parenthesis one level up."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1))
        (t
         (backward-char 1)
         (cond ((looking-at "\\s\)")
                (forward-char 1) (backward-list 1))
               (t
                (while (not (looking-at "\\s("))
                  (backward-char 1)
                  (cond ((looking-at "\\s\)")
                         (message "->> )")
                         (forward-char 1)
                         (backward-list 1)
                         (backward-char 1)))
                  ))))))

(global-set-key (kbd "C-%") 'goto-match-paren)

;; Helpful org mode
;; Use f7 to remember, c-f7 to go back
(global-set-key (kbd "<f7>") 'org-mark-ring-push)
(global-set-key (kbd "C-<f7>") 'org-mark-ring-goto)

;; Cool keybinding
;; Back from my vim days
;; Ctrl+Mod+h/l to enlarge contract
(global-set-key (kbd "C-s-l") (lambda ()
                                (interactive) (enlarge-window-horizontally 10)))
(global-set-key (kbd "C-s-h") (lambda ()
                                (interactive) (shrink-window-horizontally 10)))


(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

(provide 'keybindings)
;;; keybindings.el ends here
