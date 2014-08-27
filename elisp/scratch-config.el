;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; scratch
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; bury *scratch* buffer instead of kill it
(defadvice kill-buffer (around kill-buffer-around-advice activate)
  (let ((buffer-to-kill (ad-get-arg 0)))
    (if (equal buffer-to-kill "*scratch*")
        (bury-buffer)
      ad-do-it)))
