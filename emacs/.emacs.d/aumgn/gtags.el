(use-package helm
  :defer t)

(use-package helm-gtags
  :commands helm-gtags-mode
  :init
  (add-hook 'c-mode-hook 'helm-gtags-mode))
