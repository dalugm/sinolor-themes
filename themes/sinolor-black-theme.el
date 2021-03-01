;;; sinolor-black-theme.el --- Black theme

;;; Commentary:
;;
;; Black theme.
;;
;; 月影白	#c0c4c3
;; 夏云灰	#617172
;;
;; 赭石	#862617
;;
;; 苍黄	#806332
;;
;; 貂紫	#815c94
;;
;; 暗海水绿	#584717
;;

;;; Code:

(require 'sinolor-themes)

(defgroup sinolor-black-theme nil
  "Options for sinolor-themes"
  :group 'sinolor-themes)

(defcustom sinolor-black-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'sinolor-black-theme
  :type 'boolean)

(defcustom sinolor-black-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'sinolor-black-theme
  :type 'boolean)

(defcustom sinolor-black-comment-bg sinolor-black-brighter-comments
  "If non-nil, comments will have a subtle, darker background.

Enhancing their legibility."
  :group 'sinolor-black-theme
  :type 'boolean)

(defcustom sinolor-black-padded-modeline sinolor-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.

Can be an integer to determine the exact padding."
  :group 'sinolor-black-theme
  :type '(choice integer boolean))

(def-sinolor-theme sinolor-black
  "A derived dark theme from `sinolor-dark'."

  ;; name        default   256       16
  ((bg         '("#000000" "black"   "black"        ))
   (bg-alt     '("#333333" "#7f7f7f" "brightblack"  ))
   (base0      '("#1B2229" "black"   "black"        ))
   (base1      '("#ef632b" "#d75f00" "brightyellow" ))
   (base2      '("#202328" "#2e2e2e" "brightblack"  ))
   (base3      '("#23272e" "#262626" "brightblack"  ))
   (base4      '("#3f444a" "#3f3f3f" "brightblack"  ))
   (base5      '("#5B6268" "#525252" "brightblack"  ))
   (base6      '("#73797e" "#6b6b6b" "brightblack"  ))
   (base7      '("#9ca0a4" "#979797" "brightblack"  ))
   (base8      '("#eef7f2" "#dfdfdf" "white"        ))
   (fg         '("#617172" "#bfbfbf" "brightwhite"  ))
   (fg-alt     '("#1772b4" "#2d2d2d" "white"        ))

   (grey       '("#b7ae8f" "#b2b2b2" "brightblack"   ))
   (red        '("#862617" "#ff6655" "red"           ))
   (orange     '("#fa7e23" "#dd8844" "brightred"     ))
   (green      '("#20894d" "#00ff00" "brightgreen"   ))
   (teal       '("#12a182" "#00ff00" "brightblue"    ))
   (yellow     '("#806332" "#ffff00" "yellow"        ))
   (blue       '("#51c4d3" "#00afff" "brightblue"    ))
   (dark-blue  '("#21373d" "#000087" "blue"          ))
   (magenta    '("#8b2671" "#870087" "brightmagenta" ))
   (violet     '("#5d3131" "#af87ff" "magenta"       ))
   (cyan       '("#134857" "#00ffff" "brightcyan"    ))
   (dark-cyan  '("#132c33" "#00d7ff" "cyan"          ))

   (white       '("#f8f4ed" "#dfdfdf" "white"        ))
   (clear-white '("#eef7f2" "#dadada" "brightwhite"  ))
   (deep-white  '("#c0c4c3" "#d1d1d1" "white"        ))
   (deep-red    '("#cf7543" "#ffd700" "brightyellow" ))
   (dark-green  '("#1a3b32" "#005f00" "green"        ))
   (deep-green  '("#584717" "#003f00" "green"        ))

   ;; face categories -- required for all themes
   (highlight      deep-white)
   (vertical-bar   (sinolor-themes--darken base1 0.1))
   (selection      dark-blue)
   (builtin        dark-green)
   (comments       grey)
   (doc-comments   deep-green)
   (constants      violet)
   (functions      deep-red)
   (keywords       yellow)
   (methods        cyan)
   (operators      cyan)
   (type           red)
   (strings        yellow)
   (variables      deep-red)
   (numbers        orange)
   (region         base3)
   (region-fg      clear-white)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden `(,(car bg) "black" "black"))
   (-modeline-bright sinolor-black-brighter-modeline)
   (-modeline-pad
    (when sinolor-black-padded-modeline
      (if (integerp sinolor-black-padded-modeline) sinolor-black-padded-modeline 4)))

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
  (((line-number &override) :foreground fg-alt :background bg)
   ((line-number-current-line &override) :foreground fg :background bg)

   (font-lock-comment-face
    :foreground comments
    :background (if sinolor-black-comment-bg (sinolor-themes--lighten bg 0.05)))
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

   ;; table
   (table-cell :background grey)

   ;; ivy-mode
   (ivy-current-match :underline t :distant-foreground base0 :foreground base1 :weight 'normal)

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property :foreground green)
   (css-selector :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground blue)
   ((markdown-code-face &override) :background (sinolor-themes--lighten bg 0.05))

   ;; info-mode
   (Info-quoted :inherit font-lock-variable-name-face)

   ;; org-mode
   (org-hide :foreground hidden)
   (org-block-begin-line :background (sinolor-themes--lighten bg 0.05) :overline t)
   (org-block-end-line   :background (sinolor-themes--lighten bg 0.05) :underline t))


  ;; --- extra variables ---------------------
  ()
  )

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:

;;; sinolor-black-theme.el ends here
