;; 表示ファイル名が重なった時ディレクトリまで表示する
(when (require 'uniquify nil t)
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets))

;; カラム番号を表示
(column-number-mode t)
;; タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")

;; タブ関連
(setq-default tab-width 2
              indent-tabs-mode nil)

;; 対応するカッコの強調表示
(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "blue")

(keyboard-translate ?\C-h ?\C-?) ;; C-hをバックスペースに
(setq kill-whole-line t)         ;; C-kで行全体を削除
(define-key global-map (kbd "C-t") 'other-window) ;; "C-t"でウィンドウ切り替え

;; ファイルが#!から始まるファイルを+xをつけて保存"
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; undo-treeの設定
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

;; undohistも
(when (require 'undohist nil t)
  (undohist-initialize))

;; point-undo
(when (require 'point-undo nil t)
  (define-key global-map [f7] 'point-undo)
  (define-key global-map [S-f7] 'point-redo))

;; auto-completeの設定
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
               "~/.emacs.d/elisp/ac-dict")
  (ac-config-default))

;; cua-modeの設定
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; C-c tでシェル起動
(global-set-key (kbd "C-c t") '(lambda ()
                                 (interactive)
                                 (shell)))

;; 改行と同時にインデント
(global-set-key "\C-m" 'newline-and-indent)


;; eggの設定
(when (executable-find "git")
  (when (require 'egg nil t)
    (define-key global-map (kbd "C-x v s") 'egg-status)
    (define-key global-map (kbd "C-x v l") 'egg-log)
    (define-key global-map (kbd "C-x v d") 'egg-file-diff)
    ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-mode
;; http://d.hatena.ne.jp/tamura70/20100203/org
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-modeの初期化
(require 'org-install)
;; 拡張子がorgのファイルを開いた時，自動的にorg-modeにする
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; キーバインドの設定
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)
(define-key global-map "\C-cr" 'org-remember)

;; org-modeでの強調表示を可能にする
(add-hook 'org-mode-hook 'turn-on-font-lock)
;; 見出しの余分な*を消す
(setq org-hide-leading-stars t)
;; org-default-notes-fileのディレクトリ
(setq org-directory "~/org/")
;; org-default-notes-fileのファイル名
(setq org-default-notes-file "notes.org")

(setq org-tag-alist
      '(("OFFICE" . ?o)
        ("COMPUTER" . ?c)        
        ("HOME" . ?h)
        ("SHOPPING" . ?s)
        ("MAIL" . ?m)
        ("READING" . ?r)
        ("PROJECT" . ?p)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
  (setq flymake-check-was-interrupted t))
(ad-activate 'flymake-post-syntax-check)

(require 'yasnippet)
(yas--initialize)
(yas-global-mode t)
(yas/load-directory "~/.emacs.d/snippets")


(when (require 'helm-config nil t)
  ;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (helm-mode t)
  
  (require 'helm-c-yasnippet)
  (global-set-key (kbd "C-c y") 'helm-c-yas-complete)
  )


;; yatex-mode

;; (setq auto-mode-alist
;;       (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
;; (autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
;; (setq YaTeX-kanji-code 4)


;; backup-file
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
;; auto-save-file
(setq auto-save-file-name-transforms
      `((".*", temporary-file-directory)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flyspell-default-dictionary "american"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
