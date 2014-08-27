;;; packages
(require 'package)
;(setq package-enable-at-startup nil) ;; pkgs activated after .emacs run, before after-init-hook
;(package-directory-list nil)
;(package-load-list (quote (all)))


(setq package-load-list '(('scratch-persist "1.1")))
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-load-all-descriptors)
(package-initialize)


; package-install :: 
; package-user-dir  :: user's elpa dir
; package-directory-list :: system wide elpa directories
; package-load-list :: list of pkgs ('all) (NAME t) (NAME "version") or (NAME nil)(to disable) that will be initialized
;                      edit this to change which packages are load or activated
; package--builtins :: list of builtin packages
; package-alist     :: list of packages available for activation, built by package-load-descriptor
; package-activated-list :: currently activated packages
; package-load-descriptor :: loads NAME-pkg.el
; package-activate-1 :: installs info, adds to load-path, loads autoloads, adds to package-activated-list
; package-activate   :: ensures dependencies are met then calls package-activate-1
; package-initialize :: runs package-activate on package-alist
; describe-package   :: display full docs
; list-packages      :: fetch & display list of package and allow install, etc.
; package-list-papckages-no-fetch :: like list-packages but doesn't retrieve updates first
; package-show-package-list :: slightly different ??


(defun load-package (pkg)
  (interactive "SPackage: ")
  (let ((pkg-vec (cdr (assq pkg package-alist))))
    (print pkg)
    (print pkg-vec)
    (package-activate-1 pkg pkg-vec)))

;; (defun package-list ())
  

(provide 'packages)
