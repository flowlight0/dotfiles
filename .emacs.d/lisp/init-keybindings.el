;;; init-keybindings.el --- Global key bindings -*- lexical-binding: t; -*-

;;; Commentary:
;; Preserve long-standing personal key choices while keeping help reachable.

;;; Code:

(keyboard-translate ?\C-h ?\C-?)
(global-set-key (kbd "<f1>") help-map)
(global-set-key (kbd "C-c h") help-map)

(global-set-key (kbd "C-t") #'other-window)
(global-set-key (kbd "C-c t") #'shell)
(global-set-key (kbd "RET") #'newline-and-indent)

(provide 'init-keybindings)
;;; init-keybindings.el ends here
