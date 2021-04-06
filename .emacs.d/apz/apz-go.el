;;; apz-go.el --- Utilites for go -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defgroup apz-go ()
  "Go related utilities."
  :group 'editing)

;;;###autoload
(defun apz-go-find-project-root (file)
	"Return the root directory of the go project FILE belongs to.

Starting at FILE, look up directory hierarchy for directory containing
a file go.mod. FILE can be a file or a directory.  If it’s a file,
its directory will serve as the starting point for searching the hierarchy
of directories. Stop at the first parent directory containing a file
package.json, and return the directory.  Return nil if not found."
	(locate-dominating-file file "go.mod"))

(provide 'apz-go)
;;; apz-go.el ends here
