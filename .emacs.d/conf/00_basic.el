;; 現在の行をハイライト
(global-hl-line-mode t)

(tool-bar-mode -1)
(scroll-bar-mode -1)

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


(defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
  (setq flymake-check-was-interrupted t))
(ad-activate 'flymake-post-syntax-check)


;; backup-file
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
;; auto-save-file
(setq auto-save-file-name-transforms
      `((".*", temporary-file-directory)))


(global-git-gutter-mode 1)

;; 見かけの行でカーソルを移動
(require 'screen-lines)
(add-hook 'text-mode-hook 'turn-on-screen-lines-mode)


