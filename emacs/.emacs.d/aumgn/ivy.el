(use-package flx)

(use-package counsel
  :init
  (setq ivy-re-builders-alist
	'((swiper . ivy--regex-plus)
	  (t . ivy--regex-fuzzy)))
  :config
  (ivy-mode 1)
  (dim-minor-name 'ivy-mode "")
  (define-key evil-normal-state-map "/" #'swiper)
  (define-key aumgn/space-map "/" #'counsel-ag))

