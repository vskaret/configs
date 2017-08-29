;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; ---------------------------------------
(require 'package)

(add-to-list 'package-archives
	     ;;'("melpa" . "http://melpa.org/packages/") t)
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)
(package-refresh-contents)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    elpy
    flycheck
    material-theme
    neotree
    calfw
    magit
    ;;py-autopep8))
    ;;sr-speedbar
    ))

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)

;; REQUIRES
;; --------------------------------------
;;(require 'sr-speedbar)
(require 'neotree)
(require 'calfw)


;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(setq dired-dwim-target t) ;; https://emacs.stackexchange.com/questions/5603/how-to-quickly-copy-move-file-in-emacs-dired
(setq tab-stop-list (number-sequence 4 120 4)) ;; std tab 4 spaces


;; PYTHON CONFIGFURATION (https://realpython.com/blog/python/emacs-the-best-python-editor/)
;; --------------------------------------
(elpy-enable) ;; enables elpy (python development)

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))


;; NEOTREE CONFIGURATION (https://www.emacswiki.org/emacs/NeoTree)
;; --------------------------------------
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)
;; (setq projectile-switch-project-action 'neotree-projectile-action)


;; HOTKEYS CONFIGURATION
;; --------------------------------------
;;(global-set-key (kbd "C-o")
;;		'vi-open-line-below)

;;(global-set-key (kbd "C-S-O")
;;		'vi-open-line)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; CALFW CONFIGURATION
;; --------------------------------------
(setq calendar-week-start-day 1)


;; FUNCTIONS
;; --------------------------------------
(defun vi-open-line-below ()
  "Insert a newline below the current line and put point at beginning."
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline-and-indent))

(defun vi-open-line (&optional abovep)
  "Insert a newline below the current line and put point at beginning.
With a prefix argument, insert a newline above the current line."
  (interactive "P")
  (if abovep
      (vi-open-line-above)
    (vi-open-line-below)))


;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (material-theme better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 90 :width normal)))))

