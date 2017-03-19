(use-package ess
  :mode ("\\.R" . R-mode)
  :interpreter "R"
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((R . t))))

