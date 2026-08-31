;;; sinolor-themes.el --- Themes using traditional Chinese colors -*- lexical-binding: t -*-

;; Author: dalu <mou.tong@qq.com>
;; Maintainer: dalu <mou.tong@qq.com>
;; URL: https://github.com/dalugm/sinolor-themes
;; Version: 0.4.0
;; Package-Requires: ((emacs "30.1") (modus-themes "5.2.0"))
;; Keywords: faces, theme, accessibility

;; This file is NOT part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; The `sinolor-themes' is a collection of light and dark themes whose
;; goal is to provide colorful ("pretty") yet legible options for
;; users who want something with some traditional Chinese feelings.
;;
;; "Sinolor" is a combined word (sino + color), to denote this package
;; mainly use Chinese colors as the color reference.

;;; Code:

(require 'modus-themes)
(eval-when-compile (require 'subr-x))

;;;; Basics for building on top of Sinolor

(defgroup sinolor-themes ()
  "Colorful and legible themes."
  :group 'faces
  :group 'modus-themes
  :link '(url-link :tag "Website" "https://github.com/dalugm/sinolor-themes")
  :prefix "sinolor-themes-"
  :tag "Sinolor Themes")

(defconst sinolor-themes-light-themes
  '()
  "List of symbols with the light Sinolor themes.")

(defconst sinolor-themes-dark-themes
  '(sinolor-elysia
    sinolor-eva-00
    sinolor-eva-01
    sinolor-eva-02
    sinolor-palace)
  "List of symbols with the dark Sinolor themes.")

(defconst sinolor-themes-items
  (append sinolor-themes-light-themes sinolor-themes-dark-themes)
  "Symbols of all the Sinolor themes.")

(defconst sinolor-themes-common-palette-mappings
  '((bg-diff-context bg-dim)

    (fg-region unspecified)

    (fringe bg-dim)

    (docmarkup constant)
    (property variable)

    (date-common cyan-warmer)
    (date-deadline red)
    (date-event fg-alt)
    (date-holiday red-cooler)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled red-cooler)
    (date-weekday cyan-warmer)
    (date-weekend red)

    (bg-prompt unspecified)

    (fg-line-number-inactive fg-dim)
    (fg-line-number-active fg-main)
    (bg-line-number-inactive unspecified)
    (bg-line-number-active unspecified)

    (fg-completion-match-0 red-warmer)
    (fg-completion-match-1 cyan)
    (fg-completion-match-2 green-cooler)
    (fg-completion-match-3 magenta-cooler)

    (rainbow-1 blue-cooler)
    (rainbow-2 yellow-cooler)
    (rainbow-3 magenta-cooler)
    (rainbow-4 red-faint)
    (rainbow-5 green-warmer)
    (rainbow-6 cyan-cooler)
    (rainbow-7 blue-faint)
    (rainbow-8 magenta-warmer)

    (bg-tab-bar bg-alt)
    (bg-tab-current bg-main)
    (bg-tab-other bg-active)

    (bg-space unspecified)
    (fg-space border)
    (bg-space-err bg-red-intense)

    (bg-search-current bg-magenta-intense)
    (bg-search-lazy bg-cyan-intense)
    (bg-search-static bg-yellow-subtle)
    (bg-search-replace bg-red-intense)

    (fg-search-current fg-main)
    (fg-search-lazy fg-main)
    (fg-search-static fg-main)
    (fg-search-replace fg-main)

    (bg-search-rx-group-0 bg-blue-intense)
    (bg-search-rx-group-1 bg-yellow-intense)
    (bg-search-rx-group-2 bg-green-subtle)
    (bg-search-rx-group-3 bg-magenta-subtle)

    (fg-search-rx-group-0 fg-main)
    (fg-search-rx-group-1 fg-main)
    (fg-search-rx-group-2 fg-main)
    (fg-search-rx-group-3 fg-main)

    (fg-prose-code cyan-cooler)
    (fg-prose-macro green-warmer)
    (fg-prose-verbatim magenta-warmer)

    (fg-heading-0 rainbow-0)
    (fg-heading-1 rainbow-1)
    (fg-heading-2 rainbow-2)
    (fg-heading-3 rainbow-3)
    (fg-heading-4 rainbow-4)
    (fg-heading-5 rainbow-5)
    (fg-heading-6 rainbow-6)
    (fg-heading-7 rainbow-7)
    (fg-heading-8 rainbow-8))
  "Common palette mappings for the Sinolor themes.")

(defconst sinolor-themes--eva-palette-mappings
  '((cursor eva-secondary-bright)
    (name eva-primary-bright)
    (keybind eva-accent)
    (err red)
    (warning eva-accent)
    (info eva-secondary)
    (identifier eva-neutral)
    (fg-prompt eva-secondary-bright)
    (builtin eva-primary-bright)
    (comment fg-dim)
    (constant eva-primary-bright)
    (fnname eva-pilot)
    (fnname-call blue-warmer)
    (keyword eva-accent)
    (preprocessor eva-primary)
    (docstring eva-secondary)
    (string eva-secondary-bright)
    (type eva-pilot)
    (variable eva-primary-bright)
    (variable-use eva-accent)
    (rx-backslash eva-secondary)
    (rx-construct eva-primary)
    (accent-0 eva-primary-bright)
    (accent-1 eva-secondary-bright)
    (accent-2 eva-accent)
    (accent-3 eva-pilot)
    (fg-link eva-pilot)
    (underline-link eva-pilot)
    (fg-link-visited eva-primary-bright)
    (underline-link-visited eva-primary-bright)
    (mail-cite-0 eva-primary-bright)
    (mail-cite-1 eva-secondary-bright)
    (mail-cite-2 eva-pilot)
    (mail-cite-3 eva-accent)
    (mail-recipient eva-pilot)
    (mail-subject eva-primary-bright)
    (mail-other eva-secondary)
    (prose-verbatim eva-neutral))
  "Palette mappings shared by the Evangelion themes.")

(defun sinolor-themes--generate-eva-palette (base-colors temperature)
  "Generate an Evangelion palette from BASE-COLORS and TEMPERATURE."
  (modus-themes-generate-palette
   base-colors
   temperature
   nil
   (append sinolor-themes--eva-palette-mappings
           sinolor-themes-common-palette-mappings)))

(defconst sinolor-themes-custom-faces
  '(
    `(company-tooltip ((,c :background ,bg-alt)))
    `(corfu-default ((,c :background ,bg-alt)))
    `(magit-section-highlight ((,c :background ,bg-alt)))
    `(magit-diff-file-heading-highlight ((,c :inherit magit-diff-file-heading :background ,bg-alt)))
    `(mode-line
      ((default :inherit modus-themes-ui-variable-pitch
                :background ,bg-mode-line-active
                :foreground ,fg-mode-line-active)
       (((supports :box t))
        :box (:color ,border-mode-line-active :style released-button))
       (t :underline ,border-mode-line-active)))
    `(mode-line-active
      ((default :inherit modus-themes-ui-variable-pitch
                :background ,bg-mode-line-active
                :foreground ,fg-mode-line-active)
       (((supports :box t))
        :box (:color ,border-mode-line-active :style released-button))
       (t :underline ,border-mode-line-active)))))

(defconst sinolor-themes-with-properties
  '((sinolor-eva-00
     sinolor-themes "Evangelion Unit-00 and Rei Ayanami." dark
     modus-themes-vivendi-palette
     sinolor-eva-00-palette sinolor-eva-00-palette-overrides)
    (sinolor-eva-01
     sinolor-themes "Evangelion Unit-01 and Shinji Ikari." dark
     modus-themes-vivendi-palette
     sinolor-eva-01-palette sinolor-eva-01-palette-overrides)
    (sinolor-eva-02
     sinolor-themes "Evangelion Unit-02 and Asuka Shikinami Langley." dark
     modus-themes-vivendi-palette
     sinolor-eva-02-palette sinolor-eva-02-palette-overrides)
    (sinolor-palace
     sinolor-themes "The Palace Museum." dark
     modus-themes-vivendi-palette
     sinolor-palace-palette sinolor-palace-palette-overrides)
    (sinolor-elysia
     sinolor-themes "To Romantic Unfailing Elysia" dark
     modus-themes-vivendi-palette
     sinolor-elysia-palette sinolor-elysia-palette-overrides)))

(defvar sinolor-themes--declared nil)

(defun sinolor-themes-declare-themes ()
  "Declare the Sinolor themes."
  (unless sinolor-themes--declared
    (dolist (theme sinolor-themes-with-properties)
      (apply #'modus-themes-declare theme)
      (modus-themes-register (car theme)))
    (setq sinolor-themes--declared t)))

(sinolor-themes-declare-themes)

;;;; Limit the Modus themes to only Sinolor themes

;;;###autoload
(define-minor-mode sinolor-themes-take-over-modus-themes-mode
  "When enabled, all Modus themes commands consider only Sinolor themes.
Alternatively, use the commands `sinolor-themes-rotate',
`sinolor-themes-select', `sinolor-themes-load-random',
`sinolor-themes-load-random-dark', `sinolor-themes-load-random-light',
`sinolor-themes-list-colors', `sinolor-themes-list-colors-current'.
They are all designed to only consider Sinolor themes."
  :global t
  :init-value nil)

