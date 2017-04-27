(use-package magit
  :config
  (define-key aumgn/space-map "g" #'magit-status)
  (setq magit-completing-read-function 'ivy-completing-read))

(use-package evil-magit
  :config
  (define-key magit-mode-map (kbd "SPC") 'aumgn/space-map)
  (define-key magit-mode-map (kbd "SPC") 'aumgn/space-map))

