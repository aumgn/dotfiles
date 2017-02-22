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

(global-set-key (kbd "C-x C-f") 'find-file-other-frame)
(global-set-key (kbd "C-x 5 C-f") 'find-file)

(require 'cl)

(load "package")
(package-initialize)
(add-to-list 'package-archives
	'("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
        '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq package-archive-enable-alist '(("melpa" deft magit)))

(defvar aumgn/packages '(
	multiple-cursors
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

(require 'multiple-cursors)

(global-unset-key "\C-d")
(global-set-key (kbd "\C-d") 'mc/mark-next-like-this)


(setq org-directory "~/.org-mode/")

(setq org-hide-leading-stars t)
(setq org-alphabetical-lists t)
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-hide-emphasis-markers t)
(setq org-pretty-entities t)
