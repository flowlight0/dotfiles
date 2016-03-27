(el-get-bundle dash)
(el-get-bundle pkg-info)
(el-get-bundle let-alist)
(el-get-bundle cl-lib)
(el-get-bundle flycheck/flycheck)
(el-get-bundle flycheck/flycheck-pos-tip)

(when (require 'flycheck)
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (require 'flycheck-pos-tip)

  (eval-after-load 'flycheck
    '(custom-set-variables
      '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
  (setq-default flycheck-clang-language-standard "c++11"
                flycheck-gcc-language-standard "c++11"))
(define-key flycheck-mode-map (kbd "C-x c") 'list-flycheck-errors)


;; (eval-after-load 'flycheck
;;   '(progn
;;      (require 'flycheck-google-cpplint)
;;      ;; Add Google C++ Style checker.
;;      ;; In default, syntax checked by Clang and Cppcheck.
;;      (flycheck-add-next-checker 'c/c++-cppcheck
;;                                 '(warning . c/c++-googlelint))))


;; (custom-set-variables
;;  '(flycheck-googlelint-verbose "3")
;;  '(flycheck-googlelint-filter "-whitespace,+whitespace/braces")
;;  '(flycheck-googlelint-root "project/src")
;;  '(flycheck-googlelint-linelength "120")
;;  '(flycheck-google-cpplint-command "~/.emacs.d/conf/cpplint.py"))


