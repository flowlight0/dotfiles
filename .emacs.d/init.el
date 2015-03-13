(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

;; package.el
(when (require 'package nil t)
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/"))
  (add-to-list 'package-archives
               '("ELPA" . "http://tromey.com/elpa/"))
  (package-initialize))

;; カラム番号を表示
(column-number-mode t)
;; タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")

;; タブ関連
(setq-default c-basic-offset 2
              tab-width 2
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
             (when (require 'c-eldoc nil t)
               (set (make-local-variable 'eldoc-idle-delay) 0.20)
               (c-turn-on-eldoc-mode)
               )))

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


(when (require 'flymake nil t)
  (defun flymake-cc-no-makefile-init ()
    (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                         'flymake-create-temp-inplace))
           (local-file  (file-relative-name
                         temp-file
                         (file-name-directory buffer-file-name))))
      (message "There is no Makfile")
      (list "g++" (list "-Wall" "-std=c++11" "-Wextra" "-fsyntax-only" local-file))))
  
  (defun flymake-cc-init ()
    (if (or (file-exists-p "Makefile" ) (file-exists-p "../Makefile"))
        (flymake-simple-make-init)
      (flymake-cc-no-makefile-init)))
  
  (push '("\\.[ch]pp$" flymake-cc-init) flymake-allowed-file-name-masks)
  (push '("\\.cc$" flymake-cc-init) flymake-allowed-file-name-masks)
  
  (add-hook 'c++-mode-hook
            '(lambda ()
               (flymake-mode t))))

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

(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq YaTeX-kanji-code 4)


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TypeRex configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Loading TypeRex mode for OCaml files
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . typerex-mode))
(add-to-list 'interpreter-mode-alist '("ocamlrun" . typerex-mode))
(add-to-list 'interpreter-mode-alist '("ocaml" . typerex-mode))
(autoload 'typerex-mode "typerex" "Major mode for editing Caml code" t)

;; TypeRex mode configuration
(setq ocp-server-command "/usr/local/bin/ocp-wizard")
(setq-default indent-tabs-mode nil)

;; Uncomment to enable typerex command menu by right click
;;(setq ocp-menu-trigger [mouse-3])

;; Uncomment to make new syntax coloring look almost like Tuareg
;; (setq ocp-theme "tuareg_like")
;; Uncomment to disable new syntax coloring and use Tuareg one
;;(setq ocp-theme "tuareg")
;; Uncomment to disable syntax coloring completely
;;(setq ocp-syntax-coloring nil)

;; TypeRex currently uses the Tuareg indentation mechanism. To get a result
;; closer to the OCaml programming guidelines described at
;; http://caml.inria.fr/resources/doc/guides/guidelines.en.html
;; Some users prefer to indent slightly less, as
;;(setq typerex-let-always-indent nil)
;;(setq typerex-with-indent 0)
;;(setq typerex-function-indent 0)
;;(setq typerex-fun-indent 0)
;; Another reasonable choice regarding if-then-else is:
;;(setq typerex-if-then-else-indent 0)

;;;; Auto completion (experimental)
;;;; Don't use M-x invert-face default with auto-complete! (emacs -r is OK)
;;(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/auto-complete-mode")
;;(setq ocp-auto-complete t)

;;;; Using <`> to complete whatever the context, and <C-`> for `
;;(setq auto-complete-keys 'ac-keys-backquote-backslash)
;;;; Options: nil (default), 'ac-keys-default-start-with-c-tab, 'ac-keys-two-dollar
;;;; Note: this overrides individual auto-complete key settings

;;;; I want immediate menu pop-up
;;(setq ac-auto-show-menu 0.)
;;;; Short delay before showing help
;;(setq ac-quick-help-delay 0.3)
;;;; Number of characters required to start (nil to disable)
;;(setq ac-auto-start 0)

;;;; Uncomment to enable auto complete mode globally (independently of OCaml)
;;(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "/usr/local/share/emacs/site-lisp/auto-complete-mode/ac-dict")
;;(ac-config-default)

;; For debugging only
;;;;(setq ocp-debug t)
;;;;(setq ocp-profile t)
;;;;(setq ocp-dont-catch-errors t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; End of TypeRex configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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
