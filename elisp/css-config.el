;; look into rainbow-mode

; list-colors-display


(defvar hexcolour-keywords
  '(("#[abcdef[:digit:]]\\{6\\}"
     (0 (put-text-property
         (match-beginning 0)
         (match-end 0)
         'face (list :background
                     (match-string-no-properties 0)))))))
(defun hexcolour-add-to-font-lock ()
  (font-lock-add-keywords nil hexcolour-keywords))

(add-hook 'css-mode-hook 'hexcolour-add-to-font-lock)
(add-hook 'php-mode-hook 'hexcolour-add-to-font-lock)
(add-hook 'html-mode-hook 'hexcolour-add-to-font-lock)


; The code above only works with color of the form #rrggbb, not CSS3's HSL hsl(0,100%,50%)


(defun insert-random-color-hsl ()
  "Insert a random color string of CSS HSL format.
Example output: hsl(100,24%,82%)"
  (interactive)
  (insert (format "hsl(%d,%d%%,%d%%)" (random 360) (random 100) (random 100))) )

