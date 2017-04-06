(use-package evil
  :init
  (setq evil-normal-state-tag
	(propertize " N " 'face '((:background "firebrick4" :foreground "black")))
	evil-emacs-state-tag
	(propertize " E " 'face '((:background "blue violet" :foreground "black")))
	evil-insert-state-tag
	(propertize " I " 'face '((:background "dark green" :foreground "black")))
	evil-motion-state-tag
	(propertize " M " 'face '((:background "blue" :foreground "white")))
	evil-visual-state-tag
	(propertize " V " 'face '((:background "orange" :foreground "black")))
	evil-operator-state-tag
	(propertize " O " 'face '((:background "sky blue" :foreground "black"))))
  (setq evil-normal-state-cursor '(box "firebrick4")
	evil-emacs-state-cursor '((bar . 2) "blue violet")
	evil-insert-state-cursor '((bar . 2) "dark green")
	evil-motion-state-cursor '(box "blue")
	evil-visual-state-cursor '(box "orange")
	evil-replace-state-cursor '((hbar . 2) "chartreuse4")
	evil-operator-state-cursor '(box "sky blue"))
  :config
  (dim-minor-name 'undo-tree-mode "")

  (define-key evil-normal-state-map (kbd "TAB") #'indent-for-tab-command)

  (define-prefix-command 'aumgn/space-map)
  (define-key evil-normal-state-map (kbd "SPC") 'aumgn/space-map)
  (define-key evil-motion-state-map (kbd "SPC") 'aumgn/space-map)
  (define-key aumgn/space-map "x" #'execute-extended-command)
  (define-key aumgn/space-map "e" #'eval-expression)
  (define-key aumgn/space-map "b" #'ivy-switch-buffer)
  (define-key aumgn/space-map "B" #'list-buffers)
  (define-key aumgn/space-map "s" #'save-buffer)
  (define-key aumgn/space-map "S" #'write-file)
  (define-key aumgn/space-map "d" #'evil-window-delete)
  (define-key aumgn/space-map "D" #'delete-other-windows)
  (define-key aumgn/space-map "k" #'kill-this-buffer)
  (define-key aumgn/space-map "K" #'kill-buffer-and-window)
  (define-key aumgn/space-map "f" #'find-file)
  (define-key aumgn/space-map "F" #'find-file-other-frame)
  (define-key aumgn/space-map "q" #'evil-quit)

  (define-prefix-command 'aumgn/space-w-map)
  (define-key aumgn/space-map "w" 'aumgn/space-w-map)
  (define-key aumgn/space-w-map "h" 'windmove-left)
  (define-key aumgn/space-w-map "j" 'windmove-down)
  (define-key aumgn/space-w-map "k" 'windmove-up)
  (define-key aumgn/space-w-map "l" 'windmove-right)

  (evil-ex-define-cmd "k[ill]" 'kill-this-buffer)
  (evil-mode 1))

