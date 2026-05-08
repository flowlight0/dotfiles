;;; early-init.el --- Early startup tweaks -*- lexical-binding: t; -*-

;;; Commentary:
;; Keep startup lean and avoid work before init.el has configured packages.

;;; Code:

(setq package-enable-at-startup nil)
(setq inhibit-startup-screen t)
(setq frame-inhibit-implied-resize t)
(setq native-comp-async-report-warnings-errors 'silent)

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 64 1024 1024)
                  gc-cons-percentage 0.1)))

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars . nil) default-frame-alist)

;;; early-init.el ends here
