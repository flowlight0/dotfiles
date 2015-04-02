(require 'helm)
(require 'helm-gtags)

(when (require 'helm-config nil t)
  ;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (helm-mode t)
  (define-key global-map (kbd "C-x b") 'helm-for-files)
  (require 'helm-c-yasnippet)
  (global-set-key (kbd "C-c y") 'helm-c-yas-complete)
  )

