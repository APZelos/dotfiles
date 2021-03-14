;;; early-init.el --- Early init file -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Do not to load any packages before starting up
(setq package-enable-at-startup nil)
;; Do not resize the frame at this early stage.
(setq frame-inhibit-implied-resize t)

;; Disable GUI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)
(setq-default
  inhibit-splash-screen t
  initial-scratch-message ""
  use-dialog-box t
  use-file-dialog nil)

;;;; early-init.el ends here
