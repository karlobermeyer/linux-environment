; .emacs.el file of Karl J. Obermeyer
; Written for GNU Emacs 23.3.1
; To speed emacs loading, compile this file by running
; M-x byte-compile-file

; Path
(add-to-list 'load-path "~/.emacs.d")

; Default major-mode for new buffers
(setq-default major-mode 'text-mode)

; Commenting
(add-hook 'latex-mode-hook (lambda () (setq comment-add 0)))
(add-hook 'python-mode-hook (lambda () (setq comment-add 0)))
(add-hook 'c-mode-hook (lambda () (setq comment-add 0)))
(add-hook 'c++-mode-hook (lambda () (setq comment-add 0)))


; --------------- Google Styles ---------------

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
;(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode)) ; major mode
;(add-hook 'js-mode-hook 'js2-minor-mode) ; minor mode for linting only


; --------------- Appearance ---------------

; Warning: Your init file should contain only one instance each of
; custom-set-variables and custom-set-faces.
(custom-set-variables
 '(column-number-mode t)
 '(doc-view-continuous t)
 '(global-font-lock-mode t nil (font-core))
 '(inhibit-startup-screen t)
 '(safe-local-variable-values (quote ((TeX-master . "main") (TeX-PDF-mode . t))))
 '(show-paren-mode t nil (paren)))
(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "yellow" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(scroll-bar ((t (:background "grey" :foreground "black")))))

(setq inhibit-startup-message t) ;; => no logo appears at beginning of session
(setq default-frame-alist
      '( (foreground-color . "yellow")
         (background-color . "black")
         (default-font . "lucidasanstypewriter-14")))
( setq default-frame-alist
      '( (top . 200) (left . 400)
	 (width . 100) (height . 40) ) ) ; Defaualt 100, 40 for single window.
( setq initial-frame-alist '( (top . 10) (left . 30) ) )

; Set Default Font.
; To find the font name (for the quotes here), select the font you desire from
; the menus, then type M-x describe-font <return> <return>.
(set-frame-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")

; Show filename in title bar
(setq frame-title-format "%b - Emacs")

; Show line numbers
(global-linum-mode 1)

; Scroll speed
( setq mouse-wheel-scroll-amount '(1 ( (shift) . 1) ) ) ;; one line at a time
;(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 2) ;; keyboard scroll one line at a time

; Wrapping / Filling
;(auto-fill-mode 0) ; auto-fill every buffer
(setq-default fill-column 80) ; fill after this many columns
(put 'scroll-left 'disabled nil)
;
;(add-hook 'text-mode-hook 'text-mode-hook-identify) ; tells auto-fill which files are text files
;(add-hook 'text-mode-hook 'turn-on-auto-fill)
;(add-hook 'text-mode-hook 'turn-off-auto-fill)
;
; Vertical line showing 80 chars
(require 'column-rules) ; modified version of fill-column-indicator
;(setq fci-rule-column 80) ; broken, must set manually in column-rules.el
(setq fci-rule-color "lightgrey")
(add-hook 'after-change-major-mode-hook 'fci-mode)
(setq fci-rule-width 2)

; Remove trailing whitespace upon save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; Indentation
(add-hook 'python-mode-hook '(lambda ()
 (setq python-indent 4)))
(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-offset 'arglist-intro '+)
            (c-set-offset 'arglist-close 0)))
; Language-Specific Hooks
;c-mode-hook
;c++-mode-hook
;objc-mode-hook
;java-mode-hook
;idl-mode-hook
;pike-mode-hook
;awk-mode-hook
;ecmascript-mode-hook


; --------------- Hideshow ---------------

; hideshow for programming
;(load-library "hideshow")
(add-hook 'latex-mode-hook 'hs-minor-mode)
;(add-hook 'LaTeX-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'hs-minor-mode-hook
	  (lambda () (local-set-key "\C-cs" 'hs-show-block)))
(add-hook 'hs-minor-mode-hook
	  (lambda () (local-set-key "\C-ch" 'hs-hide-block)))
(add-hook 'hs-minor-mode-hook
	  (lambda () (local-set-key "\C-cS" 'hs-show-all)))
(add-hook 'hs-minor-mode-hook
	  (lambda () (local-set-key "\C-cH" 'hs-hide-all)))

; Use extra mouse button(s) for hideshow toggle.
(global-set-key [mouse-9] 'hs-toggle-hiding)
(global-set-key [mouse-8] 'hs-toggle-hiding)
;(global-set-key [mouse-9] 'hs-show-block)
;(global-set-key [mouse-8] 'hs-hide-block)


; --------------- tabbar mode ---------------

(require 'tabbar)
(tabbar-mode 1)

(defun tabbar-buffer-groups ()
  (list
   (cond
    ((string-equal "*" (substring (buffer-name) 0 1))
     "Emacs Buffer"
     )
    ((eq major-mode 'python-mode)
     "Python"
     )
    ((eq major-mode 'c++-mode)
     "CPP"
     )
    ((eq major-mode 'c-mode)
     "CPP"
     )
    ((eq major-mode 'js2-mode)
     "JSON"
     )
    (t
     "User Buffer"
     )
    )))
(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)

; Key bindings
(global-set-key (kbd "M-.") 'tabbar-forward-tab)
(global-set-key (kbd "C-.") 'tabbar-forward-tab)
(global-set-key (kbd "M-,") 'tabbar-backward-tab)
(global-set-key (kbd "C-,") 'tabbar-backward-tab)
(global-set-key (kbd "C->") 'tabbar-forward-group)
(global-set-key (kbd "C-<") 'tabbar-backward-group)


; --------------- Miscellaneous ---------------

; Periodically revert buffer automatically.
(global-auto-revert-mode 1)

; Don't wrap searches
(setq isearch-wrap-function '(lambda nil))

; Make region commands operate on current line when no region selected
(transient-mark-mode t)
(require 'whole-line-or-region)
(whole-line-or-region-mode)
(defadvice whole-line-or-region-kill-region
    (before whole-line-or-region-kill-read-only-ok activate)
  (interactive "p")
  (unless kill-read-only-ok (barf-if-buffer-read-only)))

; Key bindings
;
;(global-set-key "\er" 'query-replace)
(global-set-key "\er" 'replace-string)
; This snippet makes replace-string case sensitive
(defadvice replace-string (around turn-off-case-fold-search)
  (let ((case-fold-search nil))
    ad-do-it))
(ad-activate 'replace-string)
;
(global-set-key "\eg" 'igrep-find)
(global-set-key "\M-g" 'goto-line)
(fset 'yes-or-no-p 'y-or-n-p) ; make y or n suffice for yes/no question
;(define-key global-map [f3] 'isearch-forward)
;(global-set-key (kbd "C-.") 'next-buffer)
;(global-set-key (kbd "C-,") 'previous-buffer)
(global-set-key (kbd "C-{") 'hs-hide-block)
(global-set-key (kbd "C-}") 'hs-show-block)
(global-set-key (kbd "C-M-{") 'hs-hide-all)
(global-set-key (kbd "C-M-}") 'hs-show-all)
(global-set-key (kbd "C-M-f") 'isearch-forward-regexp)
(define-key global-map [f3] 'goto-line)
(define-key global-map [f4] 'other-window)
(define-key global-map [f5] 'compile)
(define-key global-map [f6] 'indent-region)
(define-key global-map [f7] 'toggle-truncate-lines)
(define-key global-map [f8] "[^a-zA-Z_]")
(define-key global-map [f11] 'bookmark-set)
(define-key global-map [f12] 'bookmark-jump)


; --------------- C++ Stubs ---------------

; c++-if-stub ()
;
(defun c++-if-stub ()
  "Insert C++ if stub"
  (interactive)
  (save-excursion
    (goto-char (point))
    (insert "if ()") (reindent-then-newline-and-indent)
    (insert "{") (reindent-then-newline-and-indent)
    (insert "}") (reindent-then-newline-and-indent)
    (insert "else") (reindent-then-newline-and-indent)
    (insert "{") (reindent-then-newline-and-indent)
    (insert "}") (reindent-then-newline-and-indent)))

; c++-for-stub
;
(defun c++-for-stub ()
  "Insert C++ for stub"
  (interactive)
  (save-excursion
    (goto-char (point))
    (insert "for (;;)") (reindent-then-newline-and-indent)
    (insert "{") (reindent-then-newline-and-indent)
    (insert "}") (reindent-then-newline-and-indent)))

; c++-while-stub
;
(defun c++-while-stub ()
  "Insert C++ while stub"
  (interactive)
  (save-excursion
    (goto-char (point))
    (insert "while ()") (reindent-then-newline-and-indent)
    (insert "{") (reindent-then-newline-and-indent)
    (insert "}") (reindent-then-newline-and-indent)))

; c++-do-while-stub
;
(defun c++-do-while-stub ()
  "Insert C++ do while stub"
  (interactive)
  (save-excursion
    (goto-char (point))
    (insert "do") (reindent-then-newline-and-indent)
    (insert "{") (reindent-then-newline-and-indent)
    (insert "}") (reindent-then-newline-and-indent)
    (insert "while ();") (reindent-then-newline-and-indent)))

; c++-switch-stub
;
(defun c++-switch-stub ()
  "Insert C++ switch stub"
  (interactive)
  (save-excursion
    (goto-char (point))

    (insert "switch ()") (reindent-then-newline-and-indent)
    (insert "{") (reindent-then-newline-and-indent)
    (insert "case 1:") (reindent-then-newline-and-indent)
    (insert "break;") (reindent-then-newline-and-indent)
                      (reindent-then-newline-and-indent)
    (insert "case 2:") (reindent-then-newline-and-indent)
    (insert "break;") (reindent-then-newline-and-indent)
                      (reindent-then-newline-and-indent)
    (insert "default:") (reindent-then-newline-and-indent)
    (insert "break;") (reindent-then-newline-and-indent)
    (insert "}") (reindent-then-newline-and-indent)))

; Stub key bindings
(add-hook 'c-mode-common-hook
	  '(lambda ()

	     ;; Make the fdl style of formatting available.
	     ;;(c-add-style "fdl" fdl-cc-style nil)
	     (local-set-key "\C-xfi" 'c++-if-stub)
	     (local-set-key "\C-xfw" 'c++-while-stub)
	     (local-set-key "\C-xfd" 'c++-do-while-stub)
	     (local-set-key "\C-xfs" 'c++-switch-stub)
	     (local-set-key "\C-xff" 'c++-for-stub)
	     (imenu-add-to-menubar "Functions")
	     )
	  )


; --------------- Tramp ---------------

; TRAMP stands for `Transparent Remote (file) Access, Multiple Protocol'.  It
; allows you to use a local emacs session for editing remote files directly.
(require 'tramp)
(setq tramp-default-method "scp")
;
; To open a file remotely, C-x C-f, then type
; /username@remotehost:foo.text
;
; Use public key authentication if you don't want to enter your password every
; time you open or save a file.


; --------------- Octave / Matlab ---------------

; For Matlab mode using matlab.el
(autoload 'matlab-mode "~/.emacs.d/matlab.el" "Enter Matlab mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
(autoload 'matlab-shell "~/.emacs.d/matlab.el" "Interactive Matlab mode." t)
; Matlab mode options
;(setq matlab-indent-function t) ; indent function bodies
(setq matlab-verify-on-save-flag nil) ; turn off auto-verify on save
(defun my-matlab-mode-hook ()
(setq fill-column 80))		; where auto-fill should wrap
(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)
(defun my-matlab-shell-mode-hook ()
	'())
   (add-hook 'matlab-shell-mode-hook 'my-matlab-shell-mode-hook)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
;
;(setq max-lisp-eval-depth 1000) ; Fixes nesting error?
