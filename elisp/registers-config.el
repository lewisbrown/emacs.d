;; -----------------------------------------------------------------------
;; Initial register values
;; -----------------------------------------------------------------------
(set-register ?e '(file . "~/.emacs"))
(set-register ?z '(file . "~/.zshrc"))
(set-register ?o '(file . "~/.oh-my-zsh"))

;(cond ((file-exists-p (expand-file-name "~/work/rldev"))
;       (set-register ?k '(file . "~/work/rldev/lib/reallive.kfn"))))

(provide 'registers-config)
