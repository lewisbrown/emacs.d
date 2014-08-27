; need to test for whether we're running on a term or gui?

(setq initial-frame-alist  '((width . 110) (height . 70) (left . -10) (top . 30)))

(setq default-frame-alist
      '((menu-bar-lines . 1)
        (left-fringe)
        (right-fringe)
        (tool-bar-lines . 0)
        (width . 110)
        (height . 70)
        ))

;window-system-default-frame-alist
; minibuffer-frame-alist


;? menu-bar-mode

(provide 'frames-config)
