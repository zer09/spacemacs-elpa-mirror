;;; mustard-theme.el --- an Emacs 24 theme based on Mustard (tmTheme)
;;
;;; Author: Jason Milkins
;;; Version: 20141116
;; Package-Version: 20141115.2302
;;
;;; Url: https://github.com/emacsfodder/tmtheme-to-deftheme
;;; Package-Requires: ((emacs "24.0"))
;;
;;; Commentary:
;;  This theme was automatically generated by tmtheme-to-deftheme (tm2deftheme),
;;  from Mustard (tmTheme)
;;
;;; Code:

(deftheme mustard
  "mustard-theme - Created by tmtheme-to-deftheme - 2014-11-16 10:26:39 +0800")

(custom-theme-set-variables
 'mustard
)

(custom-theme-set-faces
 'mustard
 ;; basic theming.

 '(default ((t (:foreground "#F8F8F2" :background "#191919" ))))
 '(region  ((t (:background "#224444"))))
 '(cursor  ((t (:background "#F8F8F0"))))

 ;; Temporary defaults
 '(linum                               ((t (:foreground "#464644"  :background "#2f2f2f" ))))
 '(fringe                              ((t (                       :background "#2f2f2f" ))))

 '(minibuffer-prompt                   ((t (:foreground "#1278A8"  :background nil       :weight bold                                  ))))
 '(escape-glyph                        ((t (:foreground "orange"   :background nil                                                     ))))
 '(highlight                           ((t (:foreground "orange"   :background nil                                                     ))))
 '(shadow                              ((t (:foreground "#777777"  :background nil                                                     ))))

 '(trailing-whitespace                 ((t (:foreground "#FFFFFF"  :background "#C74000"                                               ))))
 '(link                                ((t (:foreground "#00b7f0"  :background nil       :underline t                                  ))))
 '(link-visited                        ((t (:foreground "#4488cc"                        :underline t :inherit (link)                  ))))
 '(button                              ((t (:foreground "#FFFFFF"  :background "#444444" :underline t :inherit (link)                  ))))
 '(next-error                          ((t (                                             :inherit (region)                             ))))
 '(query-replace                       ((t (                                             :inherit (isearch)                            ))))
 '(header-line                         ((t (:foreground "#EEEEEE"  :background "#444444" :box nil :inherit (mode-line)                 ))))

 '(mode-line-highlight                 ((t (                                             :box nil                                      ))))
 '(mode-line-emphasis                  ((t (                                             :weight bold                                  ))))
 '(mode-line-buffer-id                 ((t (                                             :box nil :weight bold                         ))))

 '(mode-line-inactive                  ((t (:foreground "#d6d6b2"  :background "#2f2f2f" :box nil :weight light :inherit (mode-line)   ))))
 '(mode-line                           ((t (:foreground "#f8f8f2"  :background "#2f2f2f" :box nil ))))

 '(isearch                             ((t (:foreground "#99ccee"  :background "#444444"                                               ))))
 '(isearch-fail                        ((t (                       :background "#ffaaaa"                                               ))))
 '(lazy-highlight                      ((t (                       :background "#77bbdd"                                               ))))
 '(match                               ((t (                       :background "#3388cc"                                               ))))

 '(tooltip                             ((t (:foreground "black"    :background "LightYellow" :inherit (variable-pitch)                 ))))

 '(js3-function-param-face             ((t (:foreground "#BFC3A9"                                                                      ))))
 '(js3-external-variable-face          ((t (:foreground "#F0B090"  :bold t                                                             ))))

 '(secondary-selection                 ((t (                       :background "#342858"                                               ))))
 '(cua-rectangle                       ((t (:foreground "#E0E4CC"  :background "#342858" ))))

 ;; Magit hightlight
 '(magit-item-highlight                ((t (:foreground "white" :background "#1278A8" :inherit nil ))))

 ;; flyspell-mode
 '(flyspell-incorrect                  ((t (:underline "#AA0000" :background nil :inherit nil ))))
 '(flyspell-duplicate                  ((t (:underline "#009945" :background nil :inherit nil ))))

 ;; flymake-mode
 '(flymake-errline                     ((t (:underline "#AA0000" :background nil :inherit nil ))))
 '(flymake-warnline                    ((t (:underline "#009945" :background nil :inherit nil ))))

 ;;git-gutter
 '(git-gutter:added                    ((t (:foreground "#609f60" :bold t))))
 '(git-gutter:modified                 ((t (:foreground "#3388cc" :bold t))))
 '(git-gutter:deleted                  ((t (:foreground "#cc3333" :bold t))))

 '(diff-added                          ((t (:background "#305030"))))
 '(diff-removed                        ((t (:background "#903010"))))
 '(diff-file-header                    ((t (:background "#362145"))))
 '(diff-context                        ((t (:foreground "#E0E4CC"))))
 '(diff-changed                        ((t (:foreground "#3388cc"))))
 '(diff-hunk-header                    ((t (:background "#242130"))))


 '(font-lock-comment-face ((t (:foreground "#80a78c"  ))))
 '(font-lock-string-face ((t (:foreground "#a1d7f2"  ))))
 '(font-lock-builtin-face ((t (:foreground "#ec691e"  ))))
 '(font-lock-variable-name-face ((t (:foreground "#ecd795"  ))))
 '(font-lock-keyword-face ((t (:foreground "#ec691e"  ))))
 '(font-lock-type-face ((t (:foreground "#f7c527"  :underline t))))
 '(font-lock-function-name-face ((t (:foreground "#f7c527"  ))))
 '(js3-function-param-face ((t (:foreground "#ecd795"  ))))
 '(js2-function-param ((t (:foreground "#ecd795"  ))))
 '(font-lock-warning-face ((t (:foreground "#F8F8F0" :background "#73e4f6" ))))
 '(diff-removed ((t (:foreground "#ec691e"  ))))
 '(diff-added ((t (:foreground "#f7c527"  ))))
 '(diff-changed ((t (:foreground "#a1d7f2"  ))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#80a78c"  ))))

;; Rainbow delimiters
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#a64a15"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#b75217"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#c75919"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#d8611b"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#e36a23"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#e57534"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#e78044"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#e98b55"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#eb9765"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "#FF0000"))))
) ;; End face definitions

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'mustard)

;; Local Variables:
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; mustard-theme.el ends here
