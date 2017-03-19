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

  (define-prefix-command 'aumgn/evil-space-map)
  (define-key evil-normal-state-map (kbd "SPC") 'aumgn/evil-space-map)
  (define-key aumgn/evil-space-map "b" #'ivy-switch-buffer)
  (define-key aumgn/evil-space-map "s" #'save-buffer)
  (define-key aumgn/evil-space-map "S" #'write-file)
  (define-key aumgn/evil-space-map "d" #'evil-window-delete)
  (define-key aumgn/evil-space-map "D" #'delete-other-windows)
  (define-key aumgn/evil-space-map "k" #'kill-this-buffer)
  (define-key aumgn/evil-space-map "K" #'kill-buffer-and-window)
  (define-key aumgn/evil-space-map "f" #'find-file)
  (define-key aumgn/evil-space-map "F" #'find-file-other-frame)
  (define-key aumgn/evil-space-map "q" #'evil-quit)

  (evil-mode 1))

