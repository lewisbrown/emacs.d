;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun do-org-show-all-inline-images ()
  (interactive)
  (org-display-inline-images t t))

(autoload 'Info-find-node "info")
(autoload 'Info-find-node "myinfo")
(defun myinfo (&optional file node)
  "Enter Info,  the documentation browser.
 Optional argument FILE specifies the file to examine;
 the default is the top-level directory of Info.

 In interactive use a file name and node are read from the minibuffer.

 The search path for Info files is in the variable `Info-directory-list'.
 The top-level Info directory is made by combining all the files named `dir'
 in all the directories in that path."
  (interactive
   (list (read-string "File(dir): " nil nil "dir")
         (read-string "Node(top): " nil nil "top")))
  (if file
      (Info-find-node file node) ) )

(defun open-line-and-go (arg)
  "Open a newline, leaving present line intact,
and go to the beginning of that line.
With arg N, insert N newlines and go to last."
  (interactive "*p")
  (let* ((do-fill-prefix (and fill-prefix (bolp)))
	 (do-left-margin (and (bolp) (> (current-left-margin) 0)))
         (loc (point))
         (newloc)
	 ;; Don't expand an abbrev before point.
	 (abbrev-mode nil))
    (end-of-line)
    (newline arg)
    (setq newloc (point))
    (goto-char loc)
    (while (> arg 0)
      (cond ((bolp)
	     (if do-left-margin (indent-to (current-left-margin)))
	     (if do-fill-prefix (insert-and-inherit fill-prefix))))
      (forward-line 1)
      (setq arg (1- arg)))
    (goto-char newloc)
    (end-of-line)))

(defun open-line-and-go-neg (arg)
  "Open a newline, leaving present line intact,
and go to the beginning of that line.
With arg N, insert N newlines and go to last."
  (interactive "*p")
  (let* ((do-fill-prefix (and fill-prefix (bolp)))
	 (do-left-margin (and (bolp) (> (current-left-margin) 0)))
         ;(loc (point))
         (newloc)
	 ;; Don't expand an abbrev before point.
	 (abbrev-mode nil))
    (beginning-of-line)
    (setq newloc (point))
    (newline arg)
    (goto-char newloc)
    (while (> arg 0)
      (cond ((bolp)
	     (if do-left-margin (indent-to (current-left-margin)))
	     (if do-fill-prefix (insert-and-inherit fill-prefix))))
      (forward-line 1)
      (setq arg (1- arg)))
    (goto-char newloc)
    (end-of-line)))

(defun quote-region (char)
  "quote region with given char."
  (insert-char char 1 t)
  (exchange-point-and-mark)
  (insert-char char 1 t)
  (exchange-point-and-mark) )

(defun unquote-region ()
  "unquote region."
  (delete-char 1 nil)
  (exchange-point-and-mark)
  (delete-char 1 nil)
  (exchange-point-and-mark) )

(defun yank-secondary ()
  "Insert the secondary selection at point.
  Moves point to the end of the inserted text.  Does not change mark."
  (interactive) (insert (x-get-selection 'SECONDARY)))

(defun iter (first last)
  "Insert numbers from FIRST to LAST, one per line."
  (interactive "nFirst: \nnLast: ")
  (let ((i first))
    (if (< first last)
        (while (<= i last)
          (insert (format "%d\n" i))
          (setq i (+ 1 i)))
      (while (>= i last)
            (insert (format "%d\n" i))
            (setq i (- i 1))))))

(defun start-bash-here()
  "Open a bash window in the current directory."
  (interactive)
  ;; I'd like to use mswindows-shell-execute but it doesn't seem to start
  ;; in the current directory, or provide a way to specify start directory.
  (start-process-shell-command
   "*gse-bash*"
   nil
   "rxvt"
   "-e bash"))

(defun underline-previous-line ()
  "Underline the previous line with dashes."
  (interactive)
  (let ((start-pos (point))
        (start-col nil)
        (end-col nil))
    (beginning-of-line 0)
    (if (re-search-forward "[^ ]" (save-excursion (end-of-line) (point)) t)
        (progn
          (setq start-col (- (current-column) 1))

          (end-of-line)
          (re-search-backward "[^ ]" nil t)
          (setq end-col (current-column))

          ;; go to next line and insert dashes
          (beginning-of-line 2)
          (insert
           (make-string start-col ?\ )
           (make-string (+ 1 (- end-col start-col)) ?-)
           "\n")
          )
      (goto-char start-pos)
      (error "No text on previous line"))
    ))

(defun copy-region (beg end)
  (interactive "r")
  (let ((string (buffer-substring beg end)))
    (when string			;STRING is nil if BEG = END
      (if (eq last-command 'kill-region)
          (kill-append string (< end beg))
        (kill-new string)))
    (setq this-command 'kill-region)))

(defun copy-line (&optional arg)
  (interactive "P")
  (let ((beg (point))
        (end (progn
               (if arg
                   (forward-visible-line (prefix-numeric-value arg))
                 (if (eobp)
                     (signal 'end-of-buffer nil))
                 (if (or (looking-at "[ \t]*$") (and kill-whole-line (bolp)))
                     (forward-visible-line 1)
                   (end-of-visible-line)))
               (point))))
    (copy-region beg end)
    (if (interactive-p)
        (let ((inhibit-quit t))
          (if (pos-visible-in-window-p end (selected-window))
              (progn
                (goto-char (if (> (prefix-numeric-value arg) 0)
                               (- end 1)
                             end))
                (sit-for 0 500)
                (goto-char beg)
                (sit-for 0 250)
                (goto-char end)
                (and quit-flag mark-active
                     (deactivate-mark)))
            (let* ((killed-text (current-kill 0))
                   (message-len (min (length killed-text) 40)))
              (if (= (point) beg)
                  (message "Saved text until \"%s\""
                           (substring killed-text (- message-len)))
                (message "Saved text from \"%s\""
                         (substring killed-text 0 message-len)))))))))

(defun forward-block ()
  "Move cursor forward to next occurrence of double newline character.
In most major modes, this is the same as `forward-paragraph', however, this command's behavior is the same regardless of syntax table."
  (interactive)
  (skip-chars-forward "\n")
  (when (not (search-forward-regexp "\n[[:blank:]]*\n" nil t))
    (goto-char (point-max)) ) )

(defun backward-block ()
  "Move cursor backward to previous occurrence of double newline char.
See: `forward-block'"
  (interactive)
  (skip-chars-backward "\n")
  (when (not (search-backward-regexp "\n[[:blank:]]*\n" nil t))
    (goto-char (point-min))
    )
  )

;; ;; browse-url function
;; (defun lb/browse-url-win-or-w3m (url browse)
;;   (interactive (list ("URL(google): " nil nil "www.google.com")
;;                      ("browser(FireFox): " nil nil "firefox")))
;; ;(url (read-string "URL(google): " nil nil "http://www.google.com"))
;; ;         (browser (read-string "browser(w3m): " nil nil "w3m")));;   (if (equal browser "w3m")
;;       (w3m-browse-url url)
;;     (browse-url-default-windows-browser url)))

;; (defadvice browse-url (around browse-url-win-or-w3m first compile preactivate)
;;   "Ask user what browser he wants to use before opening a url."
;;   (if (command-p lb/browse-url-win-or-w3m)
;;       (message-box "lb/browse-url-win-or-w3m is a command."))
;;   (call-interactively lb/browse-url-win-or-w3m))


(defun toggle-margin-right ()
  "Toggle the right margin between `fill-column' or window width.
This command is convenient when reading novel, documentation."
  (interactive)
  (if (eq (cdr (window-margins)) nil)
      (set-window-margins nil 0 (- (window-body-width) fill-column))
    (set-window-margins nil 0 0) ) )


(defun unfill-paragraph ()
  "Replace newline chars in current paragraph by single spaces.
This command does the inverse of `fill-paragraph'."
  (interactive)
  (let ((fill-column 90002000)) ; 90002000 is just random. you can use `most-positive-fixnum'
    (fill-paragraph nil)))

(defun unfill-region (start end)
  "Replace newline chars in region by single spaces.
This command does the inverse of `fill-region'."
  (interactive "r")
  (let ((fill-column 90002000))
    (fill-region start end)))

(defun compact-uncompact-block ()
  "Remove or add line ending chars on current paragraph.
This command is similar to a toggle of `fill-paragraph'.
When there is a text selection, act on the region."
  (interactive)

  ;; This command symbol has a property “'stateIsCompact-p”.
  (let (currentStateIsCompact (bigFillColumnVal 90002000) (deactivate-mark nil))
    ;; 90002000 is just random. you can use `most-positive-fixnum'

    (save-excursion
      ;; Determine whether the text is currently compact.
      (setq currentStateIsCompact
            (if (eq last-command this-command)
                (get this-command 'stateIsCompact-p)
              (if (> (- (line-end-position) (line-beginning-position)) fill-column) t nil) ) )

      (if (region-active-p)
          (if currentStateIsCompact
              (fill-region (region-beginning) (region-end))
            (let ((fill-column bigFillColumnVal))
              (fill-region (region-beginning) (region-end))) )
        (if currentStateIsCompact
            (fill-paragraph nil)
          (let ((fill-column bigFillColumnVal))
            (fill-paragraph nil)) ) )

      (put this-command 'stateIsCompact-p (if currentStateIsCompact nil t)) ) ) )


;;;;;
;; Window splitting. On modern widescreen monitors it makes a lot more
;; sense to try to split horizontally first, then vertically. The default
;; splitting height also really needs reduction.

(defun split-window-sensibly-preferring-horizontal (window)
  "Like `split-window-sensibly', but preferring horizontal splits."
  (or (and (window-splittable-p window t)
           ;; Split window horizontally.
           (with-selected-window window
             (split-window-horizontally)))
      (and (window-splittable-p window)
           ;; Split window vertically.
           (with-selected-window window
             (split-window-vertically)))
      (and (eq window (frame-root-window (window-frame window)))
           (not (window-minibuffer-p window))
           ;; If WINDOW is the only window on its frame and is not the
           ;; minibuffer window, try to split it vertically disregarding
           ;; the value of `split-height-threshold'.
           (let ((split-height-threshold 0))
             (when (window-splittable-p window)
               (with-selected-window window
                 (split-window-vertically)))))))

;(setq split-height-threshold 50
;      split-window-preferred-function 'split-window-sensibly-preferring-horizontal)﻿


;Speaking of pop-up windows and frames, I've always set
;display-buffer-reuse-frames to t.  Now in 24.3 they've tagged it
;as obsolete and claim the replacement is this massively horrible
;ugly unusable monstrosity called display-buffer-alist.  Yuck.

(provide 'functions-config)
