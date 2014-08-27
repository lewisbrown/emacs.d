
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GROOVY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.gradle" . groovy-mode))
(add-hook 'groovy-mode-hook (lambda () setq tab-width 4))
