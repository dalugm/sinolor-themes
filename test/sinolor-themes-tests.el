;;; sinolor-themes-tests.el --- Tests for sinolor-themes -*- lexical-binding: t; -*-

;;; Code:

(require 'ert)
(require 'sinolor-themes)

(ert-deftest sinolor-themes-list-all-declared-themes ()
  (should (equal sinolor-themes-items
                 '(sinolor-eva-00
                   sinolor-elysia
                   sinolor-eva-01
                   sinolor-eva-02
                   sinolor-palace)))
  (dolist (theme sinolor-themes-items)
    (should (memq theme (custom-available-themes))))
  (should-not (memq 'sinolor-eva (custom-available-themes))))

(ert-deftest sinolor-themes-load-successfully ()
  (dolist (theme sinolor-themes-items)
    (unwind-protect
        (progn
          (load-theme theme t)
          (should (custom-theme-enabled-p theme)))
      (disable-theme theme))))

(ert-deftest sinolor-eva-00-is-the-only-light-theme ()
  (should (equal sinolor-themes-light-themes '(sinolor-eva-00)))
  (should (eq (plist-get (get 'sinolor-eva-00 'theme-properties)
                              :background-mode)
              'light))
  (dolist (theme sinolor-themes-dark-themes)
    (should (eq (plist-get (get theme 'theme-properties)
                           :background-mode)
                'dark))))

(ert-deftest sinolor-eva-themes-have-distinct-signature-colors ()
  (dolist (spec '((sinolor-eva-00
                   sinolor-eva-00-palette
                   "#806000" "#a9471b")
                  (sinolor-eva-01
                   sinolor-eva-01-palette
                   "#75409a" "#8fcf4f")
                  (sinolor-eva-02
                   sinolor-eva-02-palette
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

(ert-deftest sinolor-elysia-uses-pink-crystal-and-lilac-roles ()
  (should (equal (plist-get (get 'sinolor-elysia 'theme-properties)
                            :modus-documentation)
                 "To Romantic Unfailing Elysia."))
  (load-theme 'sinolor-elysia t)
  (unwind-protect
      (progn
        (dolist (spec '((elysia-pink "#e88fba")
                        (elysia-crystal "#8fd6e8")
                        (elysia-lilac "#b49ad8")
                        (elysia-gold "#e8c76d")))
          (should (equal (cadr (assq (car spec) sinolor-elysia-palette))
                         (cadr spec))))
        (should (equal (modus-themes-get-color-value
                        'keyword nil 'sinolor-elysia)
                       "#ffb7d8"))
        (should (equal (modus-themes-get-color-value
                        'string nil 'sinolor-elysia)
                       "#b7edf5"))
        (should (equal (modus-themes-get-color-value
                        'bg-mode-line-active nil 'sinolor-elysia)
                       "#d66398")))
    (disable-theme 'sinolor-elysia)))

(ert-deftest sinolor-palace-uses-red-wall-and-green-tile-roles ()
  (load-theme 'sinolor-palace t)
  (unwind-protect
      (progn
        (should (equal (modus-themes-get-color-value
                        'palace-wall nil 'sinolor-palace)
                       "#a7535a"))
        (should (equal (modus-themes-get-color-value
                        'palace-tile nil 'sinolor-palace)
                       "#20894d"))
        (should (equal (modus-themes-get-color-value
                        'bg-mode-line-active nil 'sinolor-palace)
                       "#a7535a"))
        (should (equal (modus-themes-get-color-value
                        'string nil 'sinolor-palace)
                       "#77c294")))
    (disable-theme 'sinolor-palace)))

(provide 'sinolor-themes-tests)
;;; sinolor-themes-tests.el ends here
