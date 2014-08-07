(when (require 'helm-config nil t)
  ;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (helm-mode t)
  
  (require 'helm-c-yasnippet)
  (global-set-key (kbd "C-c y") 'helm-c-yas-complete)
  )

