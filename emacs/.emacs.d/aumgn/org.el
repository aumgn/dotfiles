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

  (define-key aumgn/space-map "a" #'org-agenda)
  (define-key aumgn/space-map "c" #'org-capture)

  (define-prefix-command 'aumgn/org-mode-map)
  (evil-define-key 'normal org-mode-map (kbd "'") 'aumgn/org-mode-map)
  (evil-define-key 'motion org-mode-map (kbd "'") 'aumgn/org-mode-map)
  (define-key aumgn/org-mode-map "," 'org-babel-previous-src-block)
  (define-key aumgn/org-mode-map "." 'org-babel-next-src-block)
  (define-key aumgn/org-mode-map "p" 'org-set-property)
  (define-key aumgn/org-mode-map "x" 'org-babel-execute-maybe)
  (define-key aumgn/org-mode-map "X" 'org-babel-execute-buffer)
  (define-key aumgn/org-mode-map "t" 'org-babel-tangle)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((sh . t))))


(use-package org-evil)
(use-package org-bullets
  :config
  (defun aumgn/org-bullets-hook ()
    (org-bullets-mode 1))
  (add-hook 'org-mode-hook 'aumgn/org-bullets-hook))

