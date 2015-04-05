(el-get-bundle helm)
(require 'helm-config nil t)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
(helm-mode t)
(define-key global-map (kbd "C-x b") 'helm-for-files)

(el-get-bundle helm-c-yasnippet)
(require 'helm-c-yasnippet)
(global-set-key (kbd "C-c y") 'helm-c-yas-complete)


(el-get-bundle helm-c-moccur)
(require 'helm-c-moccur)
(setq
 helm-c-moccur-helm-idle-delay 0.05
 helm-c-moccur-hilight-into-line-flag t
 helm-c-moccur-enable-auto-look-flag t
 helm-c-moccur-enable-initial-pattern t)
(global-set-key (kbd "C-M-o") 'helm-c-moccur-occur-by-moccur)

