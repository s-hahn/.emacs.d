;;; .emacs --- config
;;; Commentary:

;;; Code:
(add-to-list 'load-path (concat user-emacs-directory "settings"))
(add-to-list 'load-path "~/.emacs.d/submodules/org-mode/lisp")
(add-to-list 'load-path "~/.emacs.d/submodules/org-mode/contrib/lisp" t)
(add-to-list 'load-path "~/.emacs.d/submodules/org-reveal" t)
(add-to-list 'load-path "~/.emacs.d/submodules/evil-rebellion" t)
(add-to-list 'load-path "~/.emacs.d/submodules/helm-bibtex" t)
(add-to-list 'load-path "~/.emacs.d/submodules/org-ref" t)
(require 'init-packages)

(require-package 'load-relative)
(require 'load-relative)
(require 'package)
(package-initialize)
(require 'indi_config)
(require 'python_config)
(require 'helm_config)
(require 'org_config)
(require 'evilmode_config)
(require 'research_config)

(default_geo_env)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("/home/shahn/Dropbox/shahn/org/diary.org" "/home/shahn/Dropbox/shahn/org/geo.org" "/home/shahn/Dropbox/shahn/org/iceland.org" "/home/shahn/Dropbox/shahn/org/mobileinbox.org" "/home/shahn/Dropbox/shahn/org/private.org" "/home/shahn/Dropbox/shahn/org/refile.org" "/home/shahn/Dropbox/shahn/org/research.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
