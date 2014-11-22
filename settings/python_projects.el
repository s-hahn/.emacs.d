;;; package --- Summary
;;; Commentary:
;;; Code:
(setq venv-location '("~/py27virenv/"))

(defun home_geo_env ()
  "Home geo enviroment."
  (interactive)
  (venv-workon "py27virenv")
  (setenv "PYTHONPATH" "/home/shahn/shahn/workspace/GEO_Python")
  (setq default-directory "/home/shahn/shahn/workspace/GEO_Python"))

(defun work_geo_env ()
  "Work geo enviroment."
  (interactive)
  (venv-workon "py27virenv")
  (setenv "PYTHONPATH" "/IPF/shahn/H/swdvlp/GEO_Python")
  (setq default-directory "/IPF/shahn/H/swdvlp/GEO_Python"))

(provide 'python_projects)
;;; python_projects ends here
