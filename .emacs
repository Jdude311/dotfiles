
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;; code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes '(grandshell))
 '(custom-safe-themes
   '("6a0edb6b0f4c6d0566325cf91a1a34daa179e1979136ce0a528bf83aff9b7719" "e1d09f1b2afc2fed6feb1d672be5ec6ae61f84e058cb757689edb669be926896" "a06658a45f043cd95549d6845454ad1c1d6e24a99271676ae56157619952394a" "123a8dabd1a0eff6e0c48a03dc6fb2c5e03ebc7062ba531543dfbce587e86f2a" "3860a842e0bf585df9e5785e06d600a86e8b605e5cc0b74320dfe667bcbe816c" "1e875d1d6222c108036248beb64ff2bb58b9c74baf9229d84e112129e7e4c3fd" "4d2e8032057003c920598a791c38b8b43bc9df800662c13fb84b57d32620ace5" "4fded6685d946395ef015020b9b1f9ca97c204f7b0b24e31fc9a9a3c30e69d9c" "0fa26f70381252af5cbe7d6e55b6665cdab5e95fc88ed1ea0a7e50fce9e2e87f" "e21da8838cafdb0ff0a3d8d70d1a79c83c52e251603ad3d811421ac27744b333" "aeed3020ca5cc6bc822e6ff81c25332572f3216c98b7fc992b3b927cd18a8593" "b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" "aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" default))
 '(package-selected-packages
   '(org-bullets grandshell-theme auto-complete company-irony irony-eldoc flycheck gruvbox-theme ztree))
 '(pdf-view-midnight-colors '("#fdf4c1" . "#1d2021")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Input Mono Narrow" :foundry "FBI " :slant normal :weight normal :height 95 :width semi-condensed)))))

;; (package-initialize)
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\

Your version of Emacs does not support SSL connections,

which is unsafe because it allows man-in-the-middle attacks.

There are two things you can do about this warning:

1. Install an Emacs version that does support SSL and be safe.

2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )
;; (package-initialize)
(use-package flycheck
	     :ensure t
	     :init (global-flycheck-mode))

;(require 'org-bullets)
;(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'gruvbox t)
(add-hook 'after-init-hook #'global-flycheck-mode)
(package-initialize)
(ac-config-default)
(global-auto-complete-mode t)
(semantic-mode t)
(add-hook 'prog-mode-hook #'hs-minor-mode)
(global-set-key (kbd "C-c <right>") 'hs-show-block)
(global-set-key (kbd "C-c <left>") 'hs-hide-block)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(setq org-log-done t)
(setq org-agenda-files (list "~/org/school.org"))
(setq org-hide-emphasis-markers t)
(global-set-key (kbd "C-c s") 'org-sort-entries)
(global-set-key (kbd "C-c t") 'org-sparse-tree)

(setq org-todo-keywords '( (sequence "TODO" "WORKING" "POSTPONED"  "DONE") (sequence "QUIZ" "TEST" "ASSESSMENT")))
(setq org-todo-keyword-faces '(("TODO" . "red") ("WORKING" . "dark orange") ("POSTPONED" . "yellow") ("DONE" . "green") ("QUIZ" . "LightSalmon2") ("TEST" . "deep sky blue") ("ASSESSMENT" . "VioletRed3")))

(provide '.emacs)

;;; .emacs ends here
