; Command-T will bring up font window to change default font

; Call variable-pitch-mode to toggle between fixed-width and variable-width font
; To get a list of fonts in emacs, use (dolist (x (font-family-list)) (print x)).

;One of the best font is the “DejaVu” suite. “DejaVu Sans Mono” for
;fixed-width and “DejaVu Sans” for variable-width. This font also
;contains most of the math symbols in Unicode.

(defcustom ξ-font-list nil "A list of fonts for `cycle-font' to cycle from." :group 'font)

(set-default 'ξ-font-list 
(cond
 ((string-equal system-type "windows-nt") ; Windows
'(
                         "Courier New-10"
                         "DejaVu Sans Mono-9"
                         "Lucida Console-10"
                         "Segoe UI Symbol-12"

                         "DejaVu Sans-10"
                         "Lucida Sans Unicode-10"
                         "Arial Unicode MS-10"

                         )
  )
 ((string-equal system-type "gnu/linux")
 '(
                         "DejaVu Sans Mono-9"
                         "DejaVu Sans-9"
                         "Symbola-13"
                         )
 )
 ((string-equal system-type "darwin") ; Mac
  '("Inconsolata" 
    "Anonymous Pro for Powerline"
    "Big Caslon"
    "Courier"
    "Georgia"
    "Gill Sans"
    "Menlo"
    "Meslo LB S for Powerline"
    "Monaco"
    "Optima"
    "Source Code Pro for Powerline"
    "Times New Roman"
    "DejaVu Sans Mono-9"
     "DejaVu Sans Mono-10"
     "DejaVu Sans-9"
     "DejaVu Sans-10"
     "Symbola-12"
     ) ) )
)

(defun cycle-font (ξ-n)
  "Change font in current frame.
Each time this is called, font cycles thru a predefined list of fonts in the variable `ξ-font-list' .
If ξ-n is 1, cycle forward.
If ξ-n is -1, cycle backward."
  (interactive "p")
  ;; this function sets a property “state”. It is a integer. Possible values are any index to the fontList.
  (let (fontToUse stateBefore stateAfter )
    (setq stateBefore (if (get 'cycle-font 'state) (get 'cycle-font 'state) 0))
    (setq stateAfter (% (+ stateBefore (length ξ-font-list) ξ-n) (length ξ-font-list)))

    (setq fontToUse (nth stateAfter ξ-font-list))
    (set-frame-parameter nil 'font fontToUse)
    (redraw-frame (selected-frame))
    (message "Current font is: %s" fontToUse )

    (put 'cycle-font 'state stateAfter) ) )

(defun cycle-font-forward ()
  "Switch to the next font, in the current frame.
See `cycle-font'."
  (interactive)
  (cycle-font 1)
  )

(defun cycle-font-backward ()
  "Switch to the previous font, in the current frame.
See `cycle-font'."
  (interactive)
  (cycle-font -1)
  )

(defun toggle-line-spacing ()
"Toggle line spacing between no extra space to extra half line height."
(interactive)
(if (eq line-spacing nil)
    (setq-default line-spacing 0.5) ; add 0.5 height between lines
  (setq-default line-spacing nil)   ; no extra heigh between lines
  ))

(provide 'fonts-config)
