(defalias 'yes-or-no-p 'y-or-n-p) ; y or n is enough
(defalias 'list-buffers 'ibuffer) ; always use ibuffer

; shortening of often used commands
(defalias 'rn 'wdired-change-to-wdired-mode) ; rename file in dired
(defalias 'g 'grep)
(defalias 'gf 'grep-find)
(defalias 'fd 'find-dired)
(defalias 'ntr 'narrow-to-region)
(defalias 'lml 'list-matching-lines)
(defalias 'dml 'delete-matching-lines)
(defalias 'dnml 'delete-non-matching-lines)
(defalias 'sl 'sort-lines)
(defalias 'dtw 'delete-trailing-whitespace)
(defalias 'lcd 'list-colors-display)
(defalias 'rb 'revert-buffer)
(defalias 'rs 'replace-string)
(defalias 'rr 'reverse-region)
(defalias 'lf 'load-file)
(defalias 'man 'woman)

(defalias 'sh 'shell)
(defalias 'ps 'powershell)
(defalias 'fb 'flyspell-buffer)
(defalias 'sbc 'set-background-color)

(defalias 'rof 'recentf-open-files)

; elisp
(defalias 'eb 'eval-buffer)
(defalias 'er 'eval-region)
(defalias 'ed 'eval-defun)
(defalias 'ele 'eval-last-sexp)
(defalias 'eis 'elisp-index-search)

; modes
(defalias 'hm 'html-mode)
(defalias 'tm 'text-mode)
(defalias 'elm 'emacs-lisp-mode)
(defalias 'vbm 'visual-basic-mode)
(defalias 'vlm 'visual-line-mode)
(defalias 'wsm 'whitespace-mode)
(defalias 'gwsm 'global-whitespace-mode)
(defalias 'om 'org-mode)
(defalias 'ssm 'shell-script-mode)
(defalias 'cc 'calc)
(defalias 'dsm 'desktop-save-mode)

(defalias 'acm 'auto-complete-mode)

(defalias 'html6-mode 'xah-html6-mode)

;; xah personal
(defalias '8w 'xwe-new-word-entry)
(defalias '8d 'xwe-add-definition)
(defalias '8s 'xwe-add-source)
(defalias 'c 'xah-cite)
(defalias 'cp 'copy-to-register-1)
(defalias 'cr 'compact-region)
(defalias 'cw 'count-words-region-or-line)
(defalias 'db 'dehtmlize-block)
(defalias 'dr 'dehtmlize-region)
(defalias 'dsc 'delete-secondlife-cache)
(defalias 'dss 'desktop-settings-setup)
(defalias 'dstp 'xah-fix-dstp)
(defalias 'eol 'replace-eols-to-p)
(defalias 'fs 'full-size-img-linkify)
(defalias 'ft 'fix-timestamp)
(defalias 'hb 'htmlize-block)
(defalias 'il 'image-linkify)
(defalias 'irh 'insert-random-hex)
(defalias 'irs 'insert-random-string)
(defalias 'k 'htmlize-keyboard-shortcut-notation)
(defalias 'wl 'wikipedia-linkify)
(defalias 'l 'xah-file-linkify)
(defalias 'lb 'listify-block)
(defalias 'mb 'make-blogger-entry)
(defalias 'mht 'make-html-table)
(defalias 'pt 'insert-register-content-1)
(defalias 'tb 'title-bracket-to-html-tag)
(defalias 'tls 'toggle-line-spacing)
(defalias 'w 'wrap-span)
(defalias 'xmae 'xah-make-atom-entry)
(defalias 'z 'amazon-linkify)
(defalias '~ 'make-backup)

(defalias '\(1\) 'xah-fix-number-items-block)
(defalias '& 'replace-html-chars)
(defalias '\\ 'escape-quotes-region)
(defalias '\[ 'remove-square-brackets)
(defalias '\" 'replace-straight-quotes)
