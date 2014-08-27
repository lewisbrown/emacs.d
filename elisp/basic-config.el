;; window settings
(windmove-default-keybindings)
(setq windmove-wrap-around t)

(setq bookmark-save-flag 1)

;;; abbrevs
;(setq abbrev-file-name "~/.emacs.d/elisp/abbrev.el")
;(quietly-read-abbrev-file)
;; ask whether to save newly added abbrev when quitting emacs
;(setq save-abbrevs t)
;(setq-default abbrev-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SETTINGS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;TODO stop mouse from blinking and change it's color

;; mouse & scrolling
(mouse-wheel-mode)			; activate mouse scrolling
; scroll one line at a time (less "jumpy" than defaults)
;(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
;(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
;(setq scroll-step 1) ;; keyboard scroll one line at a time
;(setq scroll-conservatively 1000)
;(setq auto-window-vscroll nil)
;(turn-on-follow-mouse)
;(setq follow-mouse-deselect-active-minibuffer nil)

(tool-bar-mode -1)
(global-font-lock-mode t)		; syntax highlighting
(transient-mark-mode t)			; sane select (mark) mode
; ? (setq-default transient-mark-mode t) ;; Visual feedback on selections
(delete-selection-mode t)		; entry deletes marked text
;(column-number-mode t)     TODO: add to menu
(show-paren-mode t)	     		; match parentheses
(setq show-paren-style 'mixed)
(scroll-bar-mode (quote left))
;(global-linum-mode t)


(setq man-switches  "-a")

(setq visible-bell t)

; ? (icomplete-mode t)

;; don't let the cursor go into minibuffer prompt
;(setq minibuffer-prompt-properties (quote (read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)))

(set-default 'indicate-empty-lines t)
(fset 'yes-or-no-p 'y-or-n-p)
(column-number-mode t)
(fringe-mode 10)

(put 'eval-expression 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(setq enable-recursive-minibuffers nil)

(recentf-mode t)

; ? (global-visual-line-mode t)
; ? (global-hl-line-mode t)

(setq require-final-newline t) ;; Always end a file with a newline

; ? (setq next-line-add-newlines nil) ;; Stop at the end of the file, not just add lines




;(setq grep-command "grep -nHi -e ")
;(setq grep-find-command (quote ("find . -type f -exec grep -nHi -e  {} +" . 34)))
;(setq grep-find-template "find . <X> -type f <F> -exec grep <C> -nHi -e <R> {} +")
;(setq grep-template "grep <X> <C> -nHi -e <R> <F>")


(provide 'basic-config)

