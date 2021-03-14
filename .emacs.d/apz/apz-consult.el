;;; apz-consult.el --- Utilities and commands for consult.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'project)

(defgroup apz-consult ()
  "Utilities and commands for consult.el."
  :group 'minibuffer)

;;;###autoload
(defun apz-consult-ripgrep ()
  "Use `consult-ripgrep'.

If invoked with (\\[universal-argument]) prompt for a directory to search in,
else default to the directory returned from `consult-project-root-function'."
  (interactive)
  (if (eq current-prefix-arg nil)
      (consult-ripgrep)
    (consult-ripgrep t)))

;;;###autoload
(defun apz-consult-find-file ()
  "Use `consult-find'.

If invoked with (\\[universal-argument]) prompt for a directory to search in,
else default to the directory returned from `consult-project-root-function'."
  (interactive)
  (if (eq current-prefix-arg nil)
      (consult-find)
    (consult-find t)))

;;;###autoload
(defun apz-consult-find-current-project-root ()
  "Return the root directory of the current project or the `default-directory'."
  (let ((root (project-current)))
    (if root
      (project-root root)
      default-directory)))

(provide 'apz-consult)
;;; apz-consult.el ends here
