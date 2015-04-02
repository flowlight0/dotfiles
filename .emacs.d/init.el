(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(el-get-bundle init-loader)
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")
<<<<<<< HEAD

(require 'cask)
(require 'pallet)

(cask-initialize)
=======
>>>>>>> db536122146874807653881dacc636c937e71256
