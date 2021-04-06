;;; apz-project.el --- Utilites for project.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'apz-js)

(defgroup apz-project ()
  "Utilites for project.el."
  :group 'tools)

;;;###autoload
(defun apz-project-find-current-root ()
  "Return the root directory of the current project or the `default-directory'."
  (let ((root (project-current)))
    (if root
      (project-root root)
      default-directory)))

(cl-defmethod project-root ((project (head nodejs)))
  "Implementation of `project-root' method for nodejs projects."
  (cdr project))

(defun apz-project-try-package-json (file)
  "Check if FILE belongs to a nodejs project."
	(let ((root (apz-js-find-project-root file)))
		(when root
			(cons 'nodejs root))))

(cl-defmethod project-root ((project (head emacs)))
  "Implementation of `project-root' method for Emacs projects."
  (cdr project))

(defun apz-project-try-init-el (file)
  "Check if FILE belongs to Emacs configuration."
	(let ((root (locate-dominating-file file "init.el")))
		(when root
			(cons 'emacs root))))

(cl-defmethod project-root ((project (head nvim)))
  "Implementation of `project-root' method for NeoVim projects."
  (cdr project))

(defun apz-project-try-init-vim (file)
  "Check if FILE belongs to NeoVim configuration."
	(let ((root (locate-dominating-file file "init.vim")))
		(when root
			(cons 'nvim root))))

(provide 'apz-project)
;;; apz-project.el ends here
