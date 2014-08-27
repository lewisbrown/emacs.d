(put 'narrow-to-defun  'disabled nil)
(put 'narrow-to-page   'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; example use in code
(defun replace-regexp-in-region (start end)
      (interactive "*r")
      (save-excursion
        (save-restriction
          (let ((regexp (read-string "Regexp: "))
                (to-string (read-string "Replacement: ")))
            (narrow-to-region start end)
            (goto-char (point-min))
            (while (re-search-forward regexp nil t)
              (replace-match to-string nil nil))))))
