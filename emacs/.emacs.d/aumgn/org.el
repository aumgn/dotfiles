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

  ; (define-key org-mode-map (kbd "C-c C-r") 'org-babel-remove-result)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((sh . t)
     (sql . t)
     (octave . t))))
