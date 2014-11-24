;;; package -- summary
;;; Commentary:

(require 'cl-lib)

;; setup theme
;; (require-package 'color-theme-solarized)
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'zenburn t)
;; (require-package 'color-theme-wombat)
;; (load-theme 'wombat t)
(require 'material-theme)
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono 10"))
(set-face-attribute 'default t :font "DejaVu Sans Mono 10")

(define-key key-translation-map [dead-circumflex] "^")

;; setup powerline
(require-package 'powerline)
(require 'powerline)
(setq powerline-color1 "#657b83")
(setq powerline-color2 "#839496")
(powerline-default-theme)

(set-face-attribute 'mode-line nil
                    :foreground "#fdf6e3"
                    :background "#8ec200"
                    :box nil)
(set-face-attribute 'mode-line-inactive nil
		    :background "#83a9ce"
		    :foreground "#666666"
                    :box nil)

;; install smart parens
;; (require-package 'smartparens)
;; (require 'smartparens)
;; (smartparens-global-mode t)

(global-auto-revert-mode)

;; enable auto-complete mode
(require-package 'auto-complete)
(require 'auto-complete)
(global-auto-complete-mode t)
(ac-set-trigger-key "TAB")
(add-to-list 'ac-modes 'org-mode)

(require-package 'yasnippet)
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-trigger-in-field t)

;; deactivate it in term-mode
(add-hook 'term-mode-hook (lambda()
                (yas-minor-mode -1)))

;; setup maximum column width
; deactivated since it is the cause for skipping lines on up key
; in Emacs 24.3
;(require-package 'fill-column-indicator)
; (require 'fill-column-indicator)
; (define-globalized-minor-mode
;  global-fci-mode fci-mode (lambda () (fci-mode 1)))
; (global-fci-mode 0)

;; set smooth scrolling
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3)))
(setq mouse-wheel-progressive-speed nil)
(setq scroll-step 3)

;;set cursor colors manually
;;(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("grey" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("white" bar))
(setq evil-replace-state-cursor '("white" hollow))
(setq evil-operator-state-cursor '("white" hollow))

;; shows colors in the color they represent
(require-package 'rainbow-mode)
(require 'rainbow-mode)
(define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))

;;(my-global-rainbow-mode 1)
;; setup dirtree
(require-package 'dirtree)
(require 'dirtree)

;; setup dired
(require 'dired)
(put 'dired-find-alternate-file 'disabled nil)

;; setup multi-term
(require-package 'multi-term)
(add-hook 'term-mode-hook (lambda () (setq truncate-lines nil)))

;; setup sr-speedbar
(require-package 'sr-speedbar)
(require 'sr-speedbar)

;; setup autoindent when pressing return
(define-key global-map (kbd "RET") 'newline-and-indent)
(require 'cl) ; common Lisp goodies, loop

; setup visual settings
(tool-bar-mode -1)
(menu-bar-mode 1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t) ; no splash screen, thanks
;;(line-number-mode 1) ; have line numbers and
;;(column-number-mode 1) ; column numbers in the mode line
;; (global-linum-mode 1) ; add line numbers on the left
(blink-cursor-mode 0) ; don't blink the cursor
;;(global-hl-line-mode t) ; highlight the current line

(global-linum-mode 0) ; line numbers on the left
(add-hook 'prog-mode-hook 'linum-mode)

;; setup ido - InteractivelyDoThings
;(require 'ido)
;(ido-mode t)
;; ido-ignore-buffers

;; copy/paste with C-c and C-v and C-x, check out C-RET too
;; interferes with evil-visual-block
;;(cua-mode)

;; Use the clipboard, pretty please, so that copy/paste "works"
(setq x-select-enable-clipboard t)

;;highlight matching parenthesis
(require 'paren)
(show-paren-mode t)

;;setup latex
(require-package 'auctex)
(require-package 'cdlatex)
;(require 'auctex)
(require 'cdlatex)

;(setq TeX-parse-self t) ; Enable parse on load
;(setq TeX-auto-save t) ; Enable parse on save
(setq TeX-save-query nil) ; Do not ask for saving
(setq-default TeX-master nil)
(setq TeX-PDF-mode t) ; PDF mode (rather than DVI-mode)

;; Git integration through magit
(require-package 'magit)
(require 'magit)

(require-package 'web-mode)
(require 'web-mode)

;; (require-package 'projectile)
;; (require 'projectile)
;; (projectile-global-mode)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))

;; own functions

; current date at the cursor position.
(defun insert-date ()
  "Insert current date."
  (interactive)
  (insert (format-time-string "%m/%d/%Y")))
(global-set-key (kbd "C-c d") 'insert-date)

; desktop mode (save buffers on exit)
; autosave buffers
;;(require 'desktop)
;;  (desktop-save-mode 1)
;;  (defun my-desktop-save ()
;;    (interactive)
    ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
;;    (if (eq (desktop-owner) (emacs-pid))
;;        (desktop-save desktop-dirname)))
;;  (add-hook 'auto-save-hook 'my-desktop-save)

; copy paste in terminal using middle mouse button
; (load "copypaste.el")

(provide 'indi_config)
;;; indi_config.el ends here
