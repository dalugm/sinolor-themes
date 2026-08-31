;;; sinolor-eva-00-theme.el --- Evangelion Unit-00 and Rei Ayanami -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Unit-00's yellow-orange armor is paired with the cool blue-gray,
;; white, and red accents associated with Rei Ayanami.

;;; Code:

(require 'sinolor-themes)

(defconst sinolor-eva-00-palette
  (sinolor-themes--generate-eva-palette
   '((eva-primary          "#d7a72e")
     (eva-primary-bright   "#f1c453")
     (eva-secondary        "#df6b2f")
     (eva-secondary-bright "#f08a46")
     (eva-accent           "#e66a78")
     (eva-pilot            "#8ab4c8")
     (eva-neutral          "#f1f3ee")
     (bg-main              "#0b1118")
     (fg-main              "#e8edf1")
     (bg-dim               "#111a23")
     (fg-dim               "#93a5b2")
     (bg-alt               "#172430")
     (fg-alt               "#b3c9d4")
     (bg-active            "#263c4a")
     (bg-inactive          "#101820")
     (red                  "#e66a78")
     (green                "#72bf9b")
     (yellow               "#e7bd4f")
     (blue                 "#78a9c2")
     (magenta              "#bd87b3")
     (cyan                 "#8fc6d4")
     (bg-mode-line-active  "#273847")
     (fg-mode-line-active  "#f1c453")
     (bg-completion        "#24323c")
     (bg-hover             "#4a331c")
     (bg-hl-line           "#111d27")
     (bg-paren             "#7d5a24")
     (bg-region            "#273b4a")
     (border               "#405665")
     (fg-intense           "#ffffff"))
   'cool)
  "Palette for `sinolor-eva-00'.")

(defcustom sinolor-eva-00-palette-overrides nil
  "Overrides for `sinolor-eva-00-palette'."
  :group 'sinolor-themes
  :package-version '(sinolor-themes . "0.4.0")
  :type '(repeat (list symbol (choice symbol string))))

(modus-themes-theme
 'sinolor-eva-00
 'sinolor-themes
 "Evangelion Unit-00 and Rei Ayanami."
 'dark
 'modus-themes-vivendi-palette
 'sinolor-eva-00-palette
 'sinolor-eva-00-palette-overrides
 'sinolor-themes-custom-faces)

;;; sinolor-eva-00-theme.el ends here
