;; c, c++等のフック
(add-hook 'c-mode-common-hook
          '(lambda ()
             (setq tab-width 2)
             (c-toggle-hungry-state t)
             (c-toggle-electric-state t)
             ))

