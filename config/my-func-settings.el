(defun vi-open-line-below ()
  ;Insert a newline below the current line and put point at beginning
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline-and-indent))

(define-key global-map [(meta insert)] 'vi-open-line-below)


(defun kill-current-line (&optional n)
  (interactive "p")
  (save-excursion
    (beginning-of-line)
    (let ((kill-whole-line t))
      (kill-line n))))

;; describe font face under cursor
(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))