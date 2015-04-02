
(el-get-bundle yasnippet)
(when (require 'yasnippet)
  (setq yas-snippet-dirs
        '("~/.emacs.d/el-get/yasnippet/snippets"
          ))
  ;; yas起動
  (yas-global-mode 1))
