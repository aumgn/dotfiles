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

