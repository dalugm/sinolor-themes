;;; jinlor-eva-00-theme.el --- Evangelion Unit-00 and Rei Ayanami -*- lexical-binding: t -*-

;;; Commentary:
;;
;; A light theme pairing Unit-00's yellow-orange armor with the cool
;; blue-gray, pearl white, and red accents associated with Rei Ayanami.

;;; Code:

(require 'jinlor)

(defconst jinlor-eva-00-palette
  (jinlor--generate-eva-palette
   '((eva-primary          "#806000")
     (eva-primary-bright   "#956600")
     (eva-secondary        "#a9471b")
     (eva-secondary-bright "#b94f1d")
     (eva-accent           "#ad3850")
     (eva-pilot            "#416d82")
     (eva-neutral          "#334149")
     (bg-main              "#f5f6f2")
     (fg-main              "#26313a")
     (bg-dim               "#e9edef")
     (fg-dim               "#62717b")
     (bg-alt               "#e1e7e9")
     (fg-alt               "#4f6b78")
     (bg-active            "#cbd7dc")
     (bg-inactive          "#edf0ee")
     (red                  "#ad3850")
     (green                "#39745e")
     (yellow               "#806000")
     (blue                 "#416d82")
     (magenta              "#825276")
     (cyan                 "#36747f")
     (bg-mode-line-active  "#d8a62d")
     (fg-mode-line-active  "#29241d")
     (bg-completion        "#e7ddc2")
     (bg-hover             "#efd8cc")
     (bg-hl-line           "#e9eef0")
     (bg-paren             "#dfc477")
     (bg-region            "#d7e3e8")
     (border               "#a8b6bd")
     (fg-intense           "#111820"))
   'cool)
  "Palette for `jinlor-eva-00'.")

(defcustom jinlor-eva-00-palette-overrides nil
  "Overrides for `jinlor-eva-00-palette'."
  :group 'jinlor
  :package-version '(jinlor . "0.5.0")
  :type '(repeat (list symbol (choice symbol string))))

(modus-themes-theme
 'jinlor-eva-00
 'jinlor
 "Evangelion Unit-00 and Rei Ayanami."
 'light
 'modus-themes-operandi-palette
 'jinlor-eva-00-palette
 'jinlor-eva-00-palette-overrides
 'jinlor-custom-faces)

;;; jinlor-eva-00-theme.el ends here
