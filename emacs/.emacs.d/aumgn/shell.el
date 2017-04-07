(use-package shell
  :mode ("\\.sh" . org-mode)
  :interpreter "sh"
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((sh . t))))

