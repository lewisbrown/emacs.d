(delete "/Users/david/src/emacs-dev/ftp-versions/emacs-24.3/nextstep/Emacs.app/Contents/Resources/share/emacs/site-lisp" load-path)

;(setq package-load-list '(('scratch-persist "1.1")))

;(setq package-enable-at-startup nil) ; suppress package

(add-to-list 'load-path "~/.emacs.d/elisp")
;(add-to-list 'load-path "~/.emacs.d/elpa")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; LOADING
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(mapcar 'require '(
 		   platform-config
 		   frames-config
 		   basic-config
 		   org-config
 		   abbrev-config
 		   ; abbrev-defs-config
 		   ; aliases-config
 		   ; aliases-colors-config
 		   ; aquamacs-config
 		   backup-config
 		   ; css-config

 		   fonts-config
 		   functions-config
 		   ; narrowing-config
 		   ; ido-config
 		   ;recentfiles-config
 		   ;registers-config
 		   ; remember-config
 		   ; scratch-config
 		   ; text-config
 		   ; themes-config
 		   ; vcs-config
 		   ; version-control-config
 		   ; web-config
 		   ; xiki-config
 		   ;
 		   ; perl-config
 		   ; ruby-config
 		   ; groovy-config
 		   ; lisp-scheme-config
 		   ; moz-config
 		   ;

 		   ; packages-config
 		   ; paren
 		   ; follow-mouse
 		   ; generic-x
 		   ; allout
 		   ; cygwin-mount
 		   ; tramp
 		   midnight-config
 		   ; remember-config
 		   ; planner-config
 		   ; key-maps
 		   ; enotify
 		   ; evil
 		   ;  custom-config
           key-maps-config
 ))



;; fix Aquamacs changes
;; (osx-key-mode -1)  ; no Mac-specific key bindings
;(when (featurep 'aquamacs)
;  (one-buffer-one-frame-mode -1))    ; no one-buffer-per-frame


; consider using prog-mode-hook for modes used for all programming langs

;; emacs server
;(server-start)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(backup-inhibited t t)
 '(fill-column 78)
 '(ido-auto-merge-work-directories-length nil)
 '(ido-create-new-buffer (quote always))
 '(ido-enable-flex-matching t)
 '(ido-enable-prefix nil)
 '(ido-everywhere t)
 '(ido-ignore-extensions t)
 '(ido-max-prospects 8)
 '(ido-use-filename-at-point (quote guess))
 '(indent-tabs-mode nil)
 '(indicate-empty-lines t)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(puppet-indent-level tab-width)
 '(recentf-max-saved-items 75)
 '(require-final-newline t)
 '(ruby-indent-level tab-width)
 '(send-mail-function (quote smtpmail-send-it))
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
