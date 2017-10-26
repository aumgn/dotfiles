(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t))))

