;; check OS type
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (message "Microsoft Windows") )
  )
 ((string-equal system-type "darwin")   ; Mac OS X
  (progn
    (message "Mac OS X")
    )
  )
 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (message "Linux") )
  )
 )


; if aquamacs (one-buffer-one-frame-mode -1))    ; no one-buffer-per-frame


;    emacs-major-version :: major version
;    emacs-minor-version :: minor version
;    system-name :: returns the host name.
;    user-login-name :: returns user login name.
;    user-emacs-directory :: init file dir.
;    user-init-file :: init file path.

;; Sample use.
;; when calling “list-colors-display”, make result sorted by hue.
;(when (>= emacs-major-version 24) (setq list-colors-sort 'hsv ) )




(provide 'platform-config)
