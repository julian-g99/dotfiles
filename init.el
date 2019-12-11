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
 '(custom-safe-themes
   (quote
    ("f357d72451c46d51219c3afd21bb397a33cb059e21db1f4adeffe5b8a9093537" default)))
 '(helm-completion-style (quote emacs))
 '(package-selected-packages
   (quote
    (sublimity neotree org-bullets evil-commentary jedi elpy linum-relative drag-stuff use-package helm ranger night-owl-theme evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#011627" :foreground "#D6DEEB" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "ADBO" :family "DejaVuSansMono Nerd Font")))))

(eval-when-compile
  (require 'use-package))

;;=========evil mode stuff===========''
(setq evil-want-C-u-scroll t)
(use-package evil)
(evil-mode t)

(use-package evil-commentary)
(evil-commentary-mode t)

;; :q should kill the current buffer rather than quitting emacs entirely
(evil-ex-define-cmd "q" 'kill-this-buffer)
;; Need to type out :quit to close emacs
(evil-ex-define-cmd "quit" 'evil-quit)

;;=========evil mode stuff===========''

;=========sublimity stuff===========''
(setq sublimity-scroll-weight 5
      sublimity-scroll-drift-length 5)
(require 'sublimity)
(require 'sublimity-scroll)
(require 'sublimity-attractive)
(sublimity-mode 1)
(setq scroll-step            5
      scroll-conservatively  10000)
;;=========nerd tree stuff===========''
(use-package neotree)
    (add-hook 'neotree-mode-hook
              (lambda ()
                (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
                (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-quick-look)
                (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
                (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
                (define-key evil-normal-state-local-map (kbd "g") 'neotree-refresh)
                (define-key evil-normal-state-local-map (kbd "n") 'neotree-next-line)
                (define-key evil-normal-state-local-map (kbd "p") 'neotree-previous-line)
                (define-key evil-normal-state-local-map (kbd "A") 'neotree-stretch-toggle)
                (define-key evil-normal-state-local-map (kbd "H") 'neotree-hidden-file-toggle)))
(setq-default neo-show-hidden-files t)
;;=========nerd tree stuff===========''


(use-package linum-relative :ensure t)
(global-linum-mode 1)
(linum-relative-on)

(use-package drag-stuff)
(drag-stuff-global-mode t)
(global-set-key (kbd "M-h") 'drag-stuff-left)
(global-set-key (kbd "M-j") 'drag-stuff-down)
(global-set-key (kbd "M-k") 'drag-stuff-up)
(global-set-key (kbd "M-l") 'drag-stuff-right)

(require 'helm)
(require 'helm-config)

;; (global-set-key (kbd "g-c") 'comment-dwim) ;
;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))


(add-hook 'helm-minibuffer-set-up-hook
          'spacemacs//helm-hide-minibuffer-maybe)

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

(helm-mode 1)


(load-theme 'night-owl t)

(setq night-owl-evil-cursors
      '(("normal" night-owl-orange box)
        ("insert" night-owl-cursor (bar . 2))
        ("emacs" night-owl-cursor (bar . 2))
        ("hybrid" night-owl-cursor (bar . 2))
        ("replace" night-owl-gray (hbar . 2))
        ("evilified" night-owl-yellow box)
        ("visual" night-owl-gray (hbar . 2))
        ("motion" night-owl-violet box)
        ("lisp" night-owl-red box)
        ("iedit" night-owl-magenta box)
        ("iedit-insert" night-owl-magenta (bar . 2))))

(defun night-owl-set-evil-cursor (state color shape)
  (set (intern (format "evil-%s-state-cursor" state))
       (list color shape)))

(defun night-owl-update-evil-cursors ()
  (let ((current-theme (symbol-name (car custom-enabled-themes))))
    (if (string-prefix-p "night-owl" current-theme)
        (cl-loop for (state color style) in night-owl-evil-cursors
                 do
                 (night-owl-set-evil-cursor state (symbol-value color) style))
      ;; not night-owl theme, restore default spacemacs cursors
      (if (functionp 'spacemacs/add-evil-cursor)
          (cl-loop for (state color shape) in spacemacs-evil-cursors
                   do (spacemacs/add-evil-cursor state color shape))))))

(add-hook 'after-init-hook #'night-owl-update-evil-cursors)
;; For spacemacs (comment this out if not using spacemacs):
;; (add-hook 'spacemacs-post-theme-change-hook #'night-owl-update-evil-cursors)

;; For Evil (uncomment this if not using spacemacs):
 (defvar after-load-theme-hook nil
   "Hook run after a color theme is loaded using `load-theme'.")
 
 (defadvice load-theme (after run-after-load-theme-hook activate)
   "Run `after-load-theme-hook'."
   (message (format "Loading theme %s" (ad-get-arg 0)))
   (run-hooks 'after-load-theme-hook))
 
 (add-hook 'after-load-theme-hook #'night-owl-update-evil-cursors)



;;----------dev stuff-----------;;

;; language agnostic

;;python
(elpy-enable)
;; (define-key ac-completing-map (kbd "<C-n>") 'ac-next)
;; (define-key ac-completing-map (kbd "<C-p>") 'ac-previous)
(when (require 'flycheck nil t)

  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))

  (add-hook 'elpy-mode-hook 'flycheck-mode))
;; (define-key python-mode-map (kbd "<C-n>") 'helm-jedi-related-names)


;;========os dependent============;;
(cond ((eq system-type 'windows-nt)
       ;;windows stuff
       (set-face-attribute 'default nil
		    :family "DejaVuSansMono NF"
		    :height 115
		    :weight 'normal
		    :width 'normal)
       )
      ((eq system-type 'gnu/linux)
       ;;linux stuff
       (set-face-attribute 'default nil
		    :family "DejaVuSansMono Nerd Font"
		    :height 115
		    :weight 'normal
		    :width 'normal)
       ))
