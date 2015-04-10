;; (load-file "../elisp/graphviz-dot-mode.el") 
;; (add-to-list 'auto-mode-alist '("\\.org$" . graphiz-dot-mode))

;; 現在の行をハイライト
(global-hl-line-mode t)

;; <<<<<<< HEAD
;; (global-linum-mode)
;; =======
;; (tool-bar-mode -1)
;; (scroll-bar-mode -1)
(defalias 'yes-or-no-p 'y-or-n-p)


;; 表示ファイル名が重なった時ディレクトリまで表示する
(when (require 'uniquify)
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets))

;; カラム番号を表示
(column-number-mode t)
;; タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")

;; タブ関連
(setq-default tab-width 4
              indent-tabs-mode nil)

;; 対応するカッコの強調表示

;; (when (require 'color-theme-solarized nil t)
;;   (color-theme-solarized-dark))

(el-get-bundle moe-theme)
;; (when (require 'moe-theme)
;;   (moe-dark))
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
(el-get-bundle undo-tree)
(when (require 'undo-tree)
  (global-undo-tree-mode))

;; undohistも
(el-get-bundle undohist)
(when (require 'undohist nil t)
  (undohist-initialize))

;; point-undo
;; (el-get-bundle point-undo)
;; (when (require 'point-undo)
;;   (define-key global-map [f7] 'point-undo)
;;   (define-key global-map [S-f7] 'point-redo))

;; auto-completeの設定
(el-get-bundle auto-complete)
(el-get-bundle auto-complete+)
(el-get-bundle auto-complete-c-headers)
(when (require 'auto-complete-config)
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
(el-get-bundle egg)
(when (executable-find "git")
  (when (require 'egg)
    (define-key global-map (kbd "C-x v s") 'egg-status)
    (define-key global-map (kbd "C-x v l") 'egg-log)
    (define-key global-map (kbd "C-x v d") 'egg-file-diff)
    ))


;; backup-file
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
;; auto-save-file
(setq auto-save-file-name-transforms
      `((".*", temporary-file-directory)))


(el-get-bundle git-gutter)
(when (require 'git-gutter)
  (global-git-gutter-mode 1))

;; 見かけの行でカーソルを移動
;; (el-get-bundle screen-lines)
;; (when (require 'screen-lines)
;;   (add-hook 'text-mode-hook 'turn-on-screen-lines-mode))


(el-get-bundle tempbuf)
(when (require 'tempbuf)
  (add-hook 'find-file-hooks 'turn-on-tempbuf-mode)
  (add-hook 'dired-mode-hook 'turn-on-tempbuf-mode))

;; (el-get-bundle shell-history)
;; (when (require 'shell-history)
;;   (add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt))

;; (el-get-bundle open-junk-file)
;; (require 'open-junk-file)

(el-get-bundle elscreen)
(when (require 'elscreen)
  ;;; プレフィクスキーはC-z
  (setq elscreen-prefix-key (kbd "C-z"))
  (elscreen-start)
;;; タブの先頭に[X]を表示しない
  (setq elscreen-tab-display-kill-screen nil)
;;; header-lineの先頭に[<->]を表示しない
  (setq elscreen-tab-display-control nil)
;;; バッファ名・モード名からタブに表示させる内容を決定する(デフォルト設定)
  (setq elscreen-buffer-to-nickname-alist
        '(("^dired-mode$" .
           (lambda ()
             (format "Dired(%s)" dired-directory)))
          ("^Info-mode$" .
           (lambda ()
             (format "Info(%s)" (file-name-nondirectory Info-current-file))))
          ("^mew-draft-mode$" .
           (lambda ()
             (format "Mew(%s)" (buffer-name (current-buffer)))))
          ("^mew-" . "Mew")
          ("^irchat-" . "IRChat")
          ("^liece-" . "Liece")
          ("^lookup-" . "Lookup")))
  (setq elscreen-mode-to-nickname-alist
        '(("[Ss]hell" . "shell")
          ("compilation" . "compile")
          ("-telnet" . "telnet")
          ("dict" . "OnlineDict")
          ("*WL:Message*" . "Wanderlust"))))



