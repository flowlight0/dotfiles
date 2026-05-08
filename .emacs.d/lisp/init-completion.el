;;; init-completion.el --- Minibuffer completion and search -*- lexical-binding: t; -*-

;;; Commentary:
;; A modern Helm/Anything-like workflow built from small completing-read tools.

;;; Code:

(savehist-mode 1)
(setq history-length 200)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))

(recentf-mode 1)
(setq recentf-max-saved-items 200)
(setq recentf-exclude '("/tmp/" "/ssh:" "/sudo:"))

(use-package vertico
  :init
  (vertico-mode 1)
  :config
  (setq vertico-cycle t))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :after vertico
  :init
  (marginalia-mode 1))

(use-package consult
  :bind (("C-x b" . consult-buffer)
         ("C-s" . consult-line)
         ("M-y" . consult-yank-pop)
         ("C-c s" . consult-ripgrep)
         ("C-c f" . consult-find)
         ("C-c i" . consult-imenu)
         ("C-c m" . consult-mark))
  :config
  (setq consult-preview-key '(:debounce 0.2 any)))

(use-package embark
  :bind (("C-." . embark-act)
         ("C-;" . embark-dwim)
         ("C-h B" . embark-bindings))
  :init
  (setq prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult
  :after (embark consult)
  :hook (embark-collect-mode . consult-preview-at-point-mode))

(provide 'init-completion)
;;; init-completion.el ends here
