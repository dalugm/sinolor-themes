;;; sinolor-green-theme.el --- inspired by green-is-the-new-black

;;; Commentary:
;;
;; A theme with blackened green colors.
;;
;; 毛绿	#66c18c
;; 水绿	#8cc269
;; 竹绿	#1ba784
;; 绿灰	#314a43
;; 苍绿	#223e36
;; 云杉绿	#15231b
;; 宫殿绿	#20894d
;; 松霜绿	#83a78d
;; 深海绿	#1a3b32
;; 瓦松绿	#6e8b74
;; 甘蓝绿	#15231b
;; 莽丛绿	#141e1b
;; 飞泉绿	#497568
;;

;;; Code:

(require 'sinolor-themes)

(defgroup sinolor-green-theme nil
  "Options for sinolor-themes"
  :group 'sinolor-themes)

(defcustom sinolor-green-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'sinolor-green-theme
  :type 'boolean)

(defcustom sinolor-green-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'sinolor-green-theme
  :type 'boolean)

(defcustom sinolor-green-comment-bg sinolor-green-brighter-comments
  "If non-nil, comments will have a subtle, darker background.

Enhancing their legibility."
  :group 'sinolor-green-theme
  :type 'boolean)

(defcustom sinolor-green-padded-modeline sinolor-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.

Can be an integer to determine the exact padding."
  :group 'sinolor-green-theme
  :type '(choice integer boolean))

;;
(def-sinolor-theme sinolor-green
  "A dark theme inspired by `green-is-the-new-black'."

  ;; name          default   256       16
  ((bg           '("#141e1b" "#3a3a3a" "black"       ))
   (bg-alt       '("#1f2623" "#7f7f7f" "brightblack" ))
   (base0        '("#1B2229" "#5b5b5b" "black"       ))
   (base1        '("#1c1f24" "#1e1e1e" "brightblack" ))
   (base2        '("#202328" "#2e2e2e" "brightblack" ))
   (base3        '("#23272e" "#262626" "brightblack" ))
   (base4        '("#3f444a" "#3f3f3f" "brightblack" ))
   (base5        '("#5B6268" "#525252" "brightblack" ))
   (base6        '("#73797e" "#6b6b6b" "brightblack" ))
   (base7        '("#9ca0a4" "#979797" "brightblack" ))
   (base8        '("#DFDFDF" "#dfdfdf" "white"       ))
   (fg           '("#1ba784" "#bfbfbf" "green"       ))
   (fg-alt       '("#20894d" "#2d2d2d" "brightgreen" ))

   (grey         '("#b7ae8f" "#b2b2b2" "brightblack"   ))
   (red          '("#de1c31" "#ff6655" "red"           ))
   (orange       '("#fa7e23" "#dd8844" "brightred"     ))
   (green        '("#20894d" "#00ff00" "brightgreen"   ))
   (teal         '("#12a182" "#00ff00" "brightblue"    ))
   (yellow       '("#e2d849" "#ffff00" "yellow"        ))
   (blue         '("#51c4d3" "#00afff" "brightblue"    ))
   (dark-blue    '("#10aec2" "#000087" "blue"          ))
   (magenta      '("#8b2671" "#870087" "brightmagenta" ))
   (violet       '("#815c94" "#af87ff" "magenta"       ))
   (cyan         '("#63bbd0" "#00ffff" "brightcyan"    ))
   (dark-cyan    '("#134857" "#00d7ff" "cyan"          ))

   (bright-green  '("#41b349" "#00ff11" "brightgreen" ))
   (bright-green2 '("#8cc269" "#00ff44" "brightgreen" ))
   (clear-green   '("#1ba784" "#00ff22" "brightgreen" ))
   (light-green   '("#66c18c" "#00ff33" "green"       ))
   (light-green2  '("#497568" "#00ff33" "green"       ))
   (heavy-green   '("#314a43" "#006f00" "green"       ))
   (dark-green    '("#1a3b32" "#005f00" "green"       ))
   (deep-green    '("#83a78d" "#005f00" "green"       ))
   (deep-green2   '("#6e8b74" "#005f00" "green"       ))

   ;; face categories -- required for all themes
   (highlight      green)
   (vertical-bar   (sinolor-themes--darken base1 0.6))
   (selection      fg-alt)
   (builtin        deep-green2)
   (comments       light-green2)
   (doc-comments   deep-green)
   (constants      deep-green2)
   (functions      bright-green)
   (keywords       green)
   (methods        cyan)
   (operators      light-green2)
   (type           clear-green)
   (strings        light-green)
   (variables      bright-green2)
   (numbers        orange)
   (region         dark-green)
   (region-fg      light-green)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright sinolor-green-brighter-modeline)
   (-modeline-pad
    (when sinolor-green-padded-modeline
      (if (integerp sinolor-green-padded-modeline) sinolor-green-padded-modeline 4)))

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

   (font-lock-comment-face
    :foreground comments
    :background (if sinolor-green-comment-bg (sinolor-themes--lighten bg 0.05)))
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
    (git-commit-summary :foreground light-green)

   ;; ivy-mode
   (ivy-current-match :background heavy-green :distant-foreground base0 :underline t :weight 'normal)
   (ivy-minibuffer-match-face-2
    :inherit 'ivy-minibuffer-match-face-1
    :foreground light-green :background base1 :weight 'semi-bold)

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; LaTeX-mode
   (font-latex-math-face :foreground green)

   ;; magit
   (magit-diff-hunk-heading :foreground bg :background (sinolor-themes--blend green bg 0.6) :extend t)
   (magit-diff-hunk-heading-highlight :foreground bg :background green :weight 'bold :extend t)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (sinolor-themes--lighten base3 0.05))

   ;; info-mode
   (Info-quoted :inherit font-lock-variable-name-face)

   ;; org-mode
   (org-hide             :foreground hidden)
   (org-block-begin-line :background (sinolor-themes--lighten base3 0.05) :overline t)
   (org-block-end-line   :background (sinolor-themes--lighten base3 0.05) :underline t))


  ;; --- extra variables ---------------------
  ()
  )

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:

;;; sinolor-green-theme.el ends here
