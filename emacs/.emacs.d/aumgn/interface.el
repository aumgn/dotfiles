(use-package dim
  :config
  (dim-major-name 'emacs-lisp-mode "EL")
  (dim-major-name 'lisp-interaction-mode "ELi"))

(use-package vi-tilde-fringe
  :config
  (global-vi-tilde-fringe-mode)
  (dim-minor-name 'vi-tilde-fringe-mode ""))

(use-package base16-theme
  :config
  (load-theme 'base16-default-dark t))

; Found on [[https://stackoverflow.com/a/22971471]]
(defun aumgn/mode-line-fill (face reserve)
  "Return empty space using FACE and leaving RESERVE space on the right."
  (unless reserve
    (setq reserve 20))
  (when (and window-system (eq 'right (get-scroll-bar-mode))
    (setq reserve (- reserve 3)))
  (propertize " "
              'display `((space :align-to (- (+ right right-fringe right-margin) ,reserve)))
              'face face)))


(setq-default mode-line-format
	      (list
	       ;; the buffer name; the file name as a tool tip
	       '(:eval (propertize "  %b" 'face '((:background "forest green" :foreground "black"))))

	       ;; was this buffer modified since the last save?
	       '(:eval (propertize (if buffer-read-only "# " (if (buffer-modified-p) "* " "  "))
				   'face '((:background "forest green" :foreground "dark red" :weight bold))))

	       ;; the current major mode for the buffer.
	       '(:eval (propertize (concat " " (if (dim-get-major-name major-mode)
						   (dim-get-major-name major-mode)
						 (symbol-name major-mode)) " ")
				   'face '((:background "AntiqueWhite4" :foreground "black"))))


	       (aumgn/mode-line-fill 'mode-line 20)

	       ;; line and column
	       "(" ;; '%02' to set to 2 chars at least; prevents flickering
	       (propertize "%03l" 'face 'font-lock-type-face) ","
	       (propertize "%03c" 'face 'font-lock-type-face)
	       ") "

	       ;; relative position, size of file
	       (propertize "%8p" 'face 'font-lock-constant-face)
    ))

