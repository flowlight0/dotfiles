;;; init-git.el --- Git integration -*- lexical-binding: t; -*-

;;; Commentary:
;; Lightweight Git conveniences for dotfiles and general text editing.

;;; Code:

(use-package magit
  :bind (("C-x g" . magit-status)))

(use-package diff-hl
  :hook ((after-init . global-diff-hl-mode)
         (dired-mode . diff-hl-dired-mode))
  :config
  (diff-hl-flydiff-mode 1))

(provide 'init-git)
;;; init-git.el ends here
