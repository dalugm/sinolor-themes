;;; dalu-dark-theme.el --- Dark theme

;;; Commentary:
;;
;; Dark theme.
;;
;; Color selected from Chinese traditional colors.
;;
;; 春梅红	#f1939c
;; 满江红	#a7535a
;; 唐菖蒲红	#de1c31
;; 尖晶石红	#cc163a
;;
;; 蝶黄	#e2d849
;; 姜黄	#e2c027
;; 枯黄	#b78d12
;; 佛手黄	#fed71a
;;
;; 群青	#1772b4
;; 晴山蓝	#8fb2c9
;; 瀑布蓝	#51c4d3
;; 甸子蓝	#10aec2
;;
;; 汉白玉	#f8f4ed
;; 云峰白	#d8e3e7
;; 古鼎灰	#36292f
;; 大理石灰	#c4cbcf
;;
;; 李紫	#2b1216
;; 蕈紫	#815c94
;; 暗玉紫	#22202e
;; 剑锋紫	#3e3841
;; 青莲紫	#8b2671
;; 暗龙胆紫	#22202e
;;
;; 芽绿	#96c24e
;; 玉髓绿	#41b349
;; 宫殿绿	#20894d

;;; Code:

(require 'dalu-themes)

(defgroup dalu-dark-theme nil
  "Options for dalu-themes"
  :group 'dalu-themes)

(defcustom dalu-dark-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'dalu-dark-theme
  :type 'boolean)

(defcustom dalu-dark-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'dalu-dark-theme
  :type 'boolean)

(defcustom dalu-dark-comment-bg dalu-dark-brighter-comments
  "If non-nil, comments will have a subtle, darker background.

Enhancing their legibility."
  :group 'dalu-dark-theme
  :type 'boolean)

(defcustom dalu-dark-padded-modeline dalu-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.

Can be an integer to determine the exact padding."
  :group 'dalu-dark-theme
  :type '(choice integer boolean))

(def-dalu-theme dalu-dark
  "A dark theme modified from `doom-one'."

  ;; name        default   256       16
  ((bg         '("#3e3841" "black"   "black"        ))
   (bg-alt     '("#333333" nil       nil            ))
   (base0      '("#5c2223" "black"   "black"        )) ; matching highlight bg
   (base1      '("#22202e" "#1e1e1e" "brightblack"  )) ; minibuffer selection bg
   (base2      '("#2b1216" "#2e2e2e" "brightblack"  )) ; completion selection bg
   (base3      '("#23272e" "#262626" "brightblack"  )) ; org block bg
   (base4      '("#3f444a" "#3f3f3f" "brightblack"  ))
   (base5      '("#5B6268" "#525252" "brightblack"  ))
   (base6      '("#73797e" "#6b6b6b" "brightblack"  ))
   (base7      '("#9ca0a4" "#979797" "brightblack"  ))
   (base8      '("#DFDFDF" "#dfdfdf" "white"        ))
   (fg         '("#d8e3e7" "#bfbfbf" "brightwhite"  ))
   (fg-alt     '("#1772b4"  "#2d2d2d" "white"       ))

   (white      '("#f8f4ed" "#dfdfdf" "white"))
   (grey       '("#b7ae8f" "#3f3f3f" "brightblack"  ))
   (red        '("#de1c31" "#ff6655" "red"          ))
   (orange     '("#fa7e23" "#dd8844" "brightred"    ))
   (yellow     '("#e2d849" "#ffff00" "yellow"       ))
   (gold       '("#fed71a" "#ffd700" "gold"         ))
   (gold2      '("#e2c027" "#ffd700" "gold2"        ))
   (teal       '("#12a182" "#44b9b1" "brightgreen"  ))
   (blue       '("#1772b4" "#51afef" "brightblue"   ))
   (blue2      '("#8fb2c9" "#00afd7" "brightblue"   ))
   (dark-blue  '("#144a74" "#2257A0" "blue"         ))
   (cyan       '("#63bbd0" "#46D9FF" "brightcyan"   ))
   (dark-cyan  '("#134857" "#5699AF" "cyan"         ))
   (green      '("#20894d" "#99bb66" "green"        ))
   (magenta    '("#7e1671" "#c678dd" "brightmagenta"))
   (violet     '("#815c94" "#a9a1e1" "magenta"      ))

   ;; face categories -- required for all themes
   (highlight      white)
   (vertical-bar   (dalu-themes--darken base1 0.1))
   (selection      dark-blue)
   (builtin        blue2)
    (comments       (if dalu-dark-brighter-comments base7 grey))
   (doc-comments   yellow)
   (constants      violet)
   (functions      gold2)
   (keywords       blue)
   (methods        cyan)
   (operators      "cyan3")
   (type           "#00b8ff")
   (strings        yellow)
   (variables      gold)
   (numbers        orange)
   (region         "#b78d12")
   (region-fg      "#FFF")
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright dalu-dark-brighter-modeline)
   (-modeline-pad
    (when dalu-dark-padded-modeline
      (if (integerp dalu-dark-padded-modeline) dalu-dark-padded-modeline 4)))

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

   ((line-number &override) :foreground fg-alt :background bg)
   ((line-number-current-line &override) :foreground fg :background bg)

   (font-lock-comment-face
    :foreground comments
    :background (if dalu-dark-comment-bg (dalu-themes--lighten bg 0.05)))
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

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (dalu-themes--lighten base3 0.05))

   ;; org-mode
   (org-hide :foreground hidden)
   (org-block-begin-line  :background (dalu-themes--lighten base3 0.05) :overline t)
   (org-block-end-line    :background (dalu-themes--lighten base3 0.05) :underline t)
   (solaire-org-hide-face :foreground hidden))


  ;; --- extra variables ---------------------
  ()
  )

;;; dalu-dark-theme.el ends here
