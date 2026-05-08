;;; init-package.el --- Package setup -*- lexical-binding: t; -*-

;;; Commentary:
;; Use Emacs' built-in package.el and use-package.  Emacs 29 or newer is
;; expected, so no external bootstrapper is required.

;;; Code:

(require 'package)
(require 'use-package)

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")))

(setq package-user-dir (locate-user-emacs-file "elpa"))
(package-initialize)

(setq use-package-always-ensure t)
(setq use-package-expand-minimally t)
(setq use-package-compute-statistics nil)

(unless package-archive-contents
  (package-refresh-contents))

(provide 'init-package)
;;; init-package.el ends here
