;;; sinolor-dark-theme.el --- Dark theme

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
;; 龙利鱼红	#ef632b
;;
;; 蝶黄	#e2d849
;; 姜黄	#e2c027
;; 枯黄	#b78d12
;; 素馨黄	#fccb16
;; 佛手黄	#fed71a
;;
;; 群青	#1772b4
;; 蓝绿	#12a182
;; 晴山蓝	#8fb2c9
;; 瀑布蓝	#51c4d3
;; 甸子蓝	#10aec2
;; 玉鈫蓝	#126e82
;;
;; 月白	#eef7f2
;; 穹灰	#c4d7d6
;; 汉白玉	#f8f4ed
;; 云峰白	#d8e3e7
;; 古鼎灰	#36292f
;; 隐红灰	#b598a1
;; 暮云灰	#30161c
;; 大理石灰	#c4cbcf
;;
;; 李紫	#2b1216
;; 蕈紫	#815c94
;; 樱草紫	#951c48
;; 螺甸紫	#74759b
;; 玫瑰紫	#ba2f7b
;; 菜头紫	#951c48
;; 淡青紫	#e0c8d1
;; 暗玉紫	#5c2223
;; 龙葵紫	#322f3b
;; 剑锋紫	#3e3841
;; 青莲紫	#8b2671
;; 远山紫	#ccccd6
;; 电气红紫	#c08eaf
;; 暗龙胆紫	#22202e
;; 野葡萄紫	#4f383e
;;
;; 芽绿	#96c24e
;; 淡灰绿	#ad9e5f
;; 玉髓绿	#41b349
;; 宫殿绿	#20894d
;; 深海绿	#1a6840
;;

;;; Code:

(require 'sinolor-themes)

(defgroup sinolor-dark-theme nil
  "Options for sinolor-themes"
  :group 'sinolor-themes)

(defcustom sinolor-dark-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'sinolor-dark-theme
  :type 'boolean)

(defcustom sinolor-dark-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'sinolor-dark-theme
  :type 'boolean)

(defcustom sinolor-dark-comment-bg sinolor-dark-brighter-comments
  "If non-nil, comments will have a subtle, darker background.
Enhancing their legibility."
  :group 'sinolor-dark-theme
  :type 'boolean)

(defcustom sinolor-dark-padded-modeline sinolor-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'sinolor-dark-theme
  :type '(choice integer boolean))

(def-sinolor-theme sinolor-dark
  "A dark theme based on Chinese traditional colors."

  ;; name            default   256       16
  ((bg             '("#3e3841" "#3a3a3a" "black"       ))
   (bg-alt         '("#302f4b" "#4e4e4e" "brightblack" ))
   (base0          '("#322f3b" "#303030" "brightblack" ))
   (base1          '("#36292f" "#1e1e1e" "brightblack" ))
   (base2          '("#2b1216" "#2e2e2e" "brightblack" ))
   (base3          '("#23272e" "#262626" "brightblack" ))
   (base4          '("#3f444a" "#3f3f3f" "brightblack" ))
   (base5          '("#5B6268" "#525252" "brightblack" ))
   (base6          '("#73797e" "#6b6b6b" "brightblack" ))
   (base7          '("#9ca0a4" "#979797" "brightblack" ))
   (base8          '("#eef7f2" "#dfdfdf" "white"       ))
   (fg             '("#d8e3e7" "#bfbfbf" "brightwhite" ))
   (fg-alt         '("#1772b4" "#2d2d2d" "white"       ))

   (grey           '("#b7ae8f" "#b2b2b2" "brightblack"   ))
   (red            '("#de1c31" "#ff6655" "red"           ))
   (orange         '("#fa7e23" "#dd8844" "brightred"     ))
   (green          '("#20894d" "#00ff00" "brightgreen"   ))
   (teal           '("#12a182" "#00ff00" "brightblue"    ))
   (yellow         '("#e2d849" "#ffff00" "yellow"        ))
   (blue           '("#51c4d3" "#00afff" "brightblue"    ))
   (dark-blue      '("#126e82" "#000087" "blue"          ))
   (magenta        '("#8b2671" "#870087" "brightmagenta" ))
   (purple         '("#7e1671" "#5f5faf" "brightmagenta" ))
   (violet         '("#815c94" "#af87ff" "magenta"       ))
   (cyan           '("#63bbd0" "#00ffff" "brightcyan"    ))
   (dark-cyan      '("#134857" "#00d7ff" "cyan"          ))

   (white          '("#f8f4ed" "#dfdfdf" "white"         ))
   (gold           '("#fed71a" "#ffd700" "brightyellow"  ))
   (dark-green     '("#1a3b32" "#005f00" "green"         ))
   (light-magenta  '("#ba2f7b" "#5f5faf" "magenta"       ))
   (clear-magenta  '("#c35691" "#5f5fbf" "magenta"       ))
   (bright-magenta '("#c06f98" "#5f5faf" "brightmagenta" ))
   (dark-magenta   '("#a8456b" "#af87ff" "magenta"       ))
   (heavy-magenta  '("#5c2223" "#5f5faf" "magenta"       ))

   ;; face categories -- required for all themes
   (highlight      white)
   (vertical-bar   (sinolor-themes--darken base1 0.1))
   (selection      dark-blue)
   (builtin        violet)
   (comments       (if sinolor-dark-brighter-comments base7 grey))
   (doc-comments   "#74759b")
   (constants      magenta)
   (functions      dark-magenta)
   (keywords       clear-magenta)
   (methods        cyan)
   (operators      dark-cyan)
   (type           purple)
   (strings        "#e0c8d1")
   (variables      bright-magenta)
   (numbers        orange)
   (region         violet)
   (region-fg      base8)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright sinolor-dark-brighter-modeline)
   (-modeline-pad
    (when sinolor-dark-padded-modeline
      (if (integerp sinolor-dark-padded-modeline) sinolor-dark-padded-modeline 4)))

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
    :background (if sinolor-dark-comment-bg (sinolor-themes--lighten bg 0.05)))
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
   (table-cell :background magenta)

   ;; ivy-mode
   (ivy-current-match :distant-foreground base0 :background base3 :underline t :weight 'normal)

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

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

;;; sinolor-dark-theme.el ends here
