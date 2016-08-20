;;; ez-query-replace.el --- a smarter context-sensitive query-replace that can be reapplied

;; Copyright (C) 2013 Wilfred Hughes <me@wilfred.me.uk>
;;
;; Author: Wilfred Hughes <me@wilfred.me.uk>
;; Created: 21 August 2013
;; Version: 0.4
;; Package-Version: 20140810.517
;; Package-Requires: ((dash "1.2.0"))

;;; Commentary:

;; ez-query-replace is a simple wrapper around `query-replace' that adds a
;; default search term, and allows you to conveniently replay old
;; replacements.

;;; Usage:

;; The ez-query-replace commands are autoloaded, so you don't need to
;; (require 'ez-query-replace). Just install ez-query-replace and bind
;; it to your desired keys. I prefer to override the default
;; query-replace bindings:

;; (define-key global-map (kbd "M-%") 'ez-query-replace)
;; (define-key global-map (kbd "C-c M-%") 'ez-query-replace-repeat)

;;; License:

;; This file is not part of GNU Emacs.
;; However, it is distributed under the same license.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(require 'dash)
(require 'thingatpt)

(defun ez-query-replace/dwim-at-point ()
  "If there's an active selection, return that.
Otherwise, get the symbol at point."
  (cond ((use-region-p)
         (buffer-substring-no-properties (region-beginning) (region-end)))
        ((symbol-at-point)
         (substring-no-properties
          (symbol-name (symbol-at-point))))))

(defun ez-query-replace/backward (from-string)
  "If point is on a string we want to replace, try to move back to its beginning.
This ensures that we can replace the current instance, not just future instances
of this string."
  (cond
   ;; If the region is active, the point should be at the start of the region.
   ((use-region-p)
    (goto-char (region-beginning)))
   ;; If we're replacing the symbol at point, just move back to its start.
   ((and
     (symbol-at-point)
     (string-equal (symbol-name (symbol-at-point)) from-string))
    (forward-symbol -1))
   ;; If we're just replacing some text that happens to be at point:
   ;;   foo |bar
   ;; and `from-string' is "foo bar", it's hard to move back the right amount.
   ;; For now, we don't move rather than approximate.
   ;; TODO: Search the buffer for from-string and work out if we should move.
   ))

;; todo: investigate whether we're reinventing the wheel, since query-replace-history already exists
(defvar ez-query-replace/history nil)

;;;###autoload
(defun ez-query-replace ()
  "Replace occurrences of FROM-STRING with TO-STRING, defaulting
to the symbol at point."
  (interactive)
  (let* ((from-string (read-from-minibuffer "Replace what? " (ez-query-replace/dwim-at-point)))
         (to-string (read-from-minibuffer
                     (format "Replace %s with what? " from-string))))

    (ez-query-replace/backward from-string)

    (add-to-list 'ez-query-replace/history
                 (list (format "%s -> %s" from-string to-string)
                       from-string to-string))
    (deactivate-mark)
    (perform-replace from-string to-string t nil nil)))

(eval-when-compile (require 'cl)) ; first, second

;;;###autoload
(defun ez-query-replace-repeat ()
  "Run `ez-query-replace' with an old FROM and TO value."
  (interactive)
  (unless ez-query-replace/history
    (error "You haven't used `ez-query-replace yet"))
  (let* ((choices (mapcar 'first ez-query-replace/history))
         (choice (ido-completing-read "Previous replaces: " choices))
         (from-with-to (cdr (assoc choice ez-query-replace/history)))
         (from-string (first from-with-to))
         (to-string (second from-with-to)))
    (ez-query-replace/backward from-string)

    (deactivate-mark)
    (perform-replace from-string to-string
                   t nil nil)))

(provide 'ez-query-replace)
;;; ez-query-replace.el ends here
