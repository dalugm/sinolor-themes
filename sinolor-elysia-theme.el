;;; sinolor-elysia-theme.el --- To Romantic Unfailing Elysia -*- lexical-binding: t -*-

;;; Commentary:
;;
;; 春梅红	#f1939c
;; 满江红	#a7535a
;; 丹紫红	#d2568c
;; 唐菖蒲红	#de1c31
;; 尖晶石红	#cc163a
;; 龙利鱼红	#ef632b
;;
;; 姜黄	#e2c027
;; 枯黄	#b78d12
;; 蝶黄	#e2d849
;; 佛手黄	#fed71a
;; 素馨黄	#fccb16
;;
;; 群青	#1772b4
;; 蓝绿	#12a182
;; 晴山蓝	#8fb2c9
;; 瀑布蓝	#51c4d3
;; 玉鈫蓝	#126e82
;; 甸子蓝	#10aec2
;;
;; 月白	#eef7f2
;; 穹灰	#c4d7d6
;; 云峰白	#d8e3e7
;; 古鼎灰	#36292f
;; 暮云灰	#30161c
;; 汉白玉	#f8f4ed
;; 沙鱼灰	#302f4b
;; 隐红灰	#b598a1
;; 大理石灰	#c4cbcf
;;
;; 李紫	#2b1216
;; 紫灰	#5d3f51
;; 蕈紫	#815c94
;; 剑锋紫	#3e3841
;; 暗玉紫	#5c2223
;; 樱草紫	#951c48
;; 淡青紫	#e0c8d1
;; 玫瑰紫	#ba2f7b
;; 菜头紫	#951c48
;; 螺甸紫	#74759b
;; 远山紫	#ccccd6
;; 青莲紫	#8b2671
;; 龙葵紫	#322f3b
;; 暗龙胆紫	#22202e
;; 电气红紫	#c08eaf
;; 野葡萄紫	#4f383e
;;
;; 芽绿	#96c24e
;; 宫殿绿	#20894d
;; 淡灰绿	#ad9e5f
;; 深海绿	#1a6840
;; 玉髓绿	#41b349
;;

;;; Code:


