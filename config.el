;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Rafael Palomar"
      user-mail-address "palomar.research@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;

;; Org-ref
(setq reftex-default-bibliography '("/home/rafael/Nextcloud/bibliography/references.bib"))

;; see org-ref for use of these variables
(setq org-ref-bibliography-notes "/home/rafael/Nextcloud/bibliography/notes.org"
      org-ref-default-bibliography '("/home/rafael/Nextcloud/bibliography/references.bib")
      org-ref-pdf-directory "/home/rafael/Nextcloud/bibliography/bibtex-pdfs/")

(setq bibtex-completion-bibliography "/home/rafael/Nextcloud/bibliography/references.bib"
      bibtex-completion-library-path "/home/rafael/Nextcloud/bibliography/bibtex-pdfs"
      bibtex-completion-notes-path "/home/rafael/Nextcloud/bibliography/helm-bibtex-notes")

;; open pdf with system pdf viewer (works on mac)
;; (setq bibtex-completion-pdf-open-function
;;   (lambda (fpath)
;;     (start-process "open" "*open*" "open" fpath)))

(setq bibtex-completion-pdf-open-function 'org-open-file)
(key-chord-define-global "kk" 'org-ref-cite-hydra/body)

(setq imagemagick-enabled-types t)
(imagemagick-register-types)
(add-to-list 'image-file-name-extensions "eps")
(setq org-image-actual-width 1400)

;; "monospace" means use the system default. However, the default is usually two
;; points larger than I'd like, so I specify size 12 here.
(setq doom-font (font-spec :family "monospace" :size 16 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "sans" :size 20)
      doom-big-font-increment 12)

(defun c-set-indent-vtk ()
  (interactive)

  (setq c-basic-offset 2)
  (setq c-comment-only-line-offset 0)
  (setq c-indent-comments-syntactically-p t)
  (setq c-electric-pound-behavior '(alignleft))
  (setq indent-tabs-mode nil)

  (c-set-offset 'case-label 0)
  (c-set-offset 'label 0)
  (c-set-offset 'topmost-intro-cont 0)
  (c-set-offset 'block-open '+)
  (c-set-offset 'block-close 0)
  (c-set-offset 'substatement '+)
  (c-set-offset 'substatement-open '+)
  (c-set-offset 'statement-block-intro 0)
  (c-set-offset 'access-label '-)

  (c-set-offset 'string 'c-lineup-dont-change)
  (c-set-offset 'c 'c-lineup-C-comments)
  (c-set-offset 'defun-open 0)
  (c-set-offset 'defun-close 0)
  (c-set-offset 'defun-block-intro '+)
  (c-set-offset 'class-open 0)
  (c-set-offset 'class-close 0)
  (c-set-offset 'inline-open 0)
  (c-set-offset 'inline-close 0)
  (c-set-offset 'func-decl-cont '+)
  (c-set-offset 'knr-argdecl-intro 5)
  (c-set-offset 'knr-argdecl 0)
  (c-set-offset 'topmost-intro 0)
  (c-set-offset 'member-init-intro '+)
  (c-set-offset 'member-init-cont 0)
  (c-set-offset 'inher-intro '+)
  (c-set-offset 'inher-cont 'c-lineup-multi-inher)
  (c-set-offset 'brace-list-open 0)
  (c-set-offset 'brace-list-close 0)
  (c-set-offset 'brace-list-intro '+)
  (c-set-offset 'brace-list-entry 0)
  (c-set-offset 'brace-entry-open 0)
  (c-set-offset 'statement 0)
  (c-set-offset 'statement-cont '+)
  (c-set-offset 'statement-case-intro '+)
  (c-set-offset 'statement-case-open '+)
  (c-set-offset 'do-while-closure 0)
  (c-set-offset 'else-clause 0)
  (c-set-offset 'catch-clause 0)
  (c-set-offset 'comment-intro 'c-lineup-comment)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-cont 'c-lineup-arglist-operators)
  (c-set-offset 'arglist-close 'c-lineup-arglist-operators)
  (c-set-offset 'stream-op 'c-lineup-streamop)
  (c-set-offset 'inclass '+)
  (c-set-offset 'cpp-macro -1000)
  (c-set-offset 'cpp-macro-cont 'c-lineup-dont-change)
  (c-set-offset 'friend 0)
  (c-set-offset 'objc-method-intro -1000)
  (c-set-offset 'objc-method-args-cont 'c-lineup-ObjC-method-args)
  (c-set-offset 'objc-method-call-cont 'c-lineup-ObjC-method-call)
  (c-set-offset 'extern-lang-open 0)
  (c-set-offset 'extern-lang-close 0)
  (c-set-offset 'inextern-lang '+)
  (c-set-offset 'namespace-open 0)
  (c-set-offset 'namespace-close 0)
  (c-set-offset 'innamespace '+)
  (c-set-offset 'template-args-cont '+)
  (c-set-offset 'inlambda 'c-lineup-inexpr-block)
  (c-set-offset 'lambda-intro-cont '+)
  (c-set-offset 'inexpr-statement 0)
  (c-set-offset 'inexpr-class '+)

  (message "VTK indentation."))

(add-hook 'c-mode-common-hook 'c-set-indent-vtk)
