;;; apz-keybinding.el --- Helpers for configuring key bindings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defgroup apz-keybinding ()
  "Helpers for configuring key bindings."
  :group 'tools)

(defun apz-keybinding-global (key-sequence command &optional description)
  "Give KEY-SEQUENCE a global binding as COMMAND.

Optional third argument DESCRIPTION is used for which-key description."
  (global-set-key (kbd key-sequence) command)
  (when description (which-key-add-key-based-replacements key-sequence description)))

(defun apz-keybinding-define-map (keymap key-sequence command &optional description)
  "Give KEY-SEQUENCE a binding as COMMAND under active KEYMAP.

Optional third argument DESCRIPTION is used for which-key description."
  (define-key keymap (kbd key-sequence) command)
  (when description (which-key-add-key-based-replacements key-sequence description)))

(provide 'apz-keybinding)
;;; apz-keybinding.el ends here
