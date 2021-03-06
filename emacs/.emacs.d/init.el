(require 'cl)
(package-initialize)

(defun aumgn/load (file)
  (load-file (concat "~/.emacs.d/aumgn/" file ".el")))

(aumgn/load "packages")
(aumgn/load "defaults")

;
(aumgn/load "interface")
; (aumgn/load "evil")
(aumgn/load "escape")
(aumgn/load "multiple-cursors")
(aumgn/load "ivy")
(aumgn/load "company")
; (aumgn/load "yasnippet")
; (aumgn/load "magit")

;
(aumgn/load "c")
(aumgn/load "org")
; (aumgn/load "latex")
(aumgn/load "shell")
(aumgn/load "yaml")
(aumgn/load "python")
(aumgn/load "ess")
(aumgn/load "graphviz")
(aumgn/load "gtags")

(load custom-file :noerror)

