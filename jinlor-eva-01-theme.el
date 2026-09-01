;;; jinlor-eva-01-theme.el --- Evangelion Unit-01 and Shinji Ikari -*- lexical-binding: t -*-

;; Copyright (C) 2026 dalu
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:
;;
;; Unit-01's deep purple armor and luminous green details define the
;; theme, with orange armor accents and blue from Shinji's plug suit.

;;; Code:

(require 'jinlor)

(defconst jinlor-eva-01-palette
  (jinlor--generate-eva-palette
   '((eva-primary          "#75409a")
     (eva-primary-bright   "#b084d6")
     (eva-secondary        "#8fcf4f")
     (eva-secondary-bright "#b4ed68")
     (eva-accent           "#f39a3c")
     (eva-pilot            "#72a9e5")
     (eva-neutral          "#ece8f1")
     (bg-main              "#0e0b13")
     (fg-main              "#e8e3ef")
     (bg-dim               "#15101d")
     (fg-dim               "#9c93a7")
     (bg-alt               "#21162e")
     (fg-alt               "#c39be5")
     (bg-active            "#3b2550")
     (bg-inactive          "#17111d")
     (red                  "#ff6173")
     (green                "#a7db62")
     (yellow               "#f2c14e")
     (blue                 "#72a9e5")
     (magenta              "#c785e8")
     (cyan                 "#67c8d0")
     (bg-mode-line-active  "#4a2862")
     (fg-mode-line-active  "#f3edf8")
     (bg-completion        "#2a1c39")
     (bg-hover             "#34491c")
     (bg-hl-line           "#181224")
     (bg-paren             "#4b6a28")
     (bg-region            "#3a2450")
     (border               "#62457b")
     (fg-intense           "#ffffff"))
   'cool)
  "Palette for `jinlor-eva-01'.")

(defcustom jinlor-eva-01-palette-overrides nil
  "Overrides for `jinlor-eva-01-palette'."
  :group 'jinlor
  :package-version '(jinlor . "0.5.0")
  :type '(repeat (list symbol (choice symbol string))))

(modus-themes-theme
 'jinlor-eva-01
 'jinlor
 "Evangelion Unit-01 and Shinji Ikari."
 'dark
 'modus-themes-vivendi-palette
 'jinlor-eva-01-palette
 'jinlor-eva-01-palette-overrides
 'jinlor-custom-faces)

;;; jinlor-eva-01-theme.el ends here
