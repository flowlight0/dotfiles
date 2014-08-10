'(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
'(require 'flycheck-pos-tip)
(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

(setq flycheck-clang-language-standard "c++11")
