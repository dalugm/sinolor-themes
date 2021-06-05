;;; sinolor-eva-theme.el --- inspired by Evangelion -*- lexical-binding: t; no-byte-compile: t; -*-

;;; Commentary:
;;
;; A dark theme based on Evangelion.
;;
;; eva-purple	#a877c8
;; eva-ya-purple	#75409A
;; eva-light-purple	#b0a7dc
;; eva-clear-purple	#5e59a9
;; eva-deep-purple	#592661
;;
;; eva-green	#a3da58
;; eva-light-green	#8fed9c
;; eva-deep-green	#506c5c
;;
;; eva-yellow	#f0cf48
;; eva-orange	#f7ba2b
;;
;; eva-red	#ec1f2e
;;
;; eva-black	#070424
;;

;;; Code:

(require 'sinolor-themes)

(defgroup sinolor-eva-theme nil
  "Options for sinolor-themes"
  :group 'sinolor-themes)

(defcustom sinolor-eva-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'sinolor-eva-theme
  :type 'boolean)

(defcustom sinolor-eva-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'sinolor-eva-theme
  :type 'boolean)

(defcustom sinolor-eva-comment-bg sinolor-eva-brighter-comments
  "If non-nil, comments will have a subtle, darker background.
Enhancing their legibility."
  :group 'sinolor-eva-theme
  :type 'boolean)

(defcustom sinolor-eva-padded-modeline sinolor-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'sinolor-eva-theme
  :type '(choice integer boolean))

;;
(def-sinolor-theme sinolor-eva
  "A dark theme inspired by EVANGELION."

  ;; name              default   256       16
  ((bg               '("#040601" "#000000" "black"       ))
   (bg-alt           '("#070424" "#4c4c4c" "brightblack" ))
   (base0            '("#1B2229" "#5b5b5b" "black"       ))
   (base1            '("#1c1f24" "#1e1e1e" "brightblack" ))
   (base2            '("#202328" "#2e2e2e" "brightblack" ))
   (base3            '("#23272e" "#262626" "brightblack" ))
   (base4            '("#3f444a" "#3f3f3f" "brightblack" ))
   (base5            '("#5B6268" "#525252" "brightblack" ))
   (base6            '("#73797e" "#6b6b6b" "brightblack" ))
   (base7            '("#9ca0a4" "#979797" "brightblack" ))
   (base8            '("#DFDFDF" "#dfdfdf" "white"       ))
   (fg               '("#a877c8" "#af87d7" "white"       ))
   (fg-alt           '("#20894d" "#2d2d2d" "brightwhite" ))

   (grey             '("#b7ae8f" "#b2b2b2" "brightblack"   ))
   (red              '("#de1c31" "#ff6655" "red"           ))
   (orange           '("#fa7e23" "#dd8844" "brightred"     ))
   (green            '("#20894d" "#00ff00" "brightgreen"   ))
   (teal             '("#12a182" "#00ff00" "brightblue"    ))
   (yellow           '("#e2d849" "#ffff00" "yellow"        ))
   (blue             '("#51c4d3" "#00afff" "brightblue"    ))
   (dark-blue        '("#10aec2" "#000087" "blue"          ))
   (magenta          '("#8b2671" "#870087" "brightmagenta" ))
   (violet           '("#815c94" "#af87ff" "magenta"       ))
   (cyan             '("#63bbd0" "#00ffff" "brightcyan"    ))
   (dark-cyan        '("#134857" "#00d7ff" "cyan"          ))

   (eva-purple       '("#a17bc2" "#af87d7" "magenta"       ))
   (eva-ya-purple    '("#75409A" "#875faf" "magenta"       ))
   (eva-clear-purple '("#5e59a9" "#8787ff" "magenta"       ))
   (eva-deep-purple  '("#532a5e" "#870087" "magenta"       ))
   (eva-light-purple '("#bfb7e8" "#8787af" "brightmagenta" ))
   (eva-green        '("#a3da58" "#87d700" "brightgreen"   ))
   (eva-light-green  '("#8fed9c" "#87ff87" "brightgreen"   ))
   (eva-deep-green   '("#506c5c" "#87af87" "brightgreen"   ))
   (eva-yellow       '("#f0cf48" "#afaf00" "brightyellow"  ))
   (eva-orange       '("#fd9846" "#d78700" "yellow"        ))
   (eva-red          '("#ec1f2e" "#ff5f5f" "brightred"     ))

   ;; face categories -- required for all themes
   (highlight      eva-green)
   (vertical-bar   (sinolor-themes--darken base1 0.6))
   (selection      fg-alt)
   (builtin        eva-ya-purple)
   (comments       eva-green)
   (doc-comments   eva-light-purple)
   (constants      eva-orange)
   (functions      eva-orange)
   (keywords       eva-green)
   (methods        eva-clear-purple)
   (operators      eva-clear-purple)
   (type           eva-ya-purple)
   (strings        eva-green)
   (variables      eva-purple)
   (numbers        eva-purple)
   (region         eva-deep-purple)
   (region-fg      eva-orange)
   (error          eva-red)
   (warning        eva-yellow)
   (success        eva-green)
   (vc-modified    eva-orange)
   (vc-added       eva-green)
   (vc-deleted     eva-red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright sinolor-eva-brighter-modeline)
   (-modeline-pad
    (when sinolor-eva-padded-modeline
      (if (integerp sinolor-eva-padded-modeline) sinolor-eva-padded-modeline 4)))

   (modeline-fg     fg)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        (sinolor-themes--darken blue 0.475)
      `(,(sinolor-themes--darken (car bg-alt) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (sinolor-themes--darken blue 0.45)
      `(,(sinolor-themes--darken (car bg-alt) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   `(,(sinolor-themes--darken (car bg-alt) 0.1) ,@(cdr bg-alt)))
   (modeline-bg-inactive-l `(,(car bg-alt) ,@(cdr base1))))

  ;; --- extra faces ------------------------
  (((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)

   (match :foreground eva-light-green :background base3)

   ;; Bracket pairing
   ((show-paren-match &override) :foreground nil :background eva-deep-green :bold t)
   ((show-paren-mismatch &override) :foreground nil :background eva-red)

   (font-lock-comment-face
    :foreground comments
    :background (if sinolor-eva-comment-bg (sinolor-themes--lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   ;; git-commit
   (git-commit-summary :foreground eva-green)

   ;; ivy-mode
   (ivy-current-match :background eva-green :distant-foreground base0 :underline t :weight 'normal)
   (ivy-minibuffer-match-face-2
    :inherit 'ivy-minibuffer-match-face-1
    :foreground eva-green :background base1 :weight 'semi-bold)


   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; LaTeX-mode
   (font-latex-math-face :foreground green)

   ;; magit
   (magit-section-heading   :foreground eva-green :weight 'bold :extend t)
   (magit-diff-hunk-heading :foreground bg :background (sinolor-themes--blend eva-green bg 0.6) :extend t)
   (magit-diff-hunk-heading-highlight :foreground bg :background eva-green :weight 'bold :extend t)
   (magit-dimmed :foreground eva-deep-green)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground eva-red)
   ((markdown-code-face &override) :background (sinolor-themes--lighten base3 0.05))

   ;; info-mode
   (Info-quoted :inherit font-lock-variable-name-face)

   ;; org-mode
   (org-hide             :foreground hidden)
   (org-block-begin-line :background (sinolor-themes--lighten base3 0.05) :overline t)
   (org-block-end-line   :background (sinolor-themes--lighten base3 0.05) :underline t)

    )


  ;; --- extra variables ---------------------
  ()
  )

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:

;;; sinolor-eva-theme.el ends here
