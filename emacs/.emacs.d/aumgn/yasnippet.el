(use-package yasnippet
  :commands yas-minor-mode
  :init
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  :config
  (yas-reload-all)
  (define-key aumgn/space-map "TAB" #'yas-expand))
