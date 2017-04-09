(require 'cl)
(package-initialize)

(defun aumgn/load (file)
  (load-file (concat "~/.emacs.d/aumgn/" file ".el")))

(aumgn/load "packages")
(aumgn/load "defaults")

;
(aumgn/load "interface")
(aumgn/load "evil")
(aumgn/load "ivy")
(aumgn/load "company")

;
(aumgn/load "org")
(aumgn/load "magit")
(aumgn/load "shell")
(aumgn/load "ess")

(load custom-file :noerror)
