;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ORG MODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
;(add-to-list org-agenda-files "~/docs/notes/Org.org")
(setq org-agenda-files (quote ("~/docs/org/Org.org")))
(setq org-agenda-include-diary t)
(setq org-insert-heading-respect-content t)
(setq org-use-speed-commands t)
;(add-to-list 'org-modules 'org-mac-iCal)  ; org-modules value as a variable is void

(add-hook 'org-mode-hook
	  (lambda ()
	    (define-key org-mode-map "\C-cl" 'org-store-link)
	    (define-key org-mode-map "\C-ca" 'org-agenda)
	    (define-key org-mode-map "\C-cb" 'org-iswitchb)
	    ))


(org-agenda-list)

(provide 'org-config)
