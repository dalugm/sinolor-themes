;;; sinolor-light-theme.el --- Light theme

;;; Commentary:
;;
;; Light theme.
;;
;; Color selected from Chinese traditional colors.
;;
;; 月白	#eef7f2
;; 穹灰	#c4d7d6
;; 淡绿灰	#70887d
;;
;; 香叶红	#f07c82
;; 牡丹粉红	#eea2a4
;; 丁香淡紫	#e9d7df
;;
;; 霁青	#63bbd0
;; 群青	#1772b4
;; 鸢尾蓝	#158bb8
;; 瀑布蓝	#51c4d3
;; 远天蓝	#d0dfe6
;;
;; 玉簪绿	#a4cab6
;; 玉髓绿	#41b349
;; 孔雀绿	#229453
;; 田园绿	#83a78d
;;

;;; Code:

(require 'sinolor-themes)

(defgroup sinolor-light-theme nil
  "Options for sinolor-themes"
  :group 'sinolor-themes)

(defcustom sinolor-light-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'sinolor-light-theme
  :type 'boolean)

(defcustom sinolor-light-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'sinolor-light-theme
  :type 'boolean)

(defcustom sinolor-light-comment-bg sinolor-light-brighter-comments
  "If non-nil, comments will have a subtle, darker background.

Enhancing their legibility."
  :group 'sinolor-light-theme
  :type 'boolean)

(defcustom sinolor-light-padded-modeline sinolor-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.

Can be an integer to determine the exact padding."
  :group 'sinolor-light-theme
  :type '(choice integer boolean))

(def-sinolor-theme sinolor-light
  "A derived light theme from `sinolor-dark'."

  ;; name          default   256       16
  ((bg           '("#eef7f2" "#d7ffff" "brightwhite" ))
   (bg-alt       '("#c4d7d6" "#d7d7ff" "white"       ))
   (base0        '("#f07c82" "#d7005f" "red"         ))
   (base1        '("#eea2a4" "#d700af" "magenta"     ))
   (base2        '("#c04851" "#d700ff" "magenta"     ))
   (base3        '("#d0dfe6" "#262626" "white"       ))
   (base4        '("#ee3f4d" "#ff005f" "magenta"     ))
   (base5        '("#70887d" "#3f3f3f" "white"       ))
   (base6        '("#73797e" "#6b6b6b" "magenta"     ))
   (base7        '("#9ca0a4" "#979797" "magenta"     ))
   (base8        '("#DFDFDF" "#dfdfdf" "white"       ))
   (fg           '("#383a42" "#bfbfbf" "brightwhite" ))
   (fg-alt       '("#c6c7c7" "#2d2d2d" "white"       ))

   (grey         '("#b7ae8f" "#3f3f3f" "brightblack"   ))
   (red          '("#de1c31" "#ff6655" "red"           ))
   (orange       '("#fa7e23" "#dd8844" "brightred"     ))
   (green        '("#20894d" "#00ff00" "green"         ))
   (teal         '("#12a182" "#00af00" "brightgreen"   ))
   (yellow       '("#e2d849" "#ffff00" "yellow"        ))
   (blue         '("#51c4d3" "#00afff" "brightblue"    ))
   (dark-blue    '("#10aec2" "#000087" "blue"          ))
   (magenta      '("#8b2671" "#870087" "brightmagenta" ))
   (violet       '("#815c94" "#af87ff" "magenta"       ))
   (cyan         '("#63bbd0" "#00ffff" "brightcyan"    ))
   (dark-cyan    '("#134857" "#00d7ff" "cyan"          ))

   (white        '("#f8f4ed" "#dfdfdf" "white"         ))
   (gold         '("#fed71a" "#ffd700" "yellow"        ))
   (purple       '("#8b2671" "#5f5faf" "brightmagenta" ))
   (bright-green '("#229453" "#00af00" "brightgreen"   ))
   (light-green  '("#68b88e" "#11aa11" "green"         ))
   (light-blue   '("#63bbd0" "#0087ff" "blue"          ))
   (clear-blue   '("#b0d5df" "#00d7ff" "brightblue"    ))
   (deep-blue    '("#1772b4" "#0000ff" "blue"          ))
   (heavy-blue   '("#126e82" "#0000af" "blue"          ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (sinolor-themes--darken base2 0.1))
   (selection      "#10aec2")
   (builtin        light-green)
   (comments       grey)
   (doc-comments   (sinolor-themes--darken comments 0.15))
   (constants      heavy-blue)
   (functions      green)
   (keywords       red)
   (methods        cyan)
   (operators      blue)
   (type           deep-blue)
   (strings        bright-green)
   (variables      green)
   (numbers        orange)
   (region         clear-blue)
   (region-fg      "#46D9FF")
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright sinolor-light-brighter-modeline)
   (-modeline-pad
    (when sinolor-light-padded-modeline
      (if (integerp sinolor-light-padded-modeline) sinolor-light-padded-modeline 4)))

   (modeline-fg     fg)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        (sinolor-themes--lighten blue 0.475)
      `(,(sinolor-themes--lighten (car bg-alt) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (sinolor-themes--lighten blue 0.45)
      `(,(sinolor-themes--lighten (car bg-alt) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   `(,(sinolor-themes--lighten (car bg-alt) 0.1) ,@(cdr bg-alt)))
   (modeline-bg-inactive-l `(,(car bg-alt) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  (((line-number &override) :foreground fg-alt :background bg)
   ((line-number-current-line &override) :foreground fg :background bg)

   (font-lock-comment-face
    :foreground comments
    :background (if sinolor-light-comment-bg (sinolor-themes--lighten bg 0.05)))
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
   (ivy-current-match :underline t :distant-foreground base0 :foreground base4 :weight 'normal)

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; magit
   (magit-diff-hunk-heading :foreground bg :background (sinolor-themes--blend blue bg 0.6) :extend t)
   (magit-diff-hunk-heading-highlight :foreground bg :background blue :weight 'bold :extend t)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (sinolor-themes--lighten base3 0.05))

   ;; info-mode
   (Info-quoted :inherit font-lock-variable-name-face)

   ;; org-mode
   (org-hide             :foreground hidden)
   (org-block            :background base3 :extend t)
   (org-block-begin-line :background (sinolor-themes--lighten base3 0.05) :overline t)
   (org-block-end-line   :background (sinolor-themes--lighten base3 0.05) :underline t))


  ;; --- extra variables ---------------------
  ()
  )

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:

;;; sinolor-light-theme.el ends here
