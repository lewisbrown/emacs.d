
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Lisp & Scheme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Quack
;(require 'eval-expr)

;(autoload 'run-scheme "quack" nil t)


;(add-hook 'scheme-mode-hook
;	  (lambda ()
;	    (define-key scheme-mode-map [f5]
;	      '(lambda ()
;		 (interactive)
;		 (ignore-errors
;		   (let ((symbol (thing-at-point 'symbol)))
;		     (info "(r5rs)")
;		     (Info-index symbol)))))))

;; elib
;(setq load-path (append (list "/usr/share/emacs/site-lisp/elib")
;                       load-path))


;; ILISP
;(defun ilisp ()
;  (interactive)
;  (load ".ilisp")
;  (run-ilisp))

;;; This makes reading a Lisp or Scheme file load in ILISP.
;(set-default 'auto-mode-alist
; 	     (append '(("\\.lisp$" . lisp-mode)
;		       ("\\.lsp$" . lisp-mode)
;		       ("\\.cl$" . lisp-mode)
;		       ("\\.ste" . lisp-mode)) ; stella
;		     auto-mode-alist))

;(setq lisp-mode-hook '(lambda () (load ".ilisp") (require 'ilisp)))

;(set-default 'auto-mode-alist
;	     (append '(("\\.scm$" . scheme-mode)
;	       ("\\.ss$" . scheme-mode)
;		       ("\\.stk$" . scheme-mode)
;	       ("\\.stklos$" . scheme-mode))
;		     auto-mode-alist))

;(setq scheme-mode-hook '(lambda () (load ".ilisp") (require 'ilisp)))

;;; ACL
;; (defun acl ()
;;   (interactive)
;;   (load "/local/acl5/eli/fi-site-init")
;;   (setq fi:common-lisp-image-name "/local/acl5/lisp")
;;   (fi:common-lisp))

;; ;;; STELLA
;; (defun stella (&optional arg)
;;   (interactive "P")
;;   (load "/local/acl5/eli/fi-site-init")
;;   (fi:common-lisp "STELLA"		     ;buffer
;; 		  "/home/lbrown/lang/stella" ;directory
;; 		  "/local/acl5/lisp"     ;executable
;; 		  nil			;args
;; 		  nil			     ;host
;; 		  "/home/lbrown/lang/stella/stella.dxl" ;image
;; 		  ))

