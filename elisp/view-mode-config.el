(defun change-mode-line-color ()
  (interactive)
  (when (get-buffer-window (current-buffer))
    (cond (window-system
           (cond (view-mode
                  (set-face-background 'modeline "black")
                  (set-face-foreground 'modeline "orange")
                  )
                 (t
                  (set-face-background 'modeline "black")
                  (set-face-foreground 'modeline "white")))
           )
          (t
           (set-face-background 'modeline 
                                (if view-mode "red"
                                  "white"))))))
(defmacro change-mode-line-color-advice (f)
  `(defadvice ,f (after change-mode-line-color activate)
     (change-mode-line-color)
     (force-mode-line-update)))
(progn
  (change-mode-line-color-advice set-window-configuration)
  (change-mode-line-color-advice switch-to-buffer)
  (change-mode-line-color-advice pop-to-buffer)
  (change-mode-line-color-advice other-window)
  (change-mode-line-color-advice toggle-read-only)
  (change-mode-line-color-advice vc-toggle-read-only)
  (change-mode-line-color-advice vc-next-action)
  (change-mode-line-color-advice view-mode-enable)
  (change-mode-line-color-advice view-mode-disable)
  (change-mode-line-color-advice bury-buffer)
  (change-mode-line-color-advice kill-buffer)
  (change-mode-line-color-advice delete-window)
  ;; for windows.el
  (change-mode-line-color-advice win-switch-to-window)
  (change-mode-line-color-advice win-toggle-window)
  )
