;;; apz-js.el --- Utilites for javascript -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defgroup apz-js ()
  "Javascript related utilities."
  :group 'editing)

;;;###autoload
(defun apz-js-find-project-root (file)
	"Return the root directory of the Node.js project FILE belongs to.

Starting at FILE, look up directory hierarchy for directory containing
a file package.json. FILE can be a file or a directory.  If it’s a file,
its directory will serve as the starting point for searching the hierarchy
of directories. Stop at the first parent directory containing a file
package.json, and return the directory.  Return nil if not found."
	(locate-dominating-file file "package.json"))
	
;;;###autoload
(defun apz-js-find-node-modules (file)
	"Return the node_modules directory for FILE.

Starting at FILE, look up directory hierarchy for directory containing
a directory node_modules. FILE can be a file or a directory.  If it’s a file,
its directory will serve as the starting point for searching the hierarchy
of directories. Stop at the first parent directory containing a file
node_modules, and return the path to node_modules directory.  Return nil if not found."
	(let ((root (locate-dominating-file
							 file
							 "node_modules")))
		(when root
			(expand-file-name "node_modules" root))))

;;;###autoload
(defun apz-js-find-local-executable (name file)
	"Find the NAME executable in the local node_modules of FILE."
	(let* ((node-modules (apz-js-find-node-modules file))
				 (executable (and node-modules
													(expand-file-name (format ".bin/%s" name) node-modules))))
		(when (and executable (file-executable-p executable))
			executable)))

(provide 'apz-js)
;;; apz-js.el ends here
