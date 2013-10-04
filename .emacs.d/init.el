(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

;; カラム番号を表示
(column-number-mode t)

;; タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")

;; タブ関連
(setq-default c-basic-offset 4     
              tab-width 4          
              indent-tabs-mode nil)  

;; 対応するカッコの強調表示
(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "blue")

;; C-hをバックスペースに
(keyboard-translate ?\C-h ?\C-?)

;; C-kで行全体を削除
(setq kill-whole-line t)

;; "C-t"でウィンドウ切り替え
(define-key global-map (kbd "C-t") 'other-window)

;; ファイルが#!から始まるファイルを+xをつけて保存"
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; emacs-lisp-modeのフック
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (when (require 'eldoc nil t)
              (setq eldoc-idle-delay 0.2)
              (setq eldoc-echo-area-use-multiline-p t)
              (turn-on-eldoc-mode))))

;; c, c++等のフック
(add-hook 'c-mode-common-hook
          '(lambda ()
             (setq tab-width 4)
             (c-toggle-hungry-state t)
             (c-toggle-electric-state t)
             ))

;; undo-treeの設定
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

;; undohistも
(when (require 'undohist nil t)
  (undohist-initialize))

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

;; Anything
(when (require 'anything nil t)
  (setq
   anything-idle-delay 0.3
   anything-candidate-number 100
   anything-quick-update t
   anything-enable-shortcuts 'alphabet)
  
  (when (require 'anything-config nil t)
    (setq anything-su-or-sudo "sudo")
    (add-to-list 'anything-sources 'anything-c-source-emacs-commands))
  
  (require 'anything-match-plugin nil t)
  
  (when (require 'anything-complete nil t)
    (anything-lisp-complete-symbol-set-timer 150))

  (require 'anything-show-completion nil t))
   
(define-key global-map (kbd "C-;") 'anything)

;; wdired
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; eggの設定
(when (executable-find "git")
  (when (require 'egg nil t)
    (define-key global-map (kbd "C-x v s") 'egg-status)
    (define-key global-map (kbd "C-x v l") 'egg-log)
    ))
