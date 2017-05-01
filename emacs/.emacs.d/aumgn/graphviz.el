(use-package graphviz-dot-mode
  :mode ("\\.dot" . graphviz-dot-mode)
  :init
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((dot . t)))
  (add-to-list 'org-src-lang-modes '("dot" . graphviz-dot)))

