;; -*- emacs-lisp -*-
;; Gnus startup file.
;; Never delete this file -- if you want to force Gnus to read the
;; .newsrc file (if you have one), touch .newsrc instead.
(setq gnus-newsrc-file-version "Gnus v5.9.0")
(setq gnus-newsrc-last-checked-date '"22 Sep 2005 11:24:44 -0600")
(setq gnus-newsrc-alist '(("nndraft:drafts" 1 nil nil (nndraft "") ((gnus-dummy (gnus-draft-mode))))))
(setq gnus-server-alist '(("archive" nnfolder "archive" (nnfolder-directory "~/Mail/archive") (nnfolder-active-file "~/Mail/archive/active") (nnfolder-get-new-mail nil) (nnfolder-inhibit-expiry t))))
(setq gnus-format-specs '((group-mode "Gnus: %%b {%M%:%S}" (concat (format "Gnus: %%b {%s%s%s}" gnus-tmp-news-method gnus-tmp-colon gnus-tmp-news-server))) (group "%M%S%p%P%5y: %(%g%)%l\n" (progn (insert (format "%c%c%c%s%5s: " gnus-tmp-marked-mark gnus-tmp-subscribed gnus-tmp-process-marked gnus-group-indentation gnus-tmp-number-of-unread)) (gnus-put-text-property (point) (progn (insert gnus-tmp-group) (point)) gnus-mouse-face-prop gnus-mouse-face) (insert gnus-tmp-grouplens "\n"))) (version . "21.2.1")))
