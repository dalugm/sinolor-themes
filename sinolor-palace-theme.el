;;; sinolor-palace-theme.el --- The Palace Museum -*- lexical-binding:t -*-

;;; Commentary:
;;
;; 春梅红	#f1939c
;; 满江红	#a7535a
;; 唐菖蒲红	#de1c31
;; 尖晶石红	#cc163a
;;
;; 姜黄	#e2c027
;; 枯黄	#b78d12
;; 蝶黄	#e2d849
;; 佛手黄	#fed71a
;;
;; 群青	#1772b4
;; 景泰蓝	#2775b6
;; 晴山蓝	#8fb2c9
;;
;; 云峰白	#d8e3e7
;; 古鼎灰	#36292f
;; 汉白玉	#f8f4ed
;; 大理石灰	#c4cbcf
;;
;; 蕈紫	#815c94
;; 龙葵紫	#322f3b
;; 暗龙胆紫	#22202e
;;
;; 芽绿	#96c24e
;; 宫殿绿	#20894d
;; 玉髓绿	#41b349
;;

;;; Code:

(eval-and-compile
  (require 'sinolor-themes)

;;;###theme-autoload
  (deftheme sinolor-palace
    "Legible dark theme with magenta and green colors."
    :background-mode 'light
    :kind 'color-scheme
    :family 'ef)

  (defconst sinolor-palace-palette
    '(
;;; Basic values

      (bg-main     "#22202e")
      (fg-main     "#cc163a")
      (bg-dim      "#432e32")
      (fg-dim      "#9d9d9d")
      (bg-alt      "#322f3b")
      (fg-alt      "#1772b4")

      (bg-active   "#6a5862")
      (bg-inactive "#362129")

;;; Basic hues for foreground values

      (red             "#de1c31")
      (red-warmer      "#ff7f5f")
      (red-cooler      "#f0888f")
      (red-faint       "#e89f84")
      (green           "#20894d")
      (green-warmer    "#8ad05a")
      (green-cooler    "#49d081")
      (green-faint     "#9aba8b")
      (yellow          "#e4c53f")
      (yellow-warmer   "#fed71a")
      (yellow-cooler   "#eec26f")
      (yellow-faint    "#b78d12")
      (blue            "#51c4d3")
      (blue-warmer     "#78b2ff")
      (blue-cooler     "#62cff7")
      (blue-faint      "#2775b6")
      (magenta         "#8b2671")
      (magenta-warmer  "#f28fdf")
      (magenta-cooler  "#815c94")
      (magenta-faint   "#c59fdf")
      (cyan            "#63bbd0")
      (cyan-warmer     "#7fc5df")
      (cyan-cooler     "#80dfbf")
      (cyan-faint      "#99bfcf")

;;; Basic hues for background values

      (bg-red-intense     "#bd1f30")
      (bg-green-intense   "#20a420")
      (bg-yellow-intense  "#847020")
      (bg-blue-intense    "#2f5f9f")
      (bg-magenta-intense "#b05fcf")
      (bg-cyan-intense    "#028099")

      (bg-red-subtle      "#70202a")
      (bg-green-subtle    "#105d1a")
      (bg-yellow-subtle   "#625000")
      (bg-blue-subtle     "#143f84")
      (bg-magenta-subtle  "#55407a")
      (bg-cyan-subtle     "#30546f")

;;; Diffs

      (bg-added          "#2f4735")
      (bg-added-faint    "#2a382f")
      (bg-added-refine   "#1d6044")
      (fg-added          "#a0e0a0")

      (bg-changed        "#51512f")
      (bg-changed-faint  "#40332f")
      (bg-changed-refine "#61621f")
      (fg-changed        "#dada90")

      (bg-removed        "#5f252f")
      (bg-removed-faint  "#4a242a")
      (bg-removed-refine "#792d35")
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

      (bg-mode-line       bg-alt)
      (fg-mode-line       fg)
      (bg-completion      "#6e425f")
      (bg-hover           "#3f6a50")
      (bg-hover-secondary "#6a4f5f")
      (bg-hl-line         "#42352f")
      (bg-paren           "#7c454f")
      (bg-err             "#551a05") ; check with err
      (bg-warning         "#4f3f10") ; check with warning
      (bg-info            "#0f4310") ; check with info

      (border        "#6f5f58")
      (cursor        "#ef607a")
      (fg-intense    "#ffffff")

      (modeline-err     "#ffb4ff")
      (modeline-warning "#dfdf43")
      (modeline-info    "#7fefff")

      (underline-err     "#df4f2f")
      (underline-warning "#d4c000")
      (underline-info    "#22b022")

      (bg-char-0 "#0050af")
      (bg-char-1 "#7f1f7f")
      (bg-char-2 "#6f6600")

;;; Mappings

;;;; General mappings

      (fringe unspecified)

      (err red-warmer)
      (warning yellow-warmer)
      (info green)

      (link green)
      (link-alt magenta-cooler)
      (name magenta-warmer)
      (keybind magenta-warmer)
      (identifier green-faint)
      (prompt cyan-cooler)

      (bg-region "#45524a")
      (fg-region unspecified)

;;;; Code mappings

      (builtin magenta-cooler)
      (comment fg-dim)
      (constant magenta-cooler)
      (fnname yellow-warmer)
      (keyword "#12a182")
      (preprocessor red-cooler)
      (docstring yellow-faint)
      (string yellow)
      (type blue-faint)
      (variable yellow-cooler)
      (rx-escape red-cooler) ; compare with `string'
      (rx-construct blue-cooler)

;;;; Accent mappings

      (accent-0 green-warmer)
      (accent-1 magenta-warmer)
      (accent-2 yellow-warmer)
      (accent-3 green-cooler)

;;;; Date mappings

      (date-common magenta-cooler)
      (date-deadline magenta)
      (date-event fg-alt)
      (date-holiday green)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow-cooler)
      (date-weekday magenta-cooler)
      (date-weekend red-cooler)

;;;; Prose mappings

      (prose-code magenta-warmer)
      (prose-done green-cooler)
      (prose-macro red-cooler)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-table-formula info)
      (prose-tag yellow-faint)
      (prose-todo red-warmer)
      (prose-verbatim cyan-cooler)

;;;; Mail mappings

      (mail-cite-0 green-warmer)
      (mail-cite-1 cyan-cooler)
      (mail-cite-2 red-cooler)
      (mail-cite-3 yellow-cooler)
      (mail-part magenta-cooler)
      (mail-recipient magenta)
      (mail-subject green-cooler)
      (mail-other magenta-warmer)

;;;; Space mappings

      (bg-space unspecified)
      (fg-space border)
      (bg-space-err bg-yellow-intense)

;;;; Tab mappings

      (bg-tab-bar      bg-alt)
      (bg-tab-current  bg-main)
      (bg-tab-other    bg-active)

;;;; Rainbow mappings

      (rainbow-0 magenta-warmer)
      (rainbow-1 green-warmer)
      (rainbow-2 magenta)
      (rainbow-3 yellow-cooler)
      (rainbow-4 magenta-cooler)
      (rainbow-5 red-cooler)
      (rainbow-6 green)
      (rainbow-7 yellow-warmer)
      (rainbow-8 cyan-cooler))
    "The `sinolor-palace' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom sinolor-palace-palette-overrides nil
    "Overrides for `sinolor-palace-palette'.

Mirror the elements of the aforementioned palette, overriding
their value.

For overrides that are shared across all of the Ef themes,
refer to `sinolor-themes-common-palette-overrides'.

To preview the palette entries, use `sinolor-themes-preview-colors' or
`sinolor-themes-preview-colors-current' (read the documentation for
further details)."
  :group 'sinolor-themes
  :package-version '(sinolor-themes . "0.2.0")
  :type '(repeat (list symbol (choice symbol string)))
  :link '(info-link "(sinolor-themes) Palette overrides"))

  (sinolor-themes-theme sinolor-palace
                        sinolor-palace-palette
                        sinolor-palace-palette-overrides)

  (provide-theme 'sinolor-palace))

;;; sinolor-palace-theme.el ends here
