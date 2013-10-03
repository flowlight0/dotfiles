(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

;; カラム番号を表示
(column-number-mode t)

;; タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")

;; タブ関連
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; 対応するカッコの強調表示
(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "blue")

;; C-hをバックスペースに
(keyboard-translate ?\C-h ?\C-?)

;; "C-t"でウィンドウ切り替え
(define-key global-map (kbd "C-t") 'other-window)

;; ファイルが#!から始まるファイルを+xをつけて保存"
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; emacs-lisp-modeのフック
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (when (require 'eldoc nil t)
               (setq eldoc-idle-delay 0.2)
               (setq eldoc-echo-area-use-multiline-p t)
               (turn-on-eldoc-mode))))

;; undo-treeの設定
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

;; auto-completeの設定
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
               "~/.emacs.d/elisp/ac-dict")
  (ac-config-default))

;; cua-modeの設定
(cua-mode t)
(setq cua-enable-cua-keys nil)


