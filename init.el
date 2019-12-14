(require 'org)
(org-babel-load-file
  (expand-file-name "config.org"
		    	user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("f357d72451c46d51219c3afd21bb397a33cb059e21db1f4adeffe5b8a9093537" default)))
 '(helm-completion-style (quote emacs))
 '(package-selected-packages
   (quote
    (gruvbox-theme sublimity neotree org-bullets evil-commentary jedi elpy linum-relative drag-stuff use-package helm ranger evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#011627" :foreground "#D6DEEB" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "ADBO" :family "DejaVuSansMono Nerd Font")))))
