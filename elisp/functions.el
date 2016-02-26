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

;; Global zoom and bindings
(define-globalized-minor-mode
  global-text-scale-mode
  text-scale-mode
  (lambda () (text-scale-mode 1)))
(defun global-text-scale-adjust (inc) (interactive)
       "Adjust global zoom"
       (text-scale-set 1)
       (kill-local-variable 'text-scale-mode-amount)
       (setq-default text-scale-mode-amount (+ text-scale-mode-amount inc))
       (global-text-scale-mode 1)
       )

(defun back-to-indentation-or-beginning () (interactive)
       (if (= (point) (progn (back-to-indentation) (point)))
           (beginning-of-line)))


;; rename current buffer-visiting file
(defun yt/rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(defun yt/delete-this-buffer-and-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

(defun yt/last-updated-date ()
  "return modification time of current file-visitng buffer"
  (interactive)
  (let* ((mtime (visited-file-modtime)))
    (unless (integerp mtime)
      (concat "/Last UPdated/: "
              (format-time-string "%d %b %Y" mtime)))))

(provide 'functions)
;;; functions.el ends here
