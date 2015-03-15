;(require 'package)
(package-initialize)
;(setq package-archives '(
;			 ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-refresh-contents)
(defun install-if-needed (package)
  (unless (package-installed-p package)
    (package-install package)))

(setq to-install
      '(python-mode magit yasnippet auto-complete autopair find-file-in-repository flycheck))  
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers
(require 'auto-complete)
(global-auto-complete-mode t)
(ac-ropemacs-initialize)
(add-hook 'python-mode-hook
	  (lambda ()
	    (cond ((file-exists-p ".ropeproject")
		   (rope-open-project default-directory))
		  ((file-exists-p "../.ropeproject")
		   (rope-open-project (concat default-directory "..")))
		  )))
(require 'python-mode)
(setq-default py-shell-name "/usr/bin/ipython")
(setq-default py-ipython-command "/usr/bin/ipython")
(setq-default py-python-command "/usr/bin/python2.7")
(setq-default python-shell-interpreter "/usr/bin/python2.7")
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

(require 'pymacs)
;; Initialize Pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

(setenv "PYMACS_PYTHON" "python2.7")
;;;跳转到指定行
(global-set-key (kbd "C-c C-g") 'goto-line)
;;;; 关闭启动画面
(setq inhibit-startup-message t)

;(add-to-list 'load-path "~/.emacs.d/el-get/cl-lib")
;(require 'cl-lib)
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (flet ((process-list ())) ad-do-it))

(setq load-path
      (nconc '(
	       "~/.emcas.d/el-get/jdee/lisp"
	       )
	     load-path))

(autoload 'jde-mode "jde" "JDE mode" t)
(setq auto-mode-alist
              (append '(("\\.java\\'" . jde-mode)) auto-mode-alist))

(auto-insert-mode)  ;;; Adds hook to find-files-hook
(setq auto-insert-directory "~/.emacs.d/mytemplate/") ;;; Or use custom, *NOTE* Trailing slash important
(setq auto-insert-query nil) ;;; If you don’t want to be prompted before insertion

(setq auto-insert-alist
      (append '(
		(python-mode . "Template.py")
		)
	      auto-insert-alist))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(jde-jdk-registry (quote (("1.7" . "/usr/lib/jvm/java-1.7.0-openjdk-amd64")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
