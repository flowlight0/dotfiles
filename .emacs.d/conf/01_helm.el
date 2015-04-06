(el-get-bundle helm)
(require 'helm-config nil t)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
(helm-mode t)
(define-key global-map (kbd "C-x b") 'helm-for-files)

(el-get-bundle helm-c-yasnippet)
(require 'helm-c-yasnippet)
(global-set-key (kbd "C-c y") 'helm-c-yas-complete)


;; (el-get-bundle helm-c-moccur)
;; (require 'helm-c-moccur)
(global-set-key (kbd "C-M-o") 'helm-occur)

;; (el-get-bundle moccur-edit)


