;; remember
(autoload 'remember "remember" nil t)
(autoload 'remember-region "remember" nil t)

(eval-after-load 'remember 
  (progn
    (mapcar 'require '(remember-planner))
    (setq remember-handler-functions '(remember-planner-append))
    (setq remember-annotation-functions planner-annotation-functions) ) )
                       
(provide 'remember-config)
