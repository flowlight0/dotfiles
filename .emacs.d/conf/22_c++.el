;; Makefileがないときのためのflymake
(when (require 'flymake nil t)
  (defun flymake-cc-no-makefile-init ()
    (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                         'flymake-create-temp-inplace))
           (local-file  (file-relative-name
                         temp-file
                         (file-name-directory buffer-file-name))))
      (message "There is no Makfile")
      (list "g++" (list "-Wall" "-std=c++11" "-Wextra" "-fsyntax-only" local-file))))
  
  (defun flymake-cc-init ()
    (if (or (file-exists-p "Makefile" ) (file-exists-p "../Makefile"))
        (flymake-simple-make-init)
      (flymake-cc-no-makefile-init)))
  
  (push '("\\.[ch]pp$" flymake-cc-init) flymake-allowed-file-name-masks)
  (push '("\\.cc$" flymake-cc-init) flymake-allowed-file-name-masks)
  
  (add-hook 'c++-mode-hook
            '(lambda ()
               (flymake-mode t))))

