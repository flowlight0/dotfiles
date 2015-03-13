;; c, c++等のフック
(add-hook 'c-mode-common-hook
          '(lambda ()
             (setq tab-width 2)
             (c-toggle-hungry-state t)
             (c-toggle-electric-state t)
             (when (require 'c-eldoc nil t)
               (setq eldoc-idle-delay 0.05)
               (setq eldoc-echo-area-use-multiline-p t)
               (c-turn-on-eldoc-mode))))


