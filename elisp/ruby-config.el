;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; RUBY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(setq ruby-mode-hook '(lambda ()
			 (enotify-minor-mode t)
			 (require 'rinari)
			 (require 'rvm)
			 (rvm-use-default)
			 (setq rinari-tags-filename "TAGS")))

