;; give the anonymous functions names in this file
;; so that the command name show up in list bindings (C-h b)

;;;;;;;;;;;;;;;;;;;;;; Key Maps ;;;;;;;;;;;;;;;;;;;;;;;;;;
;(global-set-key [delete] 'delete-char)
;(global-set-key [kp-delete] 'delete-char)

;(global-set-key [f9] (lambda () (interactive)(Info-find-node "emacs" "top")))
;(global-set-key [S-f9] (lambda () (interactive)(Info-find-node "elisp" "top")))
;(global-set-key [C-f9] 'myinfo)

; invoke man
;(global-set-key [f2] (lambda () (interactive) (manual-entry (current-word))))
;(global-set-key [f3] 'compile) 
;(global-set-key [f4] 'gdb)

; add one for remember
;(define-prefix-command 'f12-prefix 'f12-map)
;(global-set-key [f12] 'f12-prefix)
;(global-set-key [f12 ?t] 'planner-create-task-from-buffer)
;(global-set-key [f12 ?r] 'remember)
;(global-set-key [f12 ?d] 'planner-delete-task)
;(global-set-key [f12 ?n] 'planner-create-note-from-task)
;(global-set-key [f12 ?s] 'planner-sort-tasks)
;(global-set-key [f12 ?c] 'calendar)
;(global-set-key [f12 ?u] 'planner-update-task)
;(global-set-key [f12 ?p] 'planner-replan-task)
;(global-set-key "\C-x\C-r" 'remember)
;(global-set-key "\C-\C-r" 'remember)

;(global-set-key "\C-cg" 'goto-line)
;(global-set-key "\C-x\C-n" 'next-error)
;(global-set-key "\C-cc" 'clipboard-kill-ring-save)
;(global-set-key "\C-cx" 'clipboard-kill-region)
;(global-set-key "\C-cv" 'clipboard-yank)
(global-set-key "\C-c'" (lambda () (interactive) (quote-region ?\')))
(global-set-key "\C-c\"" (lambda () (interactive) (quote-region ?\")))
;(global-set-key [M-home] 'beginning-of-line-text)

; why wont this work?
;(global-set-key "\C-v" (lambda () (scroll-up 1)))

(global-set-key "\C-o" 'open-line-and-go)
(global-set-key [(control shift ?O)] 'open-line-and-go-neg)

(global-set-key [(control shift ?J)] 'join-line) ;; also maped to M-^
(global-set-key [(control meta shift ?J)] (lambda () (interactive) (delete-indentation t)))

(global-set-key [(control shift ?K)] 'copy-line)


(define-prefix-command 'f8-prefix 'f8-map)
(global-set-key [f8] 'f8-prefix)
(global-set-key [f8 ?t] 'start-bash-here)
(global-set-key [f8 ?g] 'grep)
(global-set-key [f8 ?e] (lambda () (interactive) (shell-command "ql ~/help/pdfs/emacs-refcard.pdf")))

(global-set-key "\C-c-" 'underline-previous-line)
(global-set-key "\C-c_" 'underline-previous-line)
(global-set-key "\M-o" 'open-line)

(global-set-key "\C-\M-y" 'yank-secondary)

;(setq ns-right-command-modifier 'super)
;(setq ns-function-modifier 'hyper)
;
;(global-set-key [(hyper ?j)] 'left-char)
;(global-set-key [(hyper control ?j)] 'left-word)
;
;(global-set-key [(hyper ?l)] 'right-char)
;(global-set-key [(hyper control ?l)] 'right-word)
;
;(global-set-key [(hyper ?i)] 'previous-line)
;(global-set-key [(hyper ?,)] 'next-line)

;(global-set-key [(?\C-\s-j)] 'left-char)
;(global-set-key [(?\C-\s-j)] 'left-char)
;(global-set-key [ ?\C-\s-j ] 'left-char)
;(global-set-key "\C-\s-268632074" 'left-char)
;(global-set-key (kbd "C-s-j") 'left-char)

(provide 'key-maps-config)
