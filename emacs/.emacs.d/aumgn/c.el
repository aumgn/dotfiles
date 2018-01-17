(setq c-default-style "linux")

(defun linux-indent ()
  (interactive)
  (setq indent-tabs-mode t)
  (setq tab-width 2))

(defvaralias 'c-basic-offset 'tab-width)

