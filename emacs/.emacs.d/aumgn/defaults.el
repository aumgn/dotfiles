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

