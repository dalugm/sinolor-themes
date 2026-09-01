;;; jinlor-tests.el --- Tests for jinlor -*- lexical-binding: t; -*-

;; Copyright (C) 2026 dalu
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Code:

(require 'ert)
(require 'jinlor)

(defconst jinlor-tests--root
  (file-name-directory
   (directory-file-name
    (file-name-directory (or load-file-name buffer-file-name))))
  "Directory containing the Jinlor sources.")

(ert-deftest jinlor-feature-loads ()
  (should (featurep 'jinlor)))

(ert-deftest jinlor-list-all-declared-themes ()
  (should (equal jinlor-items
                 '(jinlor-eva-00
                   jinlor-elysia
                   jinlor-eva-01
                   jinlor-eva-02
                   jinlor-palace)))
  (dolist (theme jinlor-items)
    (should (memq theme (custom-available-themes))))
  (should-not (memq 'jinlor-eva (custom-available-themes))))

(ert-deftest jinlor-do-not-expose-legacy-names ()
  (dolist (theme '(sinolor-elysia
                   sinolor-eva
                   sinolor-eva-00
                   sinolor-eva-01
                   sinolor-eva-02
                   sinolor-palace))
    (should-not (memq theme (custom-available-themes)))))

(ert-deftest jinlor-load-successfully ()
  (dolist (theme jinlor-items)
    (unwind-protect
        (progn
          (load-theme theme t)
          (should (custom-theme-enabled-p theme)))
      (disable-theme theme))))

(ert-deftest jinlor-autoloaded-commands-are-interactive ()
  (require 'loaddefs-gen)
  (let ((autoload-file (make-temp-file "jinlor-autoloads-" nil ".el"))
        (emacs (expand-file-name invocation-name invocation-directory)))
    (unwind-protect
        (progn
          (loaddefs-generate jinlor-tests--root autoload-file nil nil nil t)
          (with-temp-buffer
            (let ((status
                   (call-process
                    emacs nil t nil
                    "--batch" "-Q" "-l" autoload-file
                    "--eval"
                    (prin1-to-string
                     '(dolist (command
                               '(jinlor-toggle
                                 jinlor-rotate
                                 jinlor-select
                                 jinlor-load-random
                                 jinlor-load-random-dark
                                 jinlor-load-random-light
                                 jinlor-list-colors
                                 jinlor-list-colors-current))
                        (unless (commandp command)
                          (error "%S is not an interactive command" command)))))))
              (unless (zerop status)
                (ert-fail (buffer-string))))))
      (delete-file autoload-file))))

(ert-deftest jinlor-eva-00-is-the-only-light-theme ()
  (should (equal jinlor-light-themes '(jinlor-eva-00)))
  (should (eq (plist-get (get 'jinlor-eva-00 'theme-properties)
                              :background-mode)
              'light))
  (dolist (theme jinlor-dark-themes)
    (should (eq (plist-get (get theme 'theme-properties)
                           :background-mode)
                'dark))))

(ert-deftest jinlor-eva-themes-have-distinct-signature-colors ()
  (dolist (spec '((jinlor-eva-00
                   jinlor-eva-00-palette
                   "#806000" "#a9471b")
                  (jinlor-eva-01
                   jinlor-eva-01-palette
                   "#75409a" "#8fcf4f")
                  (jinlor-eva-02
                   jinlor-eva-02-palette
                   "#d7353f" "#e56f2f")))
    (pcase-let ((`(,theme ,palette ,primary ,secondary) spec))
      (load-theme theme t)
      (unwind-protect
          (progn
            (should (equal (cadr (assq 'eva-primary
                                      (symbol-value palette)))
                           primary))
            (should (equal (cadr (assq 'eva-secondary
                                      (symbol-value palette)))
                           secondary)))
        (disable-theme theme)))))

(ert-deftest jinlor-eva-code-roles-meet-normal-text-contrast ()
  (dolist (theme '(jinlor-eva-00 jinlor-eva-01 jinlor-eva-02))
    (load-theme theme t)
    (unwind-protect
        (let ((background
               (modus-themes-get-color-value 'bg-main nil theme)))
          (dolist (role '(preprocessor rx-construct))
            (should (>= (modus-themes-contrast
                         (modus-themes-get-color-value role nil theme)
                         background)
                        4.5))))
      (disable-theme theme))))

(ert-deftest jinlor-elysia-uses-pink-crystal-and-lilac-roles ()
  (should (equal (plist-get (get 'jinlor-elysia 'theme-properties)
                            :modus-documentation)
                 "To Romantic Unfailing Elysia."))
  (load-theme 'jinlor-elysia t)
  (unwind-protect
      (progn
        (dolist (spec '((elysia-pink "#e88fba")
                        (elysia-crystal "#8fd6e8")
                        (elysia-lilac "#b49ad8")
                        (elysia-gold "#e8c76d")))
          (should (equal (cadr (assq (car spec)
                                     (symbol-value 'jinlor-elysia-palette)))
                         (cadr spec))))
        (should (equal (modus-themes-get-color-value
                        'keyword nil 'jinlor-elysia)
                       "#ffb7d8"))
        (should (equal (modus-themes-get-color-value
                        'string nil 'jinlor-elysia)
                       "#b7edf5"))
        (should (equal (modus-themes-get-color-value
                        'bg-mode-line-active nil 'jinlor-elysia)
                       "#d66398")))
    (disable-theme 'jinlor-elysia)))

(ert-deftest jinlor-palace-uses-red-wall-and-green-tile-roles ()
  (load-theme 'jinlor-palace t)
  (unwind-protect
      (progn
        (should (equal (modus-themes-get-color-value
                        'palace-wall nil 'jinlor-palace)
                       "#a7535a"))
        (should (equal (modus-themes-get-color-value
                        'palace-tile nil 'jinlor-palace)
                       "#20894d"))
        (should (equal (modus-themes-get-color-value
                        'bg-mode-line-active nil 'jinlor-palace)
                       "#a7535a"))
        (should (equal (modus-themes-get-color-value
                        'string nil 'jinlor-palace)
                       "#77c294")))
    (disable-theme 'jinlor-palace)))

(provide 'jinlor-tests)
;;; jinlor-tests.el ends here
