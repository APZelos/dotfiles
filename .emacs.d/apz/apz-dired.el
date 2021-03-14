;;; apz-dired.el --- Utilities and commands for dired.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defgroup apz-dired ()
  "Utilities and commands for dired.el."
  :group 'files)

;;;###autoload
(defun apz-dired-open-dir ()
  "Open Dired to the directory that the current file belongs to.

If invoked with (\\[universal-argument]) prompt for a directory."
  (interactive)
  (if (eq current-prefix-arg nil)
      (dired-jump)
    (dired default-directory)))

(provide 'apz-dired)
;;; apz-dired.el ends here
