(define-abbrev-table 'global-abbrev-table '(

    ;; math/unicode symbols
    ("8in" "∈")
    ("8nin" "∉")
    ("8inf" "∞")
    ("8luv" "♥")
    ("8smly" "☺")

    ;; email
    ("8me" "lewisbrown@gmail.com")

    ;; signature
    ("8lb" "Lewis Brown")

    ;; url
    ("8uxl" "http://lewisbrown.com/")

    ;; emacs regex
    ("8d" "\\([0-9]+?\\)")
    ("8str" "\\([^\"]+?\\)\"")

    ;; shell commands
    ;("8ditto" "ditto -ck --sequesterRsrc --keepParent src dest")
    ;("8im" "convert -quality 85% ")

    ;("8f0" "find . -type f -size 0 -exec rm {} ';'")
    ;("8rsync" "rsync -z -r -v -t --exclude=\"*~\" --exclude=\".DS_Store\" --exclude=\".bash_history\" --exclude=\"**/xx_xahlee_info/*\"  --exclude=\"*/_curves_robert_yates/*.png\" --exclude=\"logs/*\"  --exclude=\"xlogs/*\" --delete --rsh=\"ssh -l xah\" ~/web/ xah@example.com:~/")
    ))

(provide 'abbrev-config)
