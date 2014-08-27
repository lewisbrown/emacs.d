(defun list-load-path ()
  (let ((buf (get-buffer-create "load-path")))
    (dolist (d (sort load-path 'string<))
      (princ d buf)
      (terpri buf))
    (set-window-buffer nil buf)))

(defun list-finder-known-keywords ()
  (let ((b (get-buffer "*scratch*")))
    (dolist (w finder-known-keywords)
      (princ w b)
      (terpri b))))

(defun list-loaded-features ()
  (let ((b (get-buffer "*scratch*")))
    (dolist (f features)
      (princ f b)
      (terpri b))))

(defun list-features ()
  (let ((buf (get-buffer-create "features")))
    (dolist (dirname load-path)
      (call-process-shell-command "grep" nil "tmp" nil "--no-filename" "--text" "'^(autoload\\|^(provide'" "*")
      (switch-to-buffer "tmp")
      (append-to-buffer buf (point-min) (point-max))))
  ;; Remove duplicates from finding provided functions in both .el and .elc files
  (switch-to-buffer buf)
  (shell-command-on-region (point-min) (point-max) "sort -u" nil t nil nil))

(list-features)

(list-load-path)

