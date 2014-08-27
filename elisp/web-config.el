;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; WEB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'scss-mode "scss-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.scss" . scss-mode))

;; ;(ad-activate 'browse-url)
;; (ad-enable-advice 'browse-url 'around 'browse-url-win-or-w3m)
