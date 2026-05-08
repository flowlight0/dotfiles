;;; init-files.el --- Files, Dired, and custom state -*- lexical-binding: t; -*-

;;; Commentary:
;; Keep file navigation comfortable without adding programming-language setup.

;;; Code:

(require 'uniquify)

(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq delete-by-moving-to-trash t)
(setq make-backup-files t)
(setq auto-save-default t)

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :custom
  (dired-dwim-target t)
  (dired-listing-switches "-alh")
  :hook (dired-mode . dired-hide-details-mode)
  :bind (:map dired-mode-map
              ("e" . wdired-change-to-wdired-mode)))

(use-package consult-dir
  :bind (("C-x C-d" . consult-dir)
         :map minibuffer-local-completion-map
         ("C-x C-d" . consult-dir)
         ("C-x C-j" . consult-dir-jump-file)))

(use-package markdown-mode
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(provide 'init-files)
;;; init-files.el ends here
