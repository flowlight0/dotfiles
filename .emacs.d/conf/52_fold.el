(when (require 'fold-dwim nil t)
  (require 'hideshow nil t)
  
  (define-key global-map (kbd "C-,") 'fold-dwim-toggle)
  
  ;; 機能を利用するメジャーモード一覧  
  (let ((hook))
    (dolist (hook
             '(emacs-lisp-mode-hook
               c-mode-common-hook
               python-mode-hook))
      (add-hook hook 'hs-minor-mode))))
