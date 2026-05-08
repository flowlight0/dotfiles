;;; init-editing.el --- Editing conveniences -*- lexical-binding: t; -*-

;;; Commentary:
;; Small, general-purpose editing defaults without language-specific IDE setup.

;;; Code:

(setq kill-whole-line t)
(delete-selection-mode 1)
(electric-pair-mode 1)
(save-place-mode 1)
(winner-mode 1)
(repeat-mode 1)

(setq require-final-newline t)
(setq sentence-end-double-space nil)

(add-hook 'before-save-hook #'delete-trailing-whitespace)
(add-hook 'after-save-hook #'executable-make-buffer-file-executable-if-script-p)

(setq backup-directory-alist `(("." . ,(locate-user-emacs-file "var/backups/"))))
(setq auto-save-file-name-transforms `((".*" ,(locate-user-emacs-file "var/auto-save/") t)))
(setq auto-save-list-file-prefix (locate-user-emacs-file "var/auto-save-list/.saves-"))
(make-directory (locate-user-emacs-file "var/backups/") t)
(make-directory (locate-user-emacs-file "var/auto-save/") t)
(make-directory (locate-user-emacs-file "var/auto-save-list/") t)

(use-package yasnippet
  :defer 1
  :config
  (setq yas-snippet-dirs (list (locate-user-emacs-file "snippets")))
  (yas-global-mode 1))

(provide 'init-editing)
;;; init-editing.el ends here
