;; emacs-lisp-modeのフック
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (when (require 'eldoc nil t)
              (setq eldoc-idle-delay 0.2)
              (setq eldoc-echo-area-use-multiline-p t)
              (turn-on-eldoc-mode))))


