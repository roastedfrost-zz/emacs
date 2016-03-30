;; Plugins to install
;; - ergoemacs-mode
;; - dired+
;; - flymake-jshint
;; - js2-mode
;; - company
;; - projectile

;; Additional software
;; - cygwin
;; - aspell
;; - jshint


(setenv "PATH"
 (concat
  "C:/cygwin64/usr/local/bin" ";"
  "C:/cygwin64/bin" ";"
  (getenv "PATH"))
 )

(setq-default ispell-program-name "aspell")
(let ((default-directory "~/.emacs.d/elpa/")) (normal-top-level-add-subdirs-to-load-path))

(require 'package)
(require 'flymake-jshint)
(require 'ergoemacs-mode)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(load-library "hideshow")
(global-set-key (kbd "M-\\") 'hs-toggle-hiding)
(add-hook 'js2-mode-hook 'hs-minor-mode)
(add-hook 'js2-mode-hook 'flymake-mode)
(add-hook 'js2-mode-hook 'flymake-jshint-load)
(add-hook 'after-init-hook 'global-company-mode)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(ergoemacs-ctl-c-or-ctl-x-delay 0.2)
 '(ergoemacs-handle-ctl-c-or-ctl-x (quote both))
 '(ergoemacs-ini-mode t)
 '(ergoemacs-keyboard-layout "us")
 '(ergoemacs-mode nil)
 '(ergoemacs-smart-paste nil)
 '(ergoemacs-theme "standard")
 '(ergoemacs-theme-options (quote ((no-backspace on) (guru on))))
 '(ergoemacs-use-menus t)
 '(initial-scratch-message
   ";; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

")
 '(scroll-error-top-bottom nil)
 '(set-mark-command-repeat-pop nil)
 '(shift-select-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(ergoemacs-mode 1)
(projectile-global-mode)
