(ido-mode 1)
(add-hook 'ido-mode-hook (lambda ()
                           (setq ido-enable-flex-matching t)
                           (setq ido-everywhere t)))
