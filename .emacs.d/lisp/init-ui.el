;;; init-ui.el --- UI defaults -*- lexical-binding: t; -*-

;;; Commentary:
;; Prefer built-in, low-maintenance UI features.

;;; Code:

(defalias 'yes-or-no-p 'y-or-n-p)

(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(setq inhibit-startup-screen t)
(setq initial-scratch-message "")
(setq ring-bell-function 'ignore)
(setq frame-title-format "%f")

(global-hl-line-mode 1)
(column-number-mode 1)
(line-number-mode 1)
(size-indication-mode 1)

(setq-default tab-width 4
              indent-tabs-mode nil
              truncate-lines nil)

(setq show-paren-delay 0)
(show-paren-mode 1)
(setq show-paren-style 'parenthesis)

(load-theme 'modus-operandi t)

(use-package which-key
  :defer 1
  :config
  (setq which-key-idle-delay 0.5)
  (which-key-mode 1))

(provide 'init-ui)
;;; init-ui.el ends here
