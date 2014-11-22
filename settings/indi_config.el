;;; package -- summary
;;; Commentary:

(require 'cl-lib)

;; setup theme
;; (load "~/.emacs.d/elpa/color-theme-tango-0.0.2/color-theme-tango.el")
;; (color-theme-tango)
;; (require-package 'color-theme-solarized)
(add-to-list 'custom-theme-load-path "~/.emacs.d/custom/themes")
(load-theme 'zenburn t)
;; (require-package 'color-theme-wombat)
;; (load-theme 'wombat t)

(define-key key-translation-map [dead-circumflex] "^")

;; setup evil mode
(require-package 'evil)
(require-package 'evil-leader)
(require-package 'evil-numbers)
(require-package 'evil-visualstar)
(require-package 'evil-nerd-commenter)
(require-package 'evil-indent-textobject)
(require-package 'evil-matchit)
(require-package 'evil-exchange)
(require-package 'evil-surround)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

(require 'evil)
(evil-mode 1)
(setq evil-default-cursor t)

(evil-leader/set-key "a" 'py-ext)
(evil-leader/set-key "x" 'py-multi-term)
(evil-leader/set-key "f" 'find-file)
(evil-leader/set-key "k" 'kill-buffer)
(evil-leader/set-key "l" 'buffer-menu)
(evil-leader/set-key "n" 'next-buffer)
(evil-leader/set-key "m" 'previous-buffer)
(evil-leader/set-key "d" 'switch-to-buffer)
(evil-leader/set-key "h" 'helm-locate)
(evil-leader/set-key "j" 'jedi-direx:switch-to-buffer)
(evil-leader/set-key "g" 'jedi:goto-definition)
(evil-leader/set-key "v" 'jedi:show-doc)
(evil-leader/set-key "c" 'comment-region)
(evil-leader/set-key "u" 'uncomment-region)

(evil-leader/set-key "b" 'python-add-breakpoint)
(evil-leader/set-key "p" 'multi-term)
(evil-leader/set-key "z" 'dired)

(evil-leader/set-key "0" 'delete-window)
(evil-leader/set-key "1" 'delete-other-windows)
(evil-leader/set-key "2" 'split-window-below)
(evil-leader/set-key "3" 'split-window-right)
(evil-leader/set-key "o" 'other-window)

;; setup powerline
(require-package 'powerline)
(require 'powerline)
(powerline-default-theme)
(require-package 'powerline-evil)

(require 'powerline-evil)
(setq powerline-color1 "#657b83")
(setq powerline-color2 "#839496")

(set-face-attribute 'mode-line nil
                    :foreground "#fdf6e3"
                    :background "#16738F"
                    :box nil)
(set-face-attribute 'mode-line-inactive nil
		    :background "#444444"
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

;; setup jedi
(require-package 'python-environment)
(require-package 'jedi)
(require-package 'jedi-direx)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'jedi-mode-hook 'jedi-direx:setup)
(setq jedi:setup-keys t) ; optional
(setq jedi:complete-on-dot t) ; optional

;; setup virtualenvwrapper
(require-package 'virtualenvwrapper)
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)

;; Make C-c C-c behave like C-u C-c C-c in Python mode which allows for code in __main__ block
;(define-key python-mode-map (kbd "C-c C-c")
;  (lambda () (interactive) (python-shell-send-buffer t)))

;; setup flycheck
(require-package 'flycheck)
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; flycheck-tip, show error messages as popup
(require-package 'flycheck-tip)
(require 'flycheck-tip)
(flycheck-tip-use-timer 'verbose)

;; (defun turn-on-flyspell ()
;;    "Force flyspell mode on using a positive argument."
;;    (interactive)
;;    (flyspell-mode 1))

;; (autoload 'flyspell-mode "flyspell" "On the fly spell checker" t)
;; ;; (add-hook 'message-mode-hook 'turn-on-flyspell)
;; (add-hook 'text-mode-hook 'turn-on-flyspell)
;; ;; (add-hook 'python-mode-hook 'flyspell-prog-mode)
;; (call-interactively 'ac-flyspell-workaround)

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

;(load "~/.emacs.d/custom/linum-off.el")
;(linum-on)

;; setup ido - InteractivelyDoThings
;(require 'ido)
;(ido-mode t)
;; ido-ignore-buffers

;; copy/paste with C-c and C-v and C-x, check out C-RET too
;; interferes with evil-visual-block
;;(cua-mode)

;; Use the clipboard, pretty please, so that copy/paste "works"
(setq x-select-enable-clipboard t)

;; setup python mode
(require 'python)
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;; (require-package 'python-mode)
;; (require 'python-mde
;; (setq py-shell-name 'ipython)
;; ;(setq py-force-py-shell-name-p t)
;; (setq py-ask-about-save nil)
;; ;(setq py-start-run-py-shell t)
;; ;(setq py-smart-indentation t)
;; (setq py-split-windows-on-execute-p nil)
;; (setq py-block-comment-prefix-p nil)
;; (setq py-tab-indent nil)

; ipdb
; from: pedrokroger.net/2010/07/configuring-emacs-as-a-python-ide-2/
; Highlight ipdb lines:
(defun annotate-pdb ()
  "Annotate pdb."
  (interactive)
  (highlight-lines-matching-regexp "import pdb")
  (highlight-lines-matching-regexp "pdb.set_trace()"))

; Keybinding to add breakpoint:
(defun python-add-breakpoint ()
  "Add python breakpoint."
  (interactive)
  (newline-and-indent)
  (insert "import pdb; pdb.set_trace()")
  (highlight-lines-matching-regexp "^[ ]*import pdb; pdb.set_trace()"))

(require-package 'pytest)
(require 'pytest)

;; custom function to run pytest on current file
(defun py-test-current ()
  (interactive)
  (compile (concat "py.test -s " (buffer-file-name)))
)
;; bind to C-c t
(add-hook 'python-mode-hook
	  (lambda () (local-set-key (kbd "C-c t") 'py-test-current)))

;; custom function to run pyflakes on current file
(defun pyflakes-current ()
  (interactive)
  (compile (concat "pyflakes " (buffer-file-name)))
)
;; bind to C-c f
(add-hook 'python-mode-hook
	  (lambda () (local-set-key (kbd "C-c f") 'pyflakes-current)))

;; custom function to run pyflakes on current file
(defun pylint-current ()
  (interactive)
  (compile (concat "pylint " (buffer-file-name)))
)
;; bind to C-c l
(add-hook 'python-mode-hook
	  (lambda () (local-set-key (kbd "C-c l") 'pylint-current)))

(require-package 'py-autopep8)
(require 'py-autopep8)
(add-hook 'before-save-hook 'py-autopep8-before-save)

;; Set paths for python projects and virtual environments
(require 'python_projects)

; Set PYTHONPATH, because we don't load .bashrc
(defun set-python-path-from-shell-PYTHONPATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PYTHONPATH'")))
    (setenv "PYTHONPATH" path-from-shell)))

(if window-system (set-python-path-from-shell-PYTHONPATH))

;; remove trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

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

;; package to save and restore window groups
;(require-package 'workgroups2)
;(require 'workgroups2)
;(workgroups-mode 1)

;; (require-package 'projectile)
;; (require 'projectile)
;; (projectile-global-mode)

;; helm package
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: helm              ;;
;;                            ;;
;; GROUP: Convenience -> Helm ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require-package 'helm)

(require 'helm)

;; must set before helm-config,  otherwise helm use default
;; prefix "C-x c", which is inconvenient because you can
;; accidentially pressed "C-x C-c"
(setq helm-command-prefix-key "C-c h")

;; (require-package 'helm-projectile)
;; (require 'helm-projectile)
;; ;; custom function for finding and switching projects
;; (defun cp/projectile-find ()
;;   "if not in a project switch to project"
;;   (interactive)
;; (if (projectile-project-p)
;;     (helm-projectile)
;;     (helm-projectile-switch-project)))
;; (global-set-key (kbd "C-x f") 'cp/projectile-find)

(require 'helm-config)
(require 'helm-eshell)
(require 'helm-files)
(require 'helm-grep)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
(define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
(define-key helm-grep-mode-map (kbd "p")  'helm-grep-mode-jump-other-window-backward)

(setq
 helm-google-suggest-use-curl-p t
 helm-scroll-amount 4 ; scroll 4 lines other window using M-<next>/M-<prior>
 helm-quick-update t ; do not display invisible candidates
 helm-idle-delay 0.01 ; be idle for this many seconds, before updating in delayed sources.
 helm-input-idle-delay 0.01 ; be idle for this many seconds, before updating candidate buffer
 helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.

 helm-split-window-default-side 'other ;; open helm buffer in another window
 helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window
 helm-buffers-favorite-modes (append helm-buffers-favorite-modes
                                     '(picture-mode artist-mode))
 helm-candidate-number-limit 200 ; limit the number of displayed canidates
 helm-M-x-requires-pattern 0     ; show all candidates when set to 0
 helm-boring-file-regexp-list
 '("\\.git$" "\\.hg$" "\\.svn$" "\\.CVS$" "\\._darcs$" "\\.la$" "\\.o$" "\\.i$") ; do not show these files in helm buffer
 helm-ff-file-name-history-use-recentf t
 helm-move-to-line-cycle-in-source t ; move to end or beginning of source
                                        ; when reaching top or bottom of source.
 ido-use-virtual-buffers t      ; Needed in helm-buffers-list
 helm-buffers-fuzzy-matching t          ; fuzzy matching buffer names when non--nil
                                        ; useful in helm-mini that lists buffers
 )

;; Save current position to mark ring when jumping to a different place
(add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h o") 'helm-occur)


(helm-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

(defun python-send-file ()
  "Execute file with execfile."
  (interactive)
  (save-buffer)
  (python-send-string (concat "execfile('" (buffer-file-name) "')")))

(defun external-xterm-shell-command (COMMAND)
  "Run a terminal command in an external xterm window as COMMAND."
  (interactive "sShell Command: ")
  (shell-command (concat "gnome-terminal -e " COMMAND)))

(defun py-ext ()
  "Run a terminal command in an external xterm window."
  (interactive)
  (setq bn (buffer-file-name))
  (shell-command (concat "gnome-terminal -x $HOME/.emacs.d/custom/terminal_run.sh '" bn "'")))

(defun pdb-ext ()
  "Run a terminal command in an external xterm window."
  (interactive)
  (setq bn (buffer-file-name))
  (shell-command (concat "gnome-terminal -x ~/.emacs.d/custom/terminal_pdb.sh '" bn "'")))

(defun py-multi-term ()
  "Send ESC in term mode."
  (interactive)
  (setq bn (buffer-file-name))
  (multi-term)
  (term-send-raw-string "PS1='${debian_chroot:+($debian_chroot)}\\u@\\h:\\W\\$ '")
  (term-send-return)
  (term-send-raw-string ". ~/geo_python_dev")
  (term-send-return)
  (term-send-raw-string "reset")
  (term-send-return)
  (term-send-raw-string (concat "python '" bn "'"))
  (term-send-return))

(defun pdb-multi-term ()
  "Send ESC in term mode."
  (interactive)
  (setq bn (buffer-file-name))
  (multi-term)
  (term-send-raw-string "PS1='${debian_chroot:+($debian_chroot)}\\u@\\h:\\W\\$ '")
  (term-send-return)
  (term-send-raw-string ". ~/geo_python_dev")
  (term-send-return)
  (term-send-raw-string "reset")
  (term-send-return)
  (term-send-raw-string (concat "python -m pdb '" bn "'"))
  (term-send-return))

; current date at the cursor position.
(defun insert-date ()
  "Insert current date."
  (interactive)
  (insert (format-time-string "%m/%d/%Y")))
(global-set-key (kbd "C-c d") 'insert-date)

; desktop mode (save buffers on exit)
; autosave buffers
(require 'desktop)
  (desktop-save-mode 1)
  (defun my-desktop-save ()
    (interactive)
    ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
    (if (eq (desktop-owner) (emacs-pid))
        (desktop-save desktop-dirname)))
  (add-hook 'auto-save-hook 'my-desktop-save)

; toggle fullscreen on start-up
(defun toggle-fullscreen ()
  "Toggle fullscreen."
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
(toggle-fullscreen)

; switch fullscreen
(defun switch-fullscreen nil
  "Switch fullscreen."
  (interactive)
  (let* ((modes '(nil fullboth fullwidth fullheight))
         (cm (cdr (assoc 'fullscreen (frame-parameters) ) ) )
         (next (cadr (member cm modes) ) ) )
    (modify-frame-parameters
     (selected-frame)
     (list (cons 'fullscreen next)))))

(define-key global-map [f11] 'switch-fullscreen)

; copy paste in terminal using middle mouse button
; (load "~/.emacs.d/custom/copypaste/copypaste.el")

;; save current windows
;(add-hook 'kill-emacs-hook 'save-current-configuration)

;; resume last window configuration
;(resume)

(provide 'indi_config)
;;; indi_config.el ends here
