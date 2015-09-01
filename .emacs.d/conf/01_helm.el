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
(define-key isearch-mode-map (kbd "C-o") 'helm-occur-from-isearch)

;; (el-get-bundle moccur-edit)

(el-get-bundle helm-gtags)
(require 'helm-gtags)

;; http://blog.10rane.com/2014/09/17/to-reading-comprehension-of-the-source-code-by-introducing-the-helm-gtags-mode/ より
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             ;;入力されたタグの定義元へジャンプ
             (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
             
             ;;入力タグを参照する場所へジャンプ
             (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)  
             
             ;;入力したシンボルを参照する場所へジャンプ
             (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)

             ;;タグ一覧からタグを選択し, その定義元にジャンプする
             (local-set-key (kbd "M-l") 'helm-gtags-select)))
             
(add-hook 'c++-mode-hook 'helm-gtags-mode)
