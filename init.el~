(menu-bar-mode -1)
(tool-bar-mode -1)
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (paredit rainbow-delimiters drag-stuff centered-cursor-mode vue-mode worf powerline org-bullets linum-relative helm dracula-theme evil))))

(cond
  ((string-equal system-type "windows-nt")
      (progn
        (custom-set-faces
        ;; custom-set-faces was added by Custom.
        ;; If you edit it by hand, you could mess it up, so be careful.
        ;; Your init file should contain only one such instance.
        ;; If there is more than one, they won't work right.
        '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 113 :width normal))))
        )
        (w32-send-sys-command 61488)
      )
    )
  ((string-equal system-type "darwin") ; mac
      (progn
        (defun get-default-height ()
           (/ (- (display-pixel-height) 120)
              (frame-char-height)))
        (add-to-list 'default-frame-alist '(fullscreen . fullwidth))
        (add-to-list 'default-frame-alist (cons 'height (get-default-height)))
      )
  )
)

    

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

(use-package evil :ensure t)
(use-package linum-relative :ensure t)
(use-package org-bullets :ensure t)
(use-package powerline :ensure t)
(use-package centered-cursor-mode :ensure t)
(use-package drag-stuff :ensure t)
(use-package rainbow-delimiters :ensure t)
(use-package dracula-theme :ensure t)
(use-package vue-mode :ensure t)

(require 'evil)

(progn
    (require 'drag-stuff)
    (drag-stuff-mode t)
    (define-key drag-stuff-mode-map (kbd "M-j") 'drag-stuff-down)
    (define-key drag-stuff-mode-map (kbd "M-k") 'drag-stuff-up)
  )

(require 'linum-relative)
(global-linum-mode 1)
(linum-relative-on)
(and
 (require 'centered-cursor-mode)
 (global-centered-cursor-mode +1))
;;(Setq default-frame-alist '((fullscreen . fullwidth) (fullscreen . fullheight)))



(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)
(evil-mode t)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(require 'powerline)
(powerline-default-theme)

(progn
  (require 'rainbow-delimiters)
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  )




(setq linum-relative-current-symbol "")

(add-hook 'mmm-mode-hook
          (lambda ()
            (set-face-background 'mmm-default-submode-face nil)))
(global-set-key (kbd "C-S-k") 'move-line-up)
(global-set-key (kbd "C-S-j") 'move-line-down)

(progn
  (require 'org)
  (define-key org-mode-map (kbd "M-h") 'org-do-promote)
  (define-key org-mode-map (kbd "M-j") 'org-move-subtree-down)
  (define-key org-mode-map (kbd "M-k") 'org-move-subtree-up)
  (define-key org-mode-map (kbd "M-l") 'org-do-demote)
  (define-key org-mode-map (kbd "S-l") 'org-shiftright)
  (define-key org-mode-map (kbd "S-h") 'org-shiftleft)
  )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
