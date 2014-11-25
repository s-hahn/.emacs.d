;;; .emacs --- config
;;; Commentary:

;;; Code:
(add-to-list 'load-path (concat user-emacs-directory "settings"))
(add-to-list 'load-path "~/.emacs.d/submodules/org-mode/lisp")
(add-to-list 'load-path "~/.emacs.d/submodules/org-mode/contrib/lisp" t)
(add-to-list 'load-path "~/.emacs.d/submodules/org-reveal" t)
(add-to-list 'load-path "~/.emacs.d/submodules/evil-rebellion" t)
(require 'init-packages)

(require-package 'load-relative)
(require 'load-relative)
(require 'package)
(package-initialize)
(require 'indi_config)
(require 'evilmode_config)
(require 'python_config)
(require 'helm_config)
(require 'org_config)

(work_geo_env)

;;; init.el ends here
