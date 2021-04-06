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

(provide 'apz-consult)
;;; apz-consult.el ends here
