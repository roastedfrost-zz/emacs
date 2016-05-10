;; Plugins to install
;; - dired+
;; - flymake-jshint
;; - js2-mode
;; - company
;; - projectile
;; - helm
;; - helm-core

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

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(load-library "hideshow")
(global-set-key (kbd "M-\\") 'hs-toggle-hiding)
;; hooks
(add-hook 'js2-mode-hook 'hs-minor-mode)
(add-hook 'js2-mode-hook 'flymake-mode)
(add-hook 'js2-mode-hook 'flymake-jshint-load)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'global-hi-lock-mode)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(helm-mode nil)
 '(initial-scratch-message
   ";; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

")
 '(org-CUA-compatible nil)
 '(org-special-ctrl-a/e nil)
 '(org-support-shift-select nil)
 '(recentf-menu-before "Open File...")
 '(scroll-error-top-bottom nil)
 '(set-mark-command-repeat-pop nil)
 '(shift-select-mode t)
 '(indent-tabs-mode nil)
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(projectile-global-mode)
(add-to-list 'projectile-globally-ignored-directories "node_modules")
(helm-projectile-on)

(put 'narrow-to-region 'disabled nil)
(global-set-key (kbd "M-x") 'helm-M-x)

;; aliases
(defalias 'yes-or-no-p 'y-or-n-p) ; y or n is enough
(defalias 'list-buffers 'ibuffer) ; always use ibuffer
