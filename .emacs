(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'load-path "~/.emacs.d/customPrograms/")
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.

					;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(require 'use-package)
(require 'bind-key)
(require 'smooth-scrolling)
(require 'org-id)
(require 'org-variable-pitch)
(require 'org)
(require 'flyspell)
(require 'org-super-agenda)
(require 'helm-org-rifle)
(require 'flyspell-correct)
(require 'helm)
(require 'powerline)
(require 'org-super-links)
(require 'org-bullets)
(require 'pdf-tools)
(require 'company)
(require 'project)
(require 'which-key)
(require 'ccls)
(use-package lsp-mode
  :config
  (setq lsp-idle-delay 0.5
        lsp-enable-symbol-highlighting t
        lsp-enable-snippet nil)  ;; Not supported by company capf, which is the recommended company backend
  (lsp-register-custom-settings
   '(("pyls.plugins.pyls_mypy.enabled" t t)
     ("pyls.plugins.pyls_mypy.live_mode" nil t)
     ("pyls.plugins.pyls_black.enabled" t t)
     ("pyls.plugins.pyls_isort.enabled" t t)

     ;; Disable these as they're duplicated by flake8
     ("pyls.plugins.pycodestyle.enabled" nil t)
     ("pyls.plugins.mccabe.enabled" nil t)
     ("pyls.plugins.pyflakes.enabled" nil t)))
  :hook
  ((prog-mode . lsp)
   (lsp-mode . lsp-enable-which-key-integration)))
(use-package lsp-ui
  :config (setq lsp-ui-sideline-show-hover t
                lsp-ui-sideline-delay 0.5
                lsp-ui-doc-delay 5
                lsp-ui-sideline-ignore-duplicates t
                lsp-ui-doc-position 'bottom
                lsp-ui-doc-alignment 'frame
                lsp-ui-doc-header nil
                lsp-ui-doc-include-signature t
                lsp-ui-doc-use-childframe t)
  :commands lsp-ui-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3c3836" "#fb4934" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#ebdbb2"])
 '(cursor-type 'bar)
 '(custom-enabled-themes '(monokai))
 '(custom-safe-themes
   '("d9646b131c4aa37f01f909fbdd5a9099389518eb68f25277ed19ba99adeb7279" "bc7627a5d14001acb3237151df7ccb413b57e4a820295ec24562c132efcacb2e" "b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" default))
 '(display-line-numbers nil)
 '(doc-view-resolution 100)
 '(eglot-autoshutdown t)
 '(global-semantic-highlight-func-mode nil)
 '(helm-mode t)
 '(helm-org-rifle-close-unopened-file-buffers nil)
 '(helm-org-rifle-fontify-headings t)
 '(helm-org-rifle-reverse-paths t)
 '(image-auto-resize 'fit-width)
 '(inhibit-startup-screen t)
 '(ivy-mode t)
 '(left-margin 5)
 '(line-spacing 0.1)
 '(movement-global-mode t)
 '(nil nil t)
 '(org-agenda-custom-commands
   '(("g" "Good agenda"
      ((agenda ""
	       ((org-agenda-overriding-header "Agenda and Tonight's Homework")
		(org-super-agenda-groups
		 '((:time-grid t)
		   (:name "OVERDUE" :discard
			  (:todo "SOMEDAY")
			  :deadline past :order 1)
		   (:name "Today's Schedule" :time-grid t :order 2)
		   (:name "Meetings" :tag "meeting" :order 2)
		   (:name "Tests and Quizzes" :tag
			  ("test" "quiz" "assessment" "conference")
			  :order 3)
		   (:name "Tonight's Homework" :and
			  (:tag "school" :tag "homework" :deadline today)
			  :and
			  (:tag "school" :tag "project" :deadline today)
			  :order 5)
		   (:name "Upcoming Homework" :and
			  (:tag "school" :tag "homework" :deadline future)
			  :and
			  (:tag "school" :children t :deadline future)
			  :order 6)
		   (:name "Emails" :tag "email" :order 7)))))
       (alltodo ""
		((org-agenda-overriding-header "PROJECTS")
		 (org-super-agenda-groups
		  '((:auto-parent t)
		    (:discard
		     (:anything))))))
       (alltodo ""
		((org-agenda-overriding-header "Other")
		 (org-super-agenda-groups
		  '((:name "Bucket List" :and
			   (:todo "SOMEDAY" :tag "PERSONAL")
			   :order 1)
		    (:name "Someday Maybe" :todo "SOMEDAY" :order 10)
		    (:name "Everything Else" :anything t :order 20))))))
      nil nil)
     ("n" "Agenda and all TODOs"
      ((agenda "" nil)
       (alltodo "" nil))
      nil)))
 '(org-agenda-files
   '("~/Documents/School/Apocalypse-2021_School_Year/Science_Research/classNotes.org" "~/Documents/School/Apocalypse-2021_School_Year/English/ofMiceAndMenNotes.org" "~/Documents/School/Apocalypse-2021_School_Year/Science_Research/sqlInjection.org" "~/Documents/School/Apocalypse-2021_School_Year/USHistory/classNotes.org" "~/Documents/School/Apocalypse-2021_School_Year/English/classNotes.org" "~/Documents/personal.org" "~/Documents/School/Apocalypse-2021_School_Year/DriversED/classNotes.org" "~/Documents/School/Apocalypse-2021_School_Year/Spanish/classNotes.org" "~/org/todo.org"))
 '(org-agenda-include-diary t)
 '(org-agenda-prefix-format
   '((agenda . " %i %-12:c%?-8t% s %-6e")
     (todo . " %i %-12:c %-6e ")
     (tags . " %i %-12:c %-6e")))
 '(org-agenda-skip-scheduled-if-deadline-is-shown 'not-today)
 '(org-agenda-span 'day)
 '(org-bullets-bullet-list '("⚫"))
 '(org-capture-templates
   '(("n" "Quick note" entry
      (file+headline "~/Documents/personal.org" "Quick Notes")
      "* %^{Headline}
  ENTERED: %U
" :prepend t)
     ("a" "Test/Assessment/Quiz " entry
      (file "~/org/todo.org")
      "* %^{Test Name} :school:%^{Tags}:
  DEADLINE: %^{Deadline}t ENTERED: %U" :prepend t :time-prompt t)
     ("P" "Project TODO" entry
      (file "~/org/todo.org")
      "* TODO %^{Project name} [/] :project:%^{Tags}:
  DEADLINE: %^{Deadline}t ENTERED: %U" :prepend t :time-prompt t)
     ("e" "Email TODO" entry
      (file "~/org/todo.org")
      "* TODO %^{Task} :email:%^{Tags}:
  DEADLINE: %^{Deadline}t ENTERED: %U" :prepend t :time-prompt t)
     ("m" "Meeting entry" entry
      (file "~/org/todo.org")
      "* %^{prompt} :meeting:%^{tags}:
  DEADLINE: %^{Deadline}T ENTERED: %U" :prepend t :time-prompt t)
     ("h" "Homework entry" entry
      (file "~/org/todo.org")
      "* TODO %^{prompt}    :school:homework:
  DEADLINE: %^{Deadline}t ENTERED %U
  :PROPERTIES:
  :EFFORT: %^{Effort}
  :END:" :prepend t :time-prompt t)))
 '(org-directory "~/Documents/")
 '(org-format-latex-options
   '(:foreground default :background default :scale 1.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-hide-emphasis-markers t)
 '(org-highlight-latex-and-related nil)
 '(org-id-link-to-org-use-id t)
 '(org-image-actual-width 500)
 '(org-list-demote-modify-bullet '(("+" . "-") ("1)" . "1.")))
 '(org-mode-hook
   '(org-latex-preview visual-line-mode org-indent-mode
		       (lambda nil
			 (org-bullets-mode 1))
		       org-variable-pitch-minor-mode flyspell-mode
		       #[0 "\301\211\207"
			   [imenu-create-index-function org-imenu-get-tree]
			   2]
		       #[0 "\300\301\302\303\304$\207"
			   [add-hook change-major-mode-hook org-show-all append local]
			   5]
		       #[0 "\300\301\302\303\304$\207"
			   [add-hook change-major-mode-hook org-babel-show-result-all append local]
			   5]
		       org-babel-result-hide-spec org-babel-hide-all-hashes))
 '(org-super-agenda-mode t)
 '(org-todo-keywords
   '((sequence "TODO" "NEXT" "STARTED" "ET" "POSTPONED" "DONE")))
 '(package-selected-packages
   '(ivy smooth-scroll writeroom-mode zzz-to-char which-key use-package typing smooth-scrolling request-deferred quelpa project powerthesaurus powerline paper-theme origami org-variable-pitch org-super-links org-super-agenda org-noter-pdftools org-bullets neotree monokai-theme lsp-ui lsp-treemacs jsonrpc highlight-numbers helm-org-rifle gruvbox-theme flyspell-correct flymake flycheck emacsql-sqlite3 company ccls)))
;; Startup commands
(powerline-center-theme)
(smooth-scrolling-mode)
(lambda () (progn
  (setq left-margin-width 2)
  (setq right-margin-width 2)
  (set-window-buffer nil (current-buffer))))


;; Stuff that packages need to work

(use-package pdf-tools
   :pin manual
   :config
   (pdf-tools-install)
   (setq-default pdf-view-display-size 'fit-width)
   (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
   :custom
   (pdf-annot-activate-created-annotations t "automatically annotate highlights"))

(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
      TeX-source-correlate-startserver t)

(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)
;; Custom Functions and Commands
(defun my-org-screenshot ()
  "Take a screenshot into a time stamped unique-named file in the same directory as the org-buffer and insert a link to this file."
  (interactive)
  (setq filename
        (concat
         (make-temp-name
          (concat (buffer-file-name)
                  "_"
                  (format-time-string "%Y-%m-%d_%H%M%S_")) ) ".png"))
  (call-process "import" nil nil nil filename)
  (insert (concat "[[" filename "]]"))
  (org-display-inline-images))
(global-set-key (kbd "C-c i S") 'my-org-screenshot)

;(define-minor-mode movement-mode
;  "Minor mode that lets you move the cursor with the default i3 window movement keys."
;  :init-value nil
;  :lighter " MovementMode"
;  :keymap
;  (let ((keymap (make-sparse-keymap)))
;    (define-key keymap (kbd ";") 'forward-char)
;    (define-key keymap (kbd "j") 'backward-char)
;    (define-key keymap (kbd "k") 'next-line)
;    (define-key keymap (kbd "l") 'previous-line)
;
;     keymap)
;  :group 'movement)
;
;(define-globalized-minor-mode movement-global-mode movement-mode
;  (lambda ()
;    (if (not (minibufferp (current-buffer)))
;        (movement-mode 1))))
;
;(add-to-list 'emulation-mode-map-alists '(movement-global-mode movement-mode-map))

;(global-set-key (kbd "M-SPC") 'movement-global-mode)

;; Customized variables
;; fix color handling in org-preview-latex-fragment
(let ((dvipng--plist (alist-get 'dvipng org-preview-latex-process-alist)))
  (plist-put dvipng--plist :use-xcolor t)
  (plist-put dvipng--plist :image-converter '("dvipng -D %D -T tight -o %O %f")))
 (setq-default left-margin-width 1 right-margin-width 1 ) ; Define new widths.
 (set-window-buffer nil (current-buffer)) ; Use them now.

;; prog-mode hooks
(add-hook 'prog-mode-hook 'flycheck-mode)
(add-hook 'prog-mode-hook 'visual-line-mode)
(add-hook 'prog-mode-hook 'company-mode)
(add-hook 'prog-mode-hook 'highlight-numbers-mode)
;(add-hook 'prog-mode-hook 'linum-mode)

;; org-mode hooks
(add-hook 'org-mode-hook 'flyspell-mode)
;(add-hook 'org-mode-hook 'org-toggle-pretty-entities)
(add-hook 'org-mode-hook 'org-variable-pitch-minor-mode)
(add-hook 'org-mode-hook '(lambda () (org-bullets-mode 1)))
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'before-save-hook 'org-latex-preview)
(add-hook 'org-mode-hook 'org-latex-preview)

;; Keybinds
(global-set-key (kbd "C-c i l") 'sl-link)
(global-set-key	(kbd "C-c C-x C-l") 'org-latex-mode)
(global-set-key (kbd "<f1>") 'helm-org-rifle-org-directory)
(global-set-key (kbd "<f2>") 'org-capture)
(global-set-key (kbd "<f4>") (lambda () (interactive)
			       (find-file "~/Documents/School/")))
(global-set-key (kbd "<f3>") 'org-agenda)(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'load-path "~/.emacs.d/customPrograms/")
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.

					;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(require 'use-package)
(require 'bind-key)
(require 'smooth-scrolling)
(require 'org-id)
(require 'org-variable-pitch)
(require 'org)
(require 'flyspell)
(require 'org-super-agenda)
(require 'helm-org-rifle)
(require 'flyspell-correct)
(require 'helm)
(require 'powerline)
(require 'org-super-links)
(require 'org-bullets)
(require 'pdf-tools)
(require 'company)
(require 'project)
(require 'which-key)
(require 'ccls)
(use-package lsp-mode
  :config
  (setq lsp-idle-delay 0.5
        lsp-enable-symbol-highlighting t
        lsp-enable-snippet nil)  ;; Not supported by company capf, which is the recommended company backend
  (lsp-register-custom-settings
   '(("pyls.plugins.pyls_mypy.enabled" t t)
     ("pyls.plugins.pyls_mypy.live_mode" nil t)
     ("pyls.plugins.pyls_black.enabled" t t)
     ("pyls.plugins.pyls_isort.enabled" t t)

     ;; Disable these as they're duplicated by flake8
     ("pyls.plugins.pycodestyle.enabled" nil t)
     ("pyls.plugins.mccabe.enabled" nil t)
     ("pyls.plugins.pyflakes.enabled" nil t)))
  :hook
  ((prog-mode . lsp)
   (lsp-mode . lsp-enable-which-key-integration)))
(use-package lsp-ui
  :config (setq lsp-ui-sideline-show-hover t
                lsp-ui-sideline-delay 0.5
                lsp-ui-doc-delay 5
                lsp-ui-sideline-ignore-duplicates t
                lsp-ui-doc-position 'bottom
                lsp-ui-doc-alignment 'frame
                lsp-ui-doc-header nil
                lsp-ui-doc-include-signature t
                lsp-ui-doc-use-childframe t)
  :commands lsp-ui-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3c3836" "#fb4934" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#ebdbb2"])
 '(cursor-type 'bar)
 '(custom-enabled-themes '(monokai))
 '(custom-safe-themes
   '("d9646b131c4aa37f01f909fbdd5a9099389518eb68f25277ed19ba99adeb7279" "bc7627a5d14001acb3237151df7ccb413b57e4a820295ec24562c132efcacb2e" "b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" default))
 '(display-line-numbers nil)
 '(doc-view-resolution 100)
 '(eglot-autoshutdown t)
 '(global-semantic-highlight-func-mode nil)
 '(helm-mode t)
 '(helm-org-rifle-close-unopened-file-buffers nil)
 '(helm-org-rifle-fontify-headings t)
 '(helm-org-rifle-reverse-paths t)
 '(image-auto-resize 'fit-width)
 '(inhibit-startup-screen t)
 '(ivy-mode t)
 '(left-margin 5)
 '(line-spacing 0.1)
 '(movement-global-mode t)
 '(nil nil t)
 '(org-agenda-custom-commands
   '(("g" "Good agenda"
      ((agenda ""
	       ((org-agenda-overriding-header "Agenda and Tonight's Homework")
		(org-super-agenda-groups
		 '((:time-grid t)
		   (:name "OVERDUE" :discard
			  (:todo "SOMEDAY")
			  :deadline past :order 1)
		   (:name "Today's Schedule" :time-grid t :order 2)
		   (:name "Meetings" :tag "meeting" :order 2)
		   (:name "Tests and Quizzes" :tag
			  ("test" "quiz" "assessment" "conference")
			  :order 3)
		   (:name "Tonight's Homework" :and
			  (:tag "school" :tag "homework" :deadline today)
			  :and
			  (:tag "school" :tag "project" :deadline today)
			  :order 5)
		   (:name "Upcoming Homework" :and
			  (:tag "school" :tag "homework" :deadline future)
			  :and
			  (:tag "school" :children t :deadline future)
			  :order 6)
		   (:name "Emails" :tag "email" :order 7)))))
       (alltodo ""
		((org-agenda-overriding-header "PROJECTS")
		 (org-super-agenda-groups
		  '((:auto-parent t)
		    (:discard
		     (:anything))))))
       (alltodo ""
		((org-agenda-overriding-header "Other")
		 (org-super-agenda-groups
		  '((:name "Bucket List" :and
			   (:todo "SOMEDAY" :tag "PERSONAL")
			   :order 1)
		    (:name "Someday Maybe" :todo "SOMEDAY" :order 10)
		    (:name "Everything Else" :anything t :order 20))))))
      nil nil)
     ("n" "Agenda and all TODOs"
      ((agenda "" nil)
       (alltodo "" nil))
      nil)))
 '(org-agenda-files
   '("~/Documents/School/Apocalypse-2021_School_Year/Science_Research/classNotes.org" "~/Documents/School/Apocalypse-2021_School_Year/English/ofMiceAndMenNotes.org" "~/Documents/School/Apocalypse-2021_School_Year/Science_Research/sqlInjection.org" "~/Documents/School/Apocalypse-2021_School_Year/USHistory/classNotes.org" "~/Documents/School/Apocalypse-2021_School_Year/English/classNotes.org" "~/Documents/personal.org" "~/Documents/School/Apocalypse-2021_School_Year/DriversED/classNotes.org" "~/Documents/School/Apocalypse-2021_School_Year/Spanish/classNotes.org" "~/org/todo.org"))
 '(org-agenda-include-diary t)
 '(org-agenda-prefix-format
   '((agenda . " %i %-12:c%?-8t% s %-6e")
     (todo . " %i %-12:c %-6e ")
     (tags . " %i %-12:c %-6e")))
 '(org-agenda-skip-scheduled-if-deadline-is-shown 'not-today)
 '(org-agenda-span 'day)
 '(org-bullets-bullet-list '("⚫"))
 '(org-capture-templates
   '(("n" "Quick note" entry
      (file+headline "~/Documents/personal.org" "Quick Notes")
      "* %^{Headline}
  ENTERED: %U
" :prepend t)
     ("a" "Test/Assessment/Quiz " entry
      (file "~/org/todo.org")
      "* %^{Test Name} :school:%^{Tags}:
  DEADLINE: %^{Deadline}t ENTERED: %U" :prepend t :time-prompt t)
     ("P" "Project TODO" entry
      (file "~/org/todo.org")
      "* TODO %^{Project name} [/] :project:%^{Tags}:
  DEADLINE: %^{Deadline}t ENTERED: %U" :prepend t :time-prompt t)
     ("e" "Email TODO" entry
      (file "~/org/todo.org")
      "* TODO %^{Task} :email:%^{Tags}:
  DEADLINE: %^{Deadline}t ENTERED: %U" :prepend t :time-prompt t)
     ("m" "Meeting entry" entry
      (file "~/org/todo.org")
      "* %^{prompt} :meeting:%^{tags}:
  DEADLINE: %^{Deadline}T ENTERED: %U" :prepend t :time-prompt t)
     ("h" "Homework entry" entry
      (file "~/org/todo.org")
      "* TODO %^{prompt}    :school:homework:
  DEADLINE: %^{Deadline}t ENTERED %U
  :PROPERTIES:
  :EFFORT: %^{Effort}
  :END:" :prepend t :time-prompt t)))
 '(org-directory "~/Documents/")
 '(org-format-latex-options
   '(:foreground default :background default :scale 1.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-hide-emphasis-markers t)
 '(org-highlight-latex-and-related nil)
 '(org-id-link-to-org-use-id t)
 '(org-image-actual-width 500)
 '(org-list-demote-modify-bullet '(("+" . "-") ("1)" . "1.")))
 '(org-mode-hook
   '(org-latex-preview visual-line-mode org-indent-mode
		       (lambda nil
			 (org-bullets-mode 1))
		       org-variable-pitch-minor-mode flyspell-mode
		       #[0 "\301\211\207"
			   [imenu-create-index-function org-imenu-get-tree]
			   2]
		       #[0 "\300\301\302\303\304$\207"
			   [add-hook change-major-mode-hook org-show-all append local]
			   5]
		       #[0 "\300\301\302\303\304$\207"
			   [add-hook change-major-mode-hook org-babel-show-result-all append local]
			   5]
		       org-babel-result-hide-spec org-babel-hide-all-hashes))
 '(org-super-agenda-mode t)
 '(org-todo-keywords
   '((sequence "TODO" "NEXT" "STARTED" "ET" "POSTPONED" "DONE")))
 '(package-selected-packages
   '(ivy smooth-scroll writeroom-mode zzz-to-char which-key use-package typing smooth-scrolling request-deferred quelpa project powerthesaurus powerline paper-theme origami org-variable-pitch org-super-links org-super-agenda org-noter-pdftools org-bullets neotree monokai-theme lsp-ui lsp-treemacs jsonrpc highlight-numbers helm-org-rifle gruvbox-theme flyspell-correct flymake flycheck emacsql-sqlite3 company ccls)))
;; Startup commands
(powerline-center-theme)
(smooth-scrolling-mode)
(lambda () (progn
  (setq left-margin-width 2)
  (setq right-margin-width 2)
  (set-window-buffer nil (current-buffer))))


;; Stuff that packages need to work

(use-package pdf-tools
   :pin manual
   :config
   (pdf-tools-install)
   (setq-default pdf-view-display-size 'fit-width)
   (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
   :custom
   (pdf-annot-activate-created-annotations t "automatically annotate highlights"))

(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
      TeX-source-correlate-startserver t)

(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)
;; Custom Functions and Commands
(defun my-org-screenshot ()
  "Take a screenshot into a time stamped unique-named file in the same directory as the org-buffer and insert a link to this file."
  (interactive)
  (setq filename
        (concat
         (make-temp-name
          (concat (buffer-file-name)
                  "_"
                  (format-time-string "%Y-%m-%d_%H%M%S_")) ) ".png"))
  (call-process "import" nil nil nil filename)
  (insert (concat "[[" filename "]]"))
  (org-display-inline-images))
(global-set-key (kbd "C-c i S") 'my-org-screenshot)

;(define-minor-mode movement-mode
;  "Minor mode that lets you move the cursor with the default i3 window movement keys."
;  :init-value nil
;  :lighter " MovementMode"
;  :keymap
;  (let ((keymap (make-sparse-keymap)))
;    (define-key keymap (kbd ";") 'forward-char)
;    (define-key keymap (kbd "j") 'backward-char)
;    (define-key keymap (kbd "k") 'next-line)
;    (define-key keymap (kbd "l") 'previous-line)
;
;     keymap)
;  :group 'movement)
;
;(define-globalized-minor-mode movement-global-mode movement-mode
;  (lambda ()
;    (if (not (minibufferp (current-buffer)))
;        (movement-mode 1))))
;
;(add-to-list 'emulation-mode-map-alists '(movement-global-mode movement-mode-map))

;(global-set-key (kbd "M-SPC") 'movement-global-mode)

;; Customized variables
;; fix color handling in org-preview-latex-fragment
(let ((dvipng--plist (alist-get 'dvipng org-preview-latex-process-alist)))
  (plist-put dvipng--plist :use-xcolor t)
  (plist-put dvipng--plist :image-converter '("dvipng -D %D -T tight -o %O %f")))
 (setq-default left-margin-width 1 right-margin-width 1 ) ; Define new widths.
 (set-window-buffer nil (current-buffer)) ; Use them now.

;; prog-mode hooks
(add-hook 'prog-mode-hook 'flycheck-mode)
(add-hook 'prog-mode-hook 'visual-line-mode)
(add-hook 'prog-mode-hook 'company-mode)
(add-hook 'prog-mode-hook 'highlight-numbers-mode)
;(add-hook 'prog-mode-hook 'linum-mode)

;; org-mode hooks
(add-hook 'org-mode-hook 'flyspell-mode)
;(add-hook 'org-mode-hook 'org-toggle-pretty-entities)
(add-hook 'org-mode-hook 'org-variable-pitch-minor-mode)
(add-hook 'org-mode-hook '(lambda () (org-bullets-mode 1)))
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'before-save-hook 'org-latex-preview)
(add-hook 'org-mode-hook 'org-latex-preview)

;; Keybinds
(global-set-key (kbd "C-c i l") 'sl-link)
(global-set-key	(kbd "C-c C-x C-l") 'org-latex-mode)
(global-set-key (kbd "<f1>") 'helm-org-rifle-org-directory)
(global-set-key (kbd "<f2>") 'org-capture)
(global-set-key (kbd "<f4>") (lambda () (interactive)
			       (find-file "~/Documents/School/")))
(global-set-key (kbd "<f3>") 'org-agenda)
(global-set-key (kbd "C-c r") 'visual-line-mode)
(global-set-key (kbd "C-z") 'undo)

(server-start)
(provide 'emacs)
;;; .emacs ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka" :foundry "BE5N" :slant normal :weight normal :height 127 :width normal))))
 '(bold ((t (:weight bold))))
 '(fixed-pitch ((t (:weight light :family "Iosevka"))))
 '(italic ((t (:slant italic))))
 '(link ((t (:inherit default :foreground "RoyalBlue3" :underline t))))
 '(org-agenda-date ((t (:inherit font-lock-comment-face :height 1.25))))
 '(org-agenda-date-today ((t (:inherit outline-1 :slant italic :weight bold :height 1.25))))
 '(org-agenda-structure ((t (:inherit org-document-title))))
 '(org-code ((t (:inherit org-block-begin-line))))
 '(org-document-title ((t (:foreground "#076678" :height 2.0))))
 '(org-drawer ((t (:inherit font-lock-function-name-face :foreground "dark gray" :height 0.5))))
 '(org-hide ((t (:foreground "#FAFAFA"))))
 '(org-level-1 ((t (:foreground "#83a598" :weight bold :height 2.0))))
 '(org-level-2 ((t (:foreground "#fabd2f" :weight bold :height 1.75))))
 '(org-level-3 ((t (:foreground "#d3869b" :weight bold :height 1.5))))
 '(org-level-4 ((t (:foreground "#fb4933" :weight bold :height 1.25))))
 '(org-level-5 ((t (:foreground "#b8bb26" :weight bold :height 1.25))))
 '(org-level-6 ((t (:foreground "#8ec07c" :weight bold :height 1.25))))
 '(org-level-7 ((t (:foreground "#076678" :slant normal :weight bold :height 1.25))))
 '(org-level-8 ((t (:foreground "#fe8019" :height 1.25))))
 '(org-link ((t (:inherit (org-variable-pitch-fixed-face link)))))
 '(org-super-agenda-header ((t (:inherit outline-1))))
 '(org-target ((t (:inherit nil :underline t))))
 '(org-upcoming-deadline ((t (:inherit nil))))
 '(org-variable-pitch-fixed-face ((t (:weight semi-light :family "Iosevka"))))
 '(org-verbatim ((t (:inherit shadow :foreground "turquoise"))))
 '(variable-pitch ((t (:weight normal :family "ETBembo")))))

(global-set-key (kbd "C-c r") 'visual-line-mode)
(global-set-key (kbd "C-z") 'undo)

(server-start)
(provide 'emacs)
;;; .emacs ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka" :foundry "BE5N" :slant normal :weight normal :height 127 :width normal))))
 '(bold ((t (:weight bold))))
 '(fixed-pitch ((t (:weight light :family "Iosevka"))))
 '(italic ((t (:slant italic))))
 '(link ((t (:inherit default :foreground "RoyalBlue3" :underline t))))
 '(org-agenda-date ((t (:inherit font-lock-comment-face :height 1.25))))
 '(org-agenda-date-today ((t (:inherit outline-1 :slant italic :weight bold :height 1.25))))
 '(org-agenda-structure ((t (:inherit org-document-title))))
 '(org-code ((t (:inherit org-block-begin-line))))
 '(org-document-title ((t (:foreground "#076678" :height 2.0))))
 '(org-drawer ((t (:inherit font-lock-function-name-face :foreground "dark gray" :height 0.5))))
 '(org-hide ((t (:foreground "#FAFAFA"))))
 '(org-level-1 ((t (:foreground "#83a598" :weight bold :height 2.0))))
 '(org-level-2 ((t (:foreground "#fabd2f" :weight bold :height 1.75))))
 '(org-level-3 ((t (:foreground "#d3869b" :weight bold :height 1.5))))
 '(org-level-4 ((t (:foreground "#fb4933" :weight bold :height 1.25))))
 '(org-level-5 ((t (:foreground "#b8bb26" :weight bold :height 1.25))))
 '(org-level-6 ((t (:foreground "#8ec07c" :weight bold :height 1.25))))
 '(org-level-7 ((t (:foreground "#076678" :slant normal :weight bold :height 1.25))))
 '(org-level-8 ((t (:foreground "#fe8019" :height 1.25))))
 '(org-link ((t (:inherit (org-variable-pitch-fixed-face link)))))
 '(org-super-agenda-header ((t (:inherit outline-1))))
 '(org-target ((t (:inherit nil :underline t))))
 '(org-upcoming-deadline ((t (:inherit nil))))
 '(org-variable-pitch-fixed-face ((t (:weight semi-light :family "Iosevka"))))
 '(org-verbatim ((t (:inherit shadow :foreground "turquoise"))))
 '(variable-pitch ((t (:weight normal :family "ETBembo")))))
