(use-package company
  :config
  (define-key company-active-map "H" 'company-abort)
  (define-key company-active-map "J" 'company-select-next-or-abort)
  (define-key company-active-map "K" 'company-select-previous-or-abort)
  (define-key company-active-map "L" 'company-complete-selection)
  (global-company-mode))

