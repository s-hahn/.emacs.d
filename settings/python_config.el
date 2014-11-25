
;; setup python mode

;;(require-package 'python-mode)
;;(autoload 'python-mode "python-mode" "Python Mode." t)
;;(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;;(add-to-list 'interpreter-mode-alist '("python" . python-mode))

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

;; setup virtualenvwrapper
(require-package 'virtualenvwrapper)
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)

;; setup jedi
(require-package 'python-environment)
(require-package 'jedi)
(require-package 'jedi-direx)
(add-hook 'python-mode-hook 'jedi:setup)

;(add-hook 'jedi-mode-hook 'jedi-direx:setup)
(setq jedi:setup-keys t) ; optional
(setq jedi:complete-on-dot t) ; optional

;; setup flycheck
(require-package 'flycheck)
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; flycheck-tip, show error messages as popup
(require-package 'flycheck-tip)
(require 'flycheck-tip)
(flycheck-tip-use-timer 'verbose)

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
  (shell-command (concat "gnome-terminal -x $HOME/.emacs.d/scripts/terminal_run.sh '" bn "'")))

(defun pdb-ext ()
  "Run a terminal command in an external xterm window."
  (interactive)
  (setq bn (buffer-file-name))
  (shell-command (concat "gnome-terminal -x ~/.emacs.d/scripts/terminal_pdb.sh '" bn "'")))

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

(provide 'python_config)
;;; python_config.el ends here
