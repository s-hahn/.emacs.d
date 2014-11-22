;;; .emacs --- config
;;; Commentary:

;;; Code:
(add-to-list 'load-path (concat user-emacs-directory "config"))
(require 'init-packages)

(require-package 'load-relative)
(require 'load-relative)
(require 'package)
(package-initialize)
(require 'indi_config)
(require 'org_config)

;;; init.el ends here
