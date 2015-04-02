;; ;; migemoの記述
;; ;; http://nya-0.hatenablog.com/entry/2014/06/07/190016 よりコピペ
;; (require 'migemo)
;; (setq migemo-command "/usr/bin/cmigemo")
;; ;; 上のパスには自分の環境でcmigemoをインストールしたときのパスを入力してください
;; (setq migemo-options '("-q" "--emacs"))
;; (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")
;; ;; こちらも、自分の環境のパスを入力してください
;; (setq migemo-user-dictionary nil)
;; (setq migemo-regex-dictionary nil)
;; (setq migemo-coding-system 'utf-8-unix)
;; (load-library "migemo")
;; (migemo-init)

;; ;; color-moccurの設定
;; (when (require 'color-moccur nil t)
;;   ;;M-oにoccur-by-moccurを割り当て
;;   (define-key global-map (kbd "M-o") 'occur-by-moccur)
;;   ;;スペース区切りでAND検索
;;   (setq moccur-split-word t)
;;   ;;Migemoを利用できる環境であればMigemoを使う
;;   (when (and (executable-find "/usr/bin/cmigemo") ;;このパスも、自分の環境に合わせて変更してください
;;              (require 'migemo nil t))
;;     (setq moccur-use-migemo t)))

;; ;; moccur-editの設定
;; (require 'moccur-edit nil t)

