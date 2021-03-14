;;; apz-flycheck.el --- Utilities for flycheck -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'apz-js)

(defgroup apz-flycheck ()
  "Flycheck related utilities."
  :group 'tools)

;;;###autoload
(defun apz-flycheck-set-local-eslint-executable ()
	"Config flycheck to use local eslint executable."
	(let ((eslint (apz-js-find-local-executable
								 "eslint"
								 (or (buffer-file-name) default-directory))))
		(when eslint
			(setq-local flycheck-javascript-eslint-executable eslint))))

(provide 'apz-flycheck)
;;; apz-flycheck.el ends here