(cl-defmethod modus-themes-get-themes (&context (sinolor-themes-take-over-modus-themes-mode (eql t)))
  "Return Sinolor themes when takeover mode is active.
This applies when SINOLOR-THEMES-TAKE-OVER-MODUS-THEMES-MODE is non-nil."
  (if-let* ((themes (modus-themes-get-all-known-themes 'sinolor-themes))
            (sorted-a-z (sort themes #'string-lessp))
            (sorted-light-dark (modus-themes-sort sorted-a-z 'light)))
      sorted-light-dark
    sinolor-themes-items))

;;;; Convenience commands

;;;###autoload (autoload 'sinolor-themes-toggle "sinolor-themes")
(modus-themes-define-derivative-command sinolor-themes toggle)

;;;###autoload (autoload 'sinolor-themes-rotate "sinolor-themes")
(modus-themes-define-derivative-command sinolor-themes rotate)

;;;###autoload (autoload 'sinolor-themes-select "sinolor-themes")
(modus-themes-define-derivative-command sinolor-themes select)

;;;###autoload (autoload 'sinolor-themes-load-random "sinolor-themes")
(modus-themes-define-derivative-command sinolor-themes load-random)

;;;###autoload (autoload 'sinolor-themes-load-random-dark "sinolor-themes")
(modus-themes-define-derivative-command sinolor-themes load-random-dark)

;;;###autoload (autoload 'sinolor-themes-load-random-light "sinolor-themes")
(modus-themes-define-derivative-command sinolor-themes load-random-light)

;;;###autoload (autoload 'sinolor-themes-list-colors "sinolor-themes")
(modus-themes-define-derivative-command sinolor-themes list-colors)

;;;###autoload (autoload 'sinolor-themes-list-colors-current "sinolor-themes")
(modus-themes-define-derivative-command sinolor-themes list-colors-current)

;;;; Add themes from the package to the load path

;;;###autoload
(when load-file-name
  (let ((dir (file-name-directory load-file-name)))
    (unless (file-equal-p dir (expand-file-name "themes/" data-directory))
      (add-to-list 'custom-theme-load-path dir))))

(provide 'sinolor-themes)
;;; sinolor-themes.el ends here
