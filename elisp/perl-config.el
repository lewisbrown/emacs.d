;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PERL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(load-library "cperl-mode")
(add-to-list 'auto-mode-alist '("\\\\.[Pp][LlMm][Cc]?$" . cperl-mode))
(while (let ((orig (rassoc 'perl-mode auto-mode-alist)))
	 (if orig (setcdr orig 'cperl-mode))))
(while (let ((orig (rassoc 'perl-mode interpreter-mode-alist)))
	 (if orig (setcdr orig 'cperl-mode))))
(dolist (interpreter '("perl" "perl5" "perl5i" "miniperl" "pugs"))
  (unless (assoc interpreter interpreter-mode-alist)
    (add-to-list 'interpreter-mode-alist (cons interpreter 'cperl-mode))))

(defun perltidy ( )
  "Run perltidy on the current region or buffer."
  (interactive)
  ; Inexplicably, save-excursion doesn't work here.
  (let ((orig-point (point)))
    (unless (mark) (mark-defun))
    (shell-command-on-region (point) (mark) "perltidy -q" nil t)
    (goto-char orig-point)))
;(global-set-key "\C-ct" 'perltidy)

(defvar perltidy-mode nil
    "Automatically 'perltidy' when saving.")
  (make-variable-buffer-local 'perltidy-mode)
  (defun perltidy-write-hook ()
    "Perltidys a buffer during 'write-file-hooks' for 'perltidy-mode'"
    (if perltidy-mode
        (save-excursion
          (widen)
          (mark-whole-buffer)
          (not (perltidy)))
      nil))

(defun perltidy-mode (&optional arg)
  "Perltidy minor mode."
  (interactive "P")
  (setq perltidy-mode
	(if (null arg)
	    (not perltidy-mode)
	  (> (prefix-numeric-value arg) 0)))
  (make-local-hook 'write-file-hooks)
  (if perltidy-mode
      (add-hook 'write-file-hooks 'perltidy-write-hook)
    (remove-hook 'write-file-hooks 'perltidy-write-hook)))
(if (not (assq 'perltidy-mode minor-mode-alist))
    (setq minor-mode-alist
	  (cons '(perltidy-mode " Perltidy")
		minor-mode-alist)))

(eval-after-load "cperl-mode"
  '(add-hook 'cperl-mode-hook 'perltidy-mode))


;; Perl compile
(defvar perl-syntax-bin "perl"
    "The perl binary used to check syntax.")

(defun perl-syntax-check-only ()
  "Returns a either nil or t depending on whether \\
     the current buffer passes perl's syntax check."
  (interactive)
  (let ((buf (get-buffer-create "*Perl syntax check*")))
    (let ((syntax-ok (= 0 (save-excursion
			    (widen)
			    (call-process-region
			     (point-min) (point-max) perl-syntax-bin nil buf nil "-c"))) ))
      (if syntax-ok (kill-buffer buf)
	(display-buffer buf))
      syntax-ok)))

(defvar perl-syntax-mode nil
  "Check perl syntax before saving.")

(make-variable-buffer-local 'perl-syntax-mode)

(defun perl-syntax-write-hook ()
  "Check perl syntax during 'write-file-hooks' for 'perl-syntax-mode'"
  (if perl-syntax-mode
      (save-excursion
	(widen)
	(mark-whole-buffer)
	(not (perl-syntax-check-only)))
    nil))

(defun perl-syntax-mode (&optional arg)
  "Perl syntax checking minor mode."
  (interactive "P")
  (setq perl-syntax-mode
	(if (null arg)
	    (not perl-syntax-mode)
	  (> (prefix-numeric-value arg) 0)))
  (make-local-hook 'write-file-hooks)
  (if perl-syntax-mode
      (add-hook 'write-file-hooks 'perl-syntax-write-hook)
    (remove-hook 'write-file-hooks 'perl-syntax-write-hook)))
(if (not (assq 'perl-syntax-mode minor-mode-alist))
    (setq minor-mode-alist
	  (cons '(perl-syntax-mode " Perl Syntax")
		minor-mode-alist)))

(eval-after-load "cperl-mode"
  '(add-hook 'cperl-mode-hook 'perl-syntax-mode))

;; Perl Test
(eval-after-load "cperl-mode"
  '(add-hook 'cperl-mode-hook
	     (lambda () (local-set-key "\\C-ct" 'cperl-prove))))

(defun cperl-prove ()
  "Run the current test."
  (interactive)
  (shell-command (concat "prove -v "
			 (shell-quote-argument (buffer-file-name)))))

;; perl eval region
(defun perl-eval (beg end)
  "Run selected region as Perl code"
  (interactive "r")
  (shell-command-on-region beg end "perl"))
