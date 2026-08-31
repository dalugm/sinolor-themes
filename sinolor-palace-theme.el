;;; sinolor-palace-theme.el --- The Palace Museum -*- lexical-binding: t -*-

;;; Commentary:
;;
;; A dark theme centered on the Palace Museum's red walls and green
;; glazed tiles, with imperial yellow and white marble as accents.

;;; Code:

(require 'sinolor-themes)

(defconst sinolor-palace-palette
  (modus-themes-generate-palette
   '((palace-wall          "#a7535a")
     (palace-wall-bright   "#ef817c")
     (palace-tile          "#20894d")
     (palace-tile-bright   "#77c294")
     (palace-gold          "#e2c027")
     (palace-blue          "#8fb2c9")
     (palace-marble        "#f8f4ed")
     (bg-main              "#1d1617")
     (fg-main              "#efe5db")
     (bg-dim               "#281c1d")
     (fg-dim               "#aa9793")
     (bg-alt               "#382325")
     (fg-alt               "#d7b9aa")
     (bg-active            "#5a3032")
     (bg-inactive          "#24191a")
     (red                  "#ef7a76")
     (green                "#77c294")
     (yellow               "#e2c85a")
     (blue                 "#8fb2c9")
     (magenta              "#d69ab3")
     (cyan                 "#83c4b7")
     (bg-mode-line-active  "#a7535a")
     (fg-mode-line-active  "#fff5e8")
     (bg-completion        "#214833")
     (bg-hover             "#4b5430")
     (bg-hl-line           "#2d2020")
     (bg-paren             "#386246")
     (bg-region            "#4b3731")
     (border               "#75514d")
     (cursor               "#ef817c")
     (fg-intense           "#ffffff"))
   'warm
   nil
   (append
    '((cursor palace-wall-bright)
      (name palace-wall-bright)
      (keybind palace-gold)
      (err red)
      (warning palace-gold)
      (info palace-tile-bright)
      (identifier palace-marble)
      (fg-prompt palace-wall-bright)
      (builtin palace-gold)
      (comment fg-dim)
      (constant palace-gold)
      (fnname palace-wall-bright)
      (fnname-call palace-tile-bright)
      (keyword palace-wall-bright)
      (preprocessor red)
      (docstring palace-tile-bright)
      (string palace-tile-bright)
      (type palace-gold)
      (variable palace-blue)
      (variable-use palace-wall-bright)
      (rx-backslash palace-gold)
      (rx-construct palace-tile-bright)
      (accent-0 palace-wall-bright)
      (accent-1 palace-tile-bright)
      (accent-2 palace-gold)
      (accent-3 palace-blue)
      (fg-link palace-blue)
      (underline-link palace-blue)
      (fg-link-visited magenta)
      (underline-link-visited magenta)
      (prose-code palace-wall-bright)
      (prose-done palace-tile-bright)
      (prose-macro palace-gold)
      (prose-tag palace-blue)
      (prose-todo red)
      (prose-verbatim palace-tile-bright)
      (mail-cite-0 palace-wall-bright)
      (mail-cite-1 palace-tile-bright)
      (mail-cite-2 palace-gold)
      (mail-cite-3 palace-blue)
      (mail-recipient palace-tile-bright)
      (mail-subject palace-wall-bright)
      (mail-other palace-blue))
    sinolor-themes-common-palette-mappings))
  "Palette for `sinolor-palace'.")

(defcustom sinolor-palace-palette-overrides nil
  "Overrides for `sinolor-palace-palette'."
  :group 'sinolor-themes
  :package-version '(sinolor-themes . "0.4.0")
  :type '(repeat (list symbol (choice symbol string))))

(modus-themes-theme
 'sinolor-palace
 'sinolor-themes
 "The Palace Museum."
 'dark
 'modus-themes-vivendi-palette
 'sinolor-palace-palette
 'sinolor-palace-palette-overrides
 'sinolor-themes-custom-faces)

;;; sinolor-palace-theme.el ends here
