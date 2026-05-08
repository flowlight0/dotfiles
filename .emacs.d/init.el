;;; init.el --- Lightweight modern Emacs setup -*- lexical-binding: t; -*-

;;; Commentary:
;; This configuration is optimized for everyday editing, file navigation,
;; search, Org/Markdown notes, and small dotfiles maintenance rather than
;; language-specific IDE features.

;;; Code:

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "lisp"))

(require 'init-package)
(require 'init-ui)
(require 'init-keybindings)
(require 'init-completion)
(require 'init-editing)
(require 'init-files)
(require 'init-org)
(require 'init-git)

(provide 'init)
;;; init.el ends here