(eval-and-compile
  (require 'sinolor-themes)

;;;###theme-autoload
  (deftheme sinolor-elysia
    "To Romantic Unfailing Elysia."
    :background-mode 'light
    :kind 'color-scheme
    :family 'sinolor)

  (defconst sinolor-elysia-palette
    '(
;;; Basic values

      (bg-main     "#3e3841")
      (fg-main     "#d8e3e7")
      (bg-dim      "#4f383e")
      (fg-dim      "#857f8f")
      (bg-alt      "#5d3f51")
      (fg-alt      "#c08eaf")

      (bg-active   "#4b4b4b")
      (bg-inactive "#5d3f51")

;;; Basic hues for foreground values

      (red             "#ff7359")
      (red-warmer      "#ff656f")
      (red-cooler      "#ff78aa")
      (red-faint       "#e47f72")
      (green           "#20894d")
      (green-warmer    "#80b25f")
      (green-cooler    "#60bf88")
      (green-faint     "#61a06c")
      (yellow          "#e2d849")
      (yellow-warmer   "#ea9955")
      (yellow-cooler   "#f59280")
      (yellow-faint    "#bf9f8f")
      (blue            "#51c4d3")
      (blue-warmer     "#a897ef")
      (blue-cooler     "#7fa5ff")
      (blue-faint      "#7f9ab4")
      (magenta         "#8b2671")
      (magenta-warmer  "#a8456b")
      (magenta-cooler  "#d2568c")
      (magenta-faint   "#ba2f7b")
      (cyan            "#63bbd0")
      (cyan-warmer     "#9ac0e4")
      (cyan-cooler     "#8fcfdf")
      (cyan-faint      "#aac0cf")

;;; Basic hues for background values

      (bg-red-intense     "#bd1f30")
      (bg-green-intense   "#20a020")
      (bg-yellow-intense  "#847020")
      (bg-blue-intense    "#3633b0")
      (bg-magenta-intense "#b04fcf")
      (bg-cyan-intense    "#2270be")

      (bg-red-subtle      "#6a002a")
      (bg-green-subtle    "#00422a")
      (bg-yellow-subtle   "#5a3000")
      (bg-blue-subtle     "#242679")
      (bg-magenta-subtle  "#50105a")
      (bg-cyan-subtle     "#004065")

;;; Diffs

      (bg-added          "#00351f")
      (bg-added-faint    "#002410")
      (bg-added-refine   "#034d2f")
      (fg-added          "#a0e0a0")

      (bg-changed        "#363300")
      (bg-changed-faint  "#2a1f00")
      (bg-changed-refine "#4a4a00")
      (fg-changed        "#efef80")

      (bg-removed        "#510c28")
      (bg-removed-faint  "#340a14")
      (bg-removed-refine "#701a35")
      (fg-removed        "#ffbfbf")

;;; Graphs

      (bg-graph-red-0     "#b52c2c")
      (bg-graph-red-1     "#702020")
      (bg-graph-green-0   "#0fed00")
      (bg-graph-green-1   "#007800")
      (bg-graph-yellow-0  "#f1e00a")
      (bg-graph-yellow-1  "#b08940")
      (bg-graph-blue-0    "#2fafef")
      (bg-graph-blue-1    "#1f2f8f")
      (bg-graph-magenta-0 "#bf94fe")
      (bg-graph-magenta-1 "#5f509f")
      (bg-graph-cyan-0    "#47dfea")
      (bg-graph-cyan-1    "#00808f")

;;; Special hues

      (bg-mode-line       "#5d3f51")
      (fg-mode-line       "#ffcfdf")
      (bg-completion      "#4a1937")
      (bg-hover           "#303f6f")
      (bg-hover-secondary "#66364f")
      (bg-hl-line         "#401f33")
      (bg-paren           "#3f5f75")
      (bg-err             "#3c0f12") ; check with err
      (bg-warning         "#352905") ; check with warning
      (bg-info            "#1a2e00") ; check with info

      (border        "#695960")
      (cursor        "#ff5aaf")
      (fg-intense    "#ffffff")

      (modeline-err     "#ff9f1f")
      (modeline-warning "#c0bf30")
      (modeline-info    "#6fefaf")

      (underline-err     "#df2f2f")
      (underline-warning "#c0b000")
      (underline-info    "#22b022")

      (bg-char-0 "#0050af")
      (bg-char-1 "#7f1f7f")
      (bg-char-2 "#625a00")

;;; Mappings

;;;; General mappings

      (fringe unspecified)

      (err red)
      (warning yellow)
      (info green)

      (link cyan)
      (link-alt magenta)
      (name blue-warmer)
      (keybind blue-cooler)
      (identifier magenta-faint)
      (prompt green-cooler)

      (bg-region "#2a234a")
      (fg-region unspecified)

;;;; Code mappings

      (builtin magenta)
      (comment "#b7ae8f")
      (constant "#815c94")
      (fnname magenta-warmer)
      (keyword magenta-cooler)
      (preprocessor red-warmer)
      (docstring cyan-faint)
      (string "#fed71a")
      (type green-cooler)
      (variable purple)
      (rx-escape green-warmer) ; compare with `string'
      (rx-construct red)

;;;; Accent mappings

      (accent-0 magenta-cooler)
      (accent-1 blue)
      (accent-2 green-cooler)
      (accent-3 red)

;;;; Date mappings

      (date-common green-cooler)
      (date-deadline red-warmer)
      (date-event fg-alt)
      (date-holiday magenta)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow)
      (date-weekday cyan)
      (date-weekend red-faint)

;;;; Prose mappings

      (prose-code magenta-warmer)
      (prose-done green)
      (prose-macro green-cooler)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-table-formula err)
      (prose-tag yellow-faint)
      (prose-todo red-warmer)
      (prose-verbatim blue)

;;;; Mail mappings

      (mail-cite-0 blue)
      (mail-cite-1 magenta-warmer)
      (mail-cite-2 green-cooler)
      (mail-cite-3 yellow-cooler)
      (mail-part magenta-faint)
      (mail-recipient blue-warmer)
      (mail-subject blue-cooler)
      (mail-other cyan)

;;;; Space mappings

      (bg-space unspecified)
      (fg-space border)
      (bg-space-err bg-yellow-intense)

;;;; Tab mappings

      (bg-tab-bar      bg-alt)
      (bg-tab-current  bg-main)
      (bg-tab-other    bg-active)

;;;; Rainbow mappings

      (rainbow-0 green-cooler)
      (rainbow-1 blue)
      (rainbow-2 magenta-warmer)
      (rainbow-3 cyan-cooler)
      (rainbow-4 yellow-cooler)
      (rainbow-5 magenta-cooler)
      (rainbow-6 red-cooler)
      (rainbow-7 green-warmer)
      (rainbow-8 yellow))
    "The `sinolor-elysia' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom  sinolor-elysia-palette-overrides nil
    "Overrides for `sinolor-elysia-palette'.

Mirror the elements of the aforementioned palette, overriding
their value.

For overrides that are shared across all of the Sinolor themes,
refer to `sinolor-themes-common-palette-overrides'.

Theme-specific overrides take precedence over shared overrides.
The idea of common overrides is to change semantic color
mappings, such as to make the cursor red.  Wherea theme-specific
overrides can also be used to change the value of a named color,
such as what hexadecimal RGB value the red-warmer symbol
represents."
    :group 'sinolor-themes
    :package-version '(sinolor-themes . "0.2.0")
    :type '(repeat (list symbol (choice symbol string)))
    :link '(info-link "(sinolor-themes) Palette overrides"))

  (sinolor-themes-theme sinolor-elysia
                        sinolor-elysia-palette
                        sinolor-elysia-palette-overrides)

  (provide-theme 'sinolor-elysia))

;;; sinolor-elysia-theme.el ends here
