;;; sinolor-eva-theme.el --- God is in his heaven, all is right with the world -*- lexical-binding: t -*-

;;; Commentary:
;;
;; eva-purple	#a877c8
;; eva-ya-purple	#75409A
;; eva-light-purple	#b0a7dc
;; eva-clear-purple	#5e59a9
;; eva-deep-purple	#592661
;; eva-dark-purple	#070424
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
;; eva-black	#040601
;;

;;; Code:

(require 'sinolor-themes)

(defconst sinolor-eva-palette
  (modus-themes-generate-palette
   '((eva-purple       "#a877c8")
     (eva-ya-purple    "#75409a")
     (eva-light-purple "#b0a7dc")
     (eva-clear-purple "#5e59a9")
     (eva-deep-purple  "#592661")
     (eva-dark-purple  "#070424")
     (eva-green        "#a3da58")
     (eva-light-green  "#8fed9c")
     (eva-deep-green   "#506c5c")
     (eva-yellow       "#f0cf48")
     (eva-orange       "#f7ba2b")
     (eva-red          "#ec1f2e")
     (eva-black        "#040601")
     (bg-main     "#040601")
     (fg-main     "#a877c8")
     (bg-dim      "#070424")
     (fg-dim      "#857f8f")
     (bg-alt      "#2b2b2b")
     (fg-alt      "#20894d")
     (bg-active   "#4b4b4b")
     (bg-inactive "#121212")
     (red            "#ec1f2e")
     (red-warmer     "#f47360")
     (red-cooler     "#ff5a7a")
     (red-faint      "#d56f72")
     (green          "#a3da58")
     (green-warmer   "#6aad0f")
     (green-cooler   "#00a692")
     (green-faint    "#61a06c")
     (yellow         "#f0cf48")
     (yellow-warmer  "#506c5c")
     (yellow-cooler  "#8fed9c")
     (yellow-faint   "#cf9f8f")
     (blue           "#3f95f6")
     (blue-warmer    "#6a9fff")
     (blue-cooler    "#029fff")
     (blue-faint     "#7a94df")
     (magenta        "#d369af")
     (magenta-warmer "#e580ea")
     (magenta-cooler "#af85ff")
     (magenta-faint  "#c58faf")
     (cyan           "#4fbaef")
     (cyan-warmer    "#6fafff")
     (cyan-cooler    "#1dbfcf")
     (cyan-faint     "#8aa0df")
     (bg-red-intense     "#cd2f30")
     (bg-green-intense   "#20a020")
     (bg-yellow-intense  "#8f5040")
     (bg-blue-intense    "#4648d0")
     (bg-magenta-intense "#a050cf")
     (bg-cyan-intense    "#2270be")
     (bg-red-subtle      "#72002a")
     (bg-green-subtle    "#00422a")
     (bg-yellow-subtle   "#603000")
     (bg-blue-subtle     "#242679")
     (bg-magenta-subtle  "#5a105f")
     (bg-cyan-subtle     "#004065")
     (bg-red-nuanced     "#2c0614")
     (bg-green-nuanced   "#001904")
     (bg-yellow-nuanced  "#221000")
     (bg-blue-nuanced    "#0f0e39")
     (bg-magenta-nuanced "#230631")
     (bg-cyan-nuanced    "#041529")
     (bg-added          "#00381f")
     (bg-added-faint    "#002910")
     (bg-added-refine   "#034f2f")
     (fg-added          "#a0e0a0")
     (bg-changed        "#363300")
     (bg-changed-faint  "#2a1f00")
     (bg-changed-refine "#4a4a00")
     (fg-changed        "#efef80")
     (bg-removed        "#4f1119")
     (bg-removed-faint  "#380a0f")
     (bg-removed-refine "#781a1f")
     (fg-removed        "#ffbfbf")
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
     (bg-completion      "#0f2d4a")
     (bg-hover           "#004a5f")
     (bg-hover-secondary "#551f5a")
     (bg-hl-line         "#002435")
     (bg-paren           "#20577a")
     (border        "#4f4f5f")
     (cursor        "#ff76ff")
     (fg-intense    "#ffffff")
     (modeline-err     "#ff80af")
     (modeline-warning "#dfcf33")
     (modeline-info    "#2fc82f")
     (underline-err     "#df2f2f")
     (underline-warning "#c0b000")
     (underline-info    "#22b022"))
   'cool
   nil
   (append
    '((cursor fg-main)
      (name cyan-cooler)
      (keybind blue-cooler)
      (err red)
      (warning yellow-warmer)
      (info green)
      (fg-prompt blue)
      (builtin blue-faint)
      (comment eva-green)
      (constant eva-ya-purple)
      (fnname cyan-warmer)
      (fnname-call cyan-faint)
      (keyword eva-orange)
      (preprocessor blue-faint)
      (docstring eva-green)
      (string eva-green)
      (type green-cooler)
      (variable eva-green)
      (variable-use yellow-faint)
      (rx-backslash green) ; compare with `string'
      (rx-construct fg-main)
      (accent-0 blue-warmer)
      (accent-1 red-cooler)
      (accent-2 green)
      (accent-3 magenta-cooler)
      (fg-link cyan)
      (bg-link unspecified)
      (underline-link blue-warmer)
      (fg-link-visited magenta-cooler)
      (bg-link-visited unspecified)
      (underline-link-visited magenta)
      (mail-cite-0 magenta-warmer)
      (mail-cite-1 cyan-cooler)
      (mail-cite-2 yellow)
      (mail-cite-3 red)
      (mail-recipient blue)
      (mail-subject magenta-cooler)
      (mail-other cyan))
    sinolor-themes-common-palette-mappings))
  "The `sinolor-eva' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

(defcustom sinolor-eva-palette-overrides nil
  "Overrides for `sinolor-eva-palette'.

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
  :package-version '(sinolor-themes . "0.3.0")
  :type '(repeat (list symbol (choice symbol string))))

(modus-themes-theme
 'sinolor-eva
 'sinolor-themes
 "Evagelion test type 01."
 'dark
 'modus-vivendi-palette
 'sinolor-eva-palette
 'sinolor-eva-palette-overrides
 'sinolor-themes-custom-faces)

;;; sinolor-eva-theme.el ends here
