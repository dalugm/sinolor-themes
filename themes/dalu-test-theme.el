;;; dalu-test-theme.el --- inspired by Atom One Dark -*- no-byte-compile: t; -*-

;;; Commentary:
;;
;; for test only.
;;

;;; Code:

(require 'dalu-themes)

(defgroup dalu-test-theme nil
  "Options for dalu-themes"
  :group 'dalu-themes)

(defcustom dalu-test-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'dalu-test-theme
  :type 'boolean)

(defcustom dalu-test-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'dalu-test-theme
  :type 'boolean)

(defcustom dalu-test-comment-bg dalu-test-brighter-comments
  "If non-nil, comments will have a subtle, darker background.

Enhancing their legibility."
  :group 'dalu-test-theme
  :type 'boolean)

(defcustom dalu-test-padded-modeline dalu-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.

Can be an integer to determine the exact padding."
  :group 'dalu-test-theme
  :type '(choice integer boolean))

;;
(def-dalu-theme dalu-test
  "A dark theme inspired by Atom One Dark"

  ;; name        default   256       16
  ((bg         '("#242525" nil       nil            ))
   (bg-alt     '("#333333" nil       nil            ))
   (base0      '("#1B2229" "black"   "black"        ))
   (base1      '("#1c1f24" "#1e1e1e" "brightblack"  ))
   (base2      '("#202328" "#2e2e2e" "brightblack"  ))
   (base3      '("#23272e" "#262626" "brightblack"  ))
   (base4      '("#3f444a" "#3f3f3f" "brightblack"  ))
   (base5      '("#5B6268" "#525252" "brightblack"  ))
   (base6      '("#73797e" "#6b6b6b" "brightblack"  ))
   (base7      '("#9ca0a4" "#979797" "brightblack"  ))
   (base8      '("#DFDFDF" "#dfdfdf" "white"        ))
   (fg         '("#00CE00" "#bfbfbf" "brightwhite"  ))
   (fg-alt     '("green4" "#2d2d2d"  "white"        ))

   (white      '("#f8f4ed" "#dfdfdf" "white"         ))
   (grey       '("#b7ae8f" "#3f3f3f" "brightblack"   ))
   (red        '("#de1c31" "#ff6655" "red"           ))
   (orange     '("#fa7e23" "#dd8844" "brightred"     ))
   (yellow     '("#e2d849" "#ffff00" "yellow"        ))
   (gold       '("#fed71a" "#ffd700" "gold"          ))
   (gold2      '("#e2c027" "#ffd700" "gold2"         ))
   (teal       '("#12a182" "#00ff00" "brightgreen"   ))
   (blue       '("#51c4d3" "#00afff" "brightblue"    ))
   (blue2      '("#8fb2c9" "#0087ff" "brightblue"    ))
   (dark-blue  '("#10aec2" "#000087" "blue"          ))
   (cyan       '("#63bbd0" "#00ffff" "brightcyan"    ))
   (dark-cyan  '("#134857" "#00d7ff" "cyan"          ))
   (green      '("#20894d" "#00ff00" "green"         ))
   (magenta    '("#8b2671" "#870087" "brightmagenta" ))
   (purple     '("#8b2671" "#5f5faf" "brightmagenta" ))
   (violet     '("#815c94" "#af87ff" "magenta"       ))

   ;; face categories -- required for all themes
   (highlight      "green")
   (vertical-bar   (dalu-themes--darken base1 0.1))
   (selection      dark-blue)
   (builtin        "#00b8ff")
   (comments       "#a7a7a7")
   (doc-comments   "#aaaaaa")
   (constants      "#bd00ff")
   (functions      "gold2")
   (keywords       "#004FFF")
   (methods        cyan)
   (operators      "cyan3")
   (type           "#00b8ff")
   (strings        "#DFD67A")
   (variables      "gold2")
   (numbers        orange)
   (region         "#3F90F7")
   (region-fg      "#FFF")
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright dalu-test-brighter-modeline)
   (-modeline-pad
    (when dalu-test-padded-modeline
      (if (integerp dalu-test-padded-modeline) dalu-test-padded-modeline 4)))

   (modeline-fg     fg)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        (dalu-themes--darken blue 0.475)
      `(,(dalu-themes--darken (car bg-alt) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (dalu-themes--darken blue 0.45)
      `(,(dalu-themes--darken (car bg-alt) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   `(,(dalu-themes--darken (car bg-alt) 0.1) ,@(cdr bg-alt)))
   (modeline-bg-inactive-l `(,(car bg-alt) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   (evil-goggles-default-face :inherit 'region :background (dalu-themes--blend region bg 0.5))

   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)

   (font-lock-comment-face
    :foreground comments
    :background (if dalu-test-comment-bg (dalu-themes--lighten bg 0.05)))
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

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; Doom modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground green :weight 'bold)

   ;; ivy-mode
   (ivy-current-match :background dark-blue :distant-foreground base0 :weight 'normal)

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; LaTeX-mode
   (font-latex-math-face :foreground green)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (dalu-themes--lighten base3 0.05))

   ;; org-mode
   (org-hide              :foreground hidden)
   (org-block-begin-line  :background (dalu-themes--lighten base3 0.05) :overline t)
   (org-block-end-line    :background (dalu-themes--lighten base3 0.05) :underline t)
   (solaire-org-hide-face :foreground hidden))


  ;; --- extra variables ---------------------
  ()
  )

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; dalu-test-theme.el ends here
