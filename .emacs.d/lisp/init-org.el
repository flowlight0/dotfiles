;;; init-org.el --- Org defaults -*- lexical-binding: t; -*-

;;; Commentary:
;; Minimal Org setup for notes and agenda without hard-coding a private workflow.

;;; Code:

(use-package org
  :ensure nil
  :mode ("\\.org\\'" . org-mode)
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c c" . org-capture))
  :hook ((org-mode . visual-line-mode)
         (org-mode . org-indent-mode))
  :custom
  (org-startup-folded 'content)
  (org-hide-emphasis-markers t)
  (org-log-done 'time))

(when (file-directory-p "~/org")
  (setq org-directory (expand-file-name "~/org")))

(provide 'init-org)
;;; init-org.el ends here
