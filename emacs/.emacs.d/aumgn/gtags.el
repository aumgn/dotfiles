(use-package helm
  :defer t)

(use-package helm-gtags
  :commands helm-gtags-mode
  :init
  (add-hook 'c-mode-hook 'helm-gtags-mode)
  :config
  (define-prefix-command 'aumgn/c-mode-map)
  (evil-define-key 'normal c-mode-map (kbd "'") 'aumgn/c-mode-map)
  (evil-define-key 'motion c-mode-map (kbd "'") 'aumgn/c-mode-map)
  (define-key aumgn/c-mode-map "t" 'helm-gtags-find-tag)
  (define-key aumgn/c-mode-map "j" 'helm-gtags-dwim)
  (define-key aumgn/c-mode-map "h" 'helm-gtags-previous-history)
  (define-key aumgn/c-mode-map "l" 'helm-gtags-next-history)
  (define-key aumgn/c-mode-map "k" 'helm-gtags-pop-stack))

