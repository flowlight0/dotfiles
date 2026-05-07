(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

;; 古い el-get のレシピには git://github.com/... を使うものがあり、
;; 現在の環境やプロキシ配下では失敗しやすい。Emacs から起動した git
;; だけに HTTPS への置き換えを適用して、プラグインの取得を安定させる。
(let* ((count (string-to-number (or (getenv "GIT_CONFIG_COUNT") "0")))
       (key-var (format "GIT_CONFIG_KEY_%d" count))
       (value-var (format "GIT_CONFIG_VALUE_%d" count)))
  (setenv key-var "url.https://github.com/.insteadOf")
  (setenv value-var "git://github.com/")
  (setenv "GIT_CONFIG_COUNT" (number-to-string (1+ count))))

(setq el-get-github-default-url-type 'https)
(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(setq el-get-github-default-url-type 'https)
(el-get 'sync)
(el-get-bundle init-loader)
(require 'init-loader)
(init-loader-load (locate-user-emacs-file "conf"))
