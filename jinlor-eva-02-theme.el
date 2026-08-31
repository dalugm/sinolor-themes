;;; jinlor-eva-02-theme.el --- Evangelion Unit-02 and Asuka -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Unit-02's red armor dominates this warm theme.  Orange and yellow
;; reproduce its armor details, while a cool blue keeps the palette
;; readable and recalls Asuka's eyes.

;;; Code:

(require 'jinlor)

(defconst jinlor-eva-02-palette
  (jinlor--generate-eva-palette
   '((eva-primary          "#d7353f")
     (eva-primary-bright   "#ff6259")
     (eva-secondary        "#e56f2f")
     (eva-secondary-bright "#f59345")
     (eva-accent           "#f4c34f")
     (eva-pilot            "#75a9d1")
     (eva-neutral          "#f3e8dd")
     (bg-main              "#140a0b")
     (fg-main              "#f2e5df")
     (bg-dim               "#1c1011")
     (fg-dim               "#aa9390")
     (bg-alt               "#2a1416")
     (fg-alt               "#ef9b80")
     (bg-active            "#4a2022")
     (bg-inactive          "#1b0e0f")
     (red                  "#f0524f")
     (green                "#6fb79d")
     (yellow               "#f1c453")
     (blue                 "#6e9ecf")
     (magenta              "#d77b8a")
     (cyan                 "#72bcb4")
     (bg-mode-line-active  "#6b1f24")
     (fg-mode-line-active  "#fff0e8")
     (bg-completion        "#3a171a")
     (bg-hover             "#51321a")
     (bg-hl-line           "#231012")
     (bg-paren             "#8a3c27")
     (bg-region            "#4a1d22")
     (border               "#71383b")
     (fg-intense           "#ffffff"))
   'warm)
  "Palette for `jinlor-eva-02'.")

(defcustom jinlor-eva-02-palette-overrides nil
  "Overrides for `jinlor-eva-02-palette'."
  :group 'jinlor
  :package-version '(jinlor . "0.5.0")
  :type '(repeat (list symbol (choice symbol string))))

(modus-themes-theme
 'jinlor-eva-02
 'jinlor
 "Evangelion Unit-02 and Asuka Shikinami Langley."
 'dark
 'modus-themes-vivendi-palette
 'jinlor-eva-02-palette
 'jinlor-eva-02-palette-overrides
 'jinlor-custom-faces)

;;; jinlor-eva-02-theme.el ends here
