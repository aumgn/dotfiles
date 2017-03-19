(setq user-full-name "aumgn"
      user-mail-address "aumgn@free.fr")

;; Standard Configuration Tweaking
(defalias 'yes-or-no-p 'y-or-n-p)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(show-paren-mode 1)
(column-number-mode)
(global-hl-line-mode)

(setq inhibit-startup-message t
      initial-scratch-message nil
      vc-follow-symlinks t
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      tramp-terminal-type "dumb"
      custom-file "~/.emacs.d/custom.el")

(setq-default show-trailing-whitespace t)
(set-face-attribute 'trailing-whitespace nil :background "LightSalmon1" :foreground "black")

;; Management of packages
(add-to-list 'load-path "~/.emacs.d/aumgn/")
(require 'cl)
(load "package")
(package-initialize)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(setq package-archive-enable-alist '(("melpa" deft magit)))

(defvar aumgn/packages '(use-package diminish bind-key))
(defun aumgn/packages-installed-p ()
  (loop for pkg in aumgn/packages
	when (not (package-installed-p pkg))
	do (return nil)
	finally (return t)))
(unless (aumgn/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg aumgn/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(setq use-package-always-ensure t)
(require 'use-package)
(require 'bind-key)


(use-package dim
  :config
  (dim-major-name 'emacs-lisp-mode "EL")
  (dim-major-name 'lisp-interaction-mode "ELi"))

(use-package vi-tilde-fringe
  :config
  (global-vi-tilde-fringe-mode)
  (dim-minor-name 'vi-tilde-fringe-mode ""))

(use-package base16-theme
  :config  (load-theme 'base16-default-dark t))

(use-package counsel
  :config
  (ivy-mode 1)
  (dim-minor-name 'ivy-mode ""))

(use-package evil
  :init
  (setq evil-normal-state-tag
	(propertize " N " 'face '((:background "firebrick4" :foreground "black")))
	evil-emacs-state-tag
	(propertize " E " 'face '((:background "blue violet" :foreground "black")))
	evil-insert-state-tag
	(propertize " I " 'face '((:background "dark green" :foreground "black")))
	evil-motion-state-tag
	(propertize " M " 'face '((:background "blue" :foreground "white")))
	evil-visual-state-tag
	(propertize " V " 'face '((:background "orange" :foreground "black")))
	evil-operator-state-tag
	(propertize " O " 'face '((:background "sky blue" :foreground "black"))))
  (setq evil-normal-state-cursor '(box "firebrick4")
	evil-emacs-state-cursor '((bar . 2) "blue violet")
	evil-insert-state-cursor '((bar . 2) "dark green")
	evil-motion-state-cursor '(box "blue")
	evil-visual-state-cursor '(box "orange")
	evil-replace-state-cursor '((hbar . 2) "chartreuse4")
	evil-operator-state-cursor '(box "sky blue"))
  :config
  (dim-minor-name 'undo-tree-mode "")

  (define-key evil-normal-state-map (kbd "TAB") #'indent-for-tab-command)

  (define-prefix-command 'aumgn/evil-space-map)
  (define-key evil-normal-state-map (kbd "SPC") 'aumgn/evil-space-map)
  (define-key aumgn/evil-space-map "b" #'ivy-switch-buffer)
  (define-key aumgn/evil-space-map "s" #'save-buffer)
  (define-key aumgn/evil-space-map "S" #'write-file)
  (define-key aumgn/evil-space-map "d" #'evil-window-delete)
  (define-key aumgn/evil-space-map "D" #'delete-other-windows)
  (define-key aumgn/evil-space-map "k" #'kill-this-buffer)
  (define-key aumgn/evil-space-map "K" #'kill-buffer-and-window)
  (define-key aumgn/evil-space-map "f" #'find-file)
  (define-key aumgn/evil-space-map "F" #'find-file-other-frame)
  (define-key aumgn/evil-space-map "q" #'evil-quit)

  (evil-mode 1))

(use-package org
  :mode ("\\.org" . org-mode)
  :init
  (dim-major-name 'org-mode "Org")
  (setq org-directory "~/.org"
	org-agenda-files '("~/.org")
	org-hide-leading-stars t
	org-alphabetical-lists t
	org-src-fontify-natively t
	org-src-tab-acts-natively t
	org-hide-emphasis-markers t
	org-pretty-entities t
	org-default-notes-file (expand-file-name "notes.org" org-directory)
	org-support-shift-select t
	org-startup-with-inline-images t
	org-confirm-babel-evaluate nil
	org-capture-templates
	'(
	  ("t" "Todo" entry (file+headline  "~/.org/agenda.org" "Tasks") "** TODO %?\n  %i\n  %a"  :prepend t)
	  ("n" "Notes" entry (file+headline  "~/.org/notes.org"  "General") "* %T %?\n\n  %i\n" :prepend t)))
  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images)

  (define-key aumgn/evil-space-map "a" #'org-agenda)
  (define-key aumgn/evil-space-map "c" #'org-capture)

  (define-prefix-command 'aumgn/org-mode-map)
  (evil-define-key 'normal org-mode-map (kbd "'") 'aumgn/org-mode-map)
  (define-key 'aumgn/org-mode-map "," 'org-babel-previous-src-block)
  (define-key 'aumgn/org-mode-map "." 'org-babel-next-src-block)
  (define-key 'aumgn/org-mode-map "x" 'org-babel-execute-maybe)
  (define-key 'aumgn/org-mode-map "X" 'org-babel-execute-buffer)
  (define-key 'aumgn/org-mode-map  "t" 'org-babel-tangle))

(use-package org-evil)
(use-package org-bullets
  :config
  (defun aumgn/org-bullets-hook ()
    (org-bullets-mode 1))
  (add-hook 'org-mode-hook 'aumgn/org-bullets-hook))

(use-package magit
  :config
  (define-key aumgn/evil-space-map "g" #'magit-status))
(use-package evil-magit)

(use-package ess
  :mode ("\\.R" . R-mode)
  :interpreter "R"
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((R . t))))

(load-library "mode-line")

(load custom-file :noerror)
