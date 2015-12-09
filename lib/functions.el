;;; functions.el --- Define custom functions
;;; Commentary:
;;; Understood

;;; Code:

(defun open-line-above (N)
    "Insert a new line above the current point position.
With arg N, insert N newlines."
    (interactive "p")
    (save-excursion
      (beginning-of-line)
      (newline N)))

(provide 'functions.el)
;;; functions.el ends here
