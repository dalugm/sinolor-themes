;;; sinolor-themes-tests.el --- Tests for sinolor-themes -*- lexical-binding: t; -*-

(require 'ert)
(require 'sinolor-themes)

(ert-deftest sinolor-themes-list-all-declared-themes ()
  (should (equal sinolor-themes-items
                 '(sinolor-elysia sinolor-eva sinolor-palace)))
  (dolist (theme sinolor-themes-items)
    (should (memq theme (custom-available-themes)))))

(ert-deftest sinolor-themes-load-successfully ()
  (dolist (theme sinolor-themes-items)
    (unwind-protect
        (progn
          (load-theme theme t)
          (should (custom-theme-enabled-p theme)))
      (disable-theme theme))))

(provide 'sinolor-themes-tests)
;;; sinolor-themes-tests.el ends here
