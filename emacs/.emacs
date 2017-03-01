(setq user-full-name "aumgn")
(setq user-mail-address "aumgn@free.fr")

(setq inhibit-startup-message t
      initial-scratch-message nil)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(cua-mode t)
(defalias 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq tramp-terminal-type "dumb")

(global-set-key (kbd "C-f") 'find-file-other-frame)

(require 'cl)

(load "package")
(package-initialize)
(add-to-list 'package-archives
	'("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
        '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq package-archive-enable-alist '(("melpa" deft magit)))

(defvar aumgn/packages '(
	god-mode
	multiple-cursors
	base16-theme
	) "Default packages")

(defun aumgn/packages-installed-p ()
	(loop for pkg in aumgn/packages
        	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (aumgn/packages-installed-p)
	(message "%s" "Refreshing package database...")
	(package-refresh-contents)
	(dolist (pkg aumgn/packages)
		(when (not (package-installed-p pkg))
			(package-install pkg))))

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(setq org-directory "~/.org-mode/")

(setq org-hide-leading-stars t)
(setq org-alphabetical-lists t)
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-hide-emphasis-markers t)
(setq org-pretty-entities t)

(require 'god-mode)
(global-set-key (kbd "<escape>") 'god-mode-all)
(setq god-exempt-major-modes nil)
(setq god-exempt-predicates nil)

(defun god-mode--update-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'box
                      'bar)))
(add-hook 'god-mode-enabled-hook 'god-mode--update-cursor)
(add-hook 'god-mode-disabled-hook 'god-mode--update-cursor)
(god-mode-all)
(require 'god-mode-isearch)
(define-key isearch-mode-map (kbd "<escape>") 'god-mode-isearch-activate)
(define-key god-mode-isearch-map (kbd "<escape>") 'god-mode-isearch-disable)

(require 'multiple-cursors)

(global-unset-key (kbd "C-d"))
(global-set-key (kbd "C-d") 'mc/mark-next-like-this)

(load-theme 'base16-default-dark t)
