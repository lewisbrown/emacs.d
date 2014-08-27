;; remind isn't working, need another program
;; checkout planner.el for details
(autoload 'plan "planner" nil t)
(eval-after-load 'planner 
  (progn
    (mapcar 'require '(planner-appt
                       planner-bookmark
                       planner-calendar
                       planner-cyclic
                       planner-deadline
                       planner-diary
                       planner-id
                       planner-lisp
                       planner-notes-index
                       planner-rank
                       planner-report
                       schedule
                       planner-schedule
                       planner-tasks-overview
                       planner-timeclock-summary-proj
                       planner-timeclock-summary
                       planner-timeclock
                       planner-trunk
                       planner-w3m
                       planner-accomplishments
                       emacs-wiki-table
                       remember-config
                       ;remind
                       ) )
    (setq european-calendar-style t)
    ;(add-hook 'planner-mode-hook
    ;          (lambda () (interactive)             
    ;            (make-local-hook 'after-save-hook)
    ;            (add-hook 'after-save-hook 'remind-parse-planner t t)
    ;            (add-hook 'after-save-hook 'remind-export-to-diary t t)))    
;;; set in remember-config.el
;    (setq remember-handler-functions '(remember-planner-append))
;    (setq remember-annotation-functions planner-annotation-functions)
    ;; Allow #includes in ~/diary
    (add-hook 'list-diary-entries-hook 'include-other-diary-files)
    (setq mark-diary-entries-in-calendar t)
    (add-hook 'diary-display-hook 'fancy-diary-display)
    (setq european-calendar-style t)
    (setq calendar-date-display-form european-calendar-display-form)
    (setq diary-date-forms european-date-diary-pattern)
    (update-calendar-mode-line)
    (setq planner-diary-use-diary t)
    ;(planner-diary-insinuate)
    (setq planner-day-page-template
          "* Tasks\n\n\n* Schedule\n\n\n* Diary\n\n\n* Notes")
    (planner-insinuate-calendar)
    (planner-calendar-insinuate)
    ;(planner-appt-use-tasks-and-schedule)
    ; these are inserting at the top of the page instead of in their
    ; proper location 
    ;(planner-appt-insinuate)
    ;(planner-appt-schedule-cyclic-insinuate)
    ;(planner-appt-calendar-insinuate)
    (setq planner-carry-tasks-forward nil) ) )


(defun lb/emacs-wiki-auto-publish ()
  (when (derived-mode-p 'emacs-wiki-mode)
    (unless emacs-wiki-publishing-p
      (let ((emacs-wiki-publishing-p t)
            (emacs-wiki-after-wiki-publish-hook nil))
     	(emacs-wiki-publish-this-page)))))

(add-hook 'emacs-wiki-mode-hook
          (lambda ()
            (add-hook 'after-save-hook
                      'lb/emacs-wiki-auto-publish nil t)))

(provide 'planner-config)
