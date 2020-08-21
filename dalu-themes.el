;;; dalu-themes.el --- theme related functions -*- lexical-binding: t; -*-

;;; Commentary:
;;
;;  Theme related functions
;;

;;; Code:

(require 'cl-lib)
(require 'dalu-themes-base)

(defgroup dalu-themes nil
  "Options for dalu-themes."
  :group 'faces)

(defcustom dalu-themes-padded-modeline nil
  "Default value for padded-modeline setting for themes that support it."
  :group 'dalu-themes
  :type '(choice integer boolean))

(defcustom dalu-themes-enable-bold t
  "If nil, bold will be disabled across all faces."
  :group 'dalu-themes
  :type 'boolean)

(defcustom dalu-themes-enable-italic t
  "If nil, italics will be disabled across all faces."
  :group 'dalu-themes
  :type 'boolean)

;;; API

(defvar dalu-themes--colors nil)
(defvar dalu-themes--min-colors '(257 256 16))
(defvar dalu-themes--quoted-p nil)
(defvar dalu-themes--faces nil)

(defun dalu-themes--colors-p (item)
  "Judge themes ITEM colors."
  (declare (pure t) (side-effect-free t))
  (when item
    (cond ((listp item)
           (let ((car (car item)))
             (cond ((memq car '(quote dalu-themes--color)) nil)
                   ((memq car '(backquote \`))
                    (let ((dalu-themes--quoted-p t))
                      (dalu-themes--colors-p (cdr item))))
                   ((eq car '\,)
                    (let (dalu-themes--quoted-p)
                      (dalu-themes--colors-p (cdr item))))
                   ((or (dalu-themes--colors-p car)
                        (dalu-themes--colors-p (cdr-safe item)))))))
          ((and (symbolp item)
                (not (keywordp item))
                (not dalu-themes--quoted-p)
                (not (equal (substring (symbol-name item) 0 1) "-"))
                (assq item dalu-themes--colors))))))

(defun dalu-themes--apply-faces (new-faces &optional default-faces)
  "Apply NEW-FACES to DEFAULT-FACES."
  (declare (pure t) (side-effect-free t))
  (let ((default-faces (or default-faces dalu-themes--base-faces))
        (faces (make-hash-table :test #'eq :size (+ (length default-faces) (length new-faces))))
        (directives (make-hash-table :test #'eq)))
    (dolist (spec (append (mapcar #'copy-sequence default-faces) new-faces))
      (if (listp (car spec))
          (cl-destructuring-bind (face action &optional arg) (car spec)
            (unless (assq face new-faces)
              (puthash face (list action arg (cdr spec))
                       directives)))
        (puthash (car spec) (cdr spec) faces)))
    (cl-loop for face being the hash-keys of directives
             for (action target spec) = (gethash face directives)
             unless (memq action '(&inherit &extend &override))
             do (error "Invalid operation (%s) for '%s' face" action face)
             if (eq (car spec) 'quote)
             do (error "Can't extend literal face spec (for '%s')" face)
             ;; TODO Add &all/&light/&dark extension support
             else if (memq (car spec) '(&all &light &dark))
             do (error "Can't extend face with &all, &light or &dark specs (for '%s')" face)
             else do
             (puthash face
                      (let ((old-spec (gethash (or target face) faces))
                            (plist spec))
                        ;; remove duplicates
                        (while (keywordp (car plist))
                          (setq old-spec (plist-put old-spec (car plist) (cadr plist))
                                plist (cddr plist)))
                        old-spec)
                      faces))
    (let (results)
      (maphash (lambda (face plist)
                 (when (keywordp (car plist))
                   ;; TODO Clean up duplicates in &all/&light/&dark blocks
                   (dolist (prop (append (unless dalu-themes-enable-bold   '(:weight normal :bold nil))
                                         (unless dalu-themes-enable-italic '(:slant normal :italic nil))))
                     (when (and (plist-member plist prop)
                                (not (eq (plist-get plist prop) 'inherit)))
                       (plist-put plist prop
                                  (if (memq prop '(:weight :slant))
                                      (quote 'normal))))))
                 (push (cons face plist) results))
               faces)
      (nreverse results))))

(defun dalu-themes--colorize (item type)
  "Colorize ITEM and TYPE."
  (declare (pure t) (side-effect-free t))
  (when item
    (let ((dalu-themes--quoted-p dalu-themes--quoted-p))
      (cond ((listp item)
             (cond ((memq (car item) '(quote dalu-themes--color))
                    item)
                   ((eq (car item) 'dalu-themes--def)
                    (dalu-themes--colorize
                     (apply #'dalu-themes--def (cdr item)) type))
                   ((let* ((item (append item nil))
                           (car (car item))
                           (dalu-themes--quoted-p
                            (cond ((memq car '(backquote \`)) t)
                                  ((eq car '\,) nil)
                                  (t dalu-themes--quoted-p))))
                      (cons car
                            (cl-loop
                             for i in (cdr item)
                             collect (dalu-themes--colorize i type)))))))
            ((and (symbolp item)
                  (not (keywordp item))
                  (not dalu-themes--quoted-p)
                  (not (equal (substring (symbol-name item) 0 1) "-"))
                  (assq item dalu-themes--colors))
             `(dalu-themes--color ',item ',type))
            (item)))))

(defun dalu-themes--build-face (face)
  "Build FACE."
  (declare (pure t) (side-effect-free t))
  `(list
    ',(car face)
    ,(let ((face-body (cdr face)))
       (cond ((keywordp (car face-body))
              (let ((real-attrs face-body)
                    defs)
                (if (dalu-themes--colors-p real-attrs)
                    (dolist (cl dalu-themes--min-colors `(list ,@(nreverse defs)))
                      (push `(list '((class color) (min-colors ,cl))
                                   (list ,@(dalu-themes--colorize real-attrs cl)))
                            defs))
                  `(list (list 't (list ,@real-attrs))))))
             ((memq (car-safe (car face-body)) '(quote backquote \`))
              (car face-body))
             ((let (all-attrs defs)
                (dolist (attrs face-body `(list ,@(nreverse defs)))
                  (cond ((eq (car attrs) '&all)
                         (setq all-attrs (append all-attrs (cdr attrs))))
                        ((memq (car attrs) '(&dark &light))
                         (let ((bg (if (eq (car attrs) '&dark) 'dark 'light))
                               (real-attrs (append all-attrs (cdr attrs) '())))
                           (cond ((dalu-themes--colors-p real-attrs)
                                  (dolist (cl dalu-themes--min-colors)
                                    (push `(list '((class color) (min-colors ,cl) (background ,bg))
                                                 (list ,@(dalu-themes--colorize real-attrs cl)))
                                          defs)))
                                 ((push `(list '((background ,bg)) (list ,@real-attrs))
                                        defs)))))))))))))

;;; Color helper functions

;;;###autoload
(defun dalu-themes--name-to-rgb (color)
  "Retrieves the hexidecimal string repesented the named COLOR (e.g. \"red\")
for FRAME (defaults to the current frame)."
  (cl-loop with div = (float (car (tty-color-standard-values "#ffffff")))
           for x in (tty-color-standard-values (downcase color))
           collect (/ x div)))

;;;###autoload
(defun dalu-themes--blend (color1 color2 alpha)
  "Blend two colors together by a coefficient ALPHA.

COLOR1/COLOR2: (hexidecimal strings)
ALPHA: (a float between 0 and 1)."
  (when (and color1 color2)
    (cond ((and color1 color2 (symbolp color1) (symbolp color2))
           (dalu-themes--blend (dalu-themes--color color1) (dalu-themes--color color2) alpha))

          ((or (listp color1) (listp color2))
           (cl-loop for x in color1
                    when (if (listp color2) (pop color2) color2)
                    collect (dalu-themes--blend x it alpha)))

          ((and (string-prefix-p "#" color1) (string-prefix-p "#" color2))
           (apply (lambda (r g b) (format "#%02x%02x%02x" (* r 255) (* g 255) (* b 255)))
                  (cl-loop for it    in (dalu-themes--name-to-rgb color1)
                           for other in (dalu-themes--name-to-rgb color2)
                           collect (+ (* alpha it) (* other (- 1 alpha))))))

          (color1))))

;;;###autoload
(defun dalu-themes--darken (color alpha)
  "Darken a COLOR (a hexidecimal string) by a coefficient ALPHA (a float between 0 and 1)."
  (cond ((and color (symbolp color))
         (dalu-themes--darken (dalu-themes--color color) alpha))
        ((listp color)
         (cl-loop for c in color collect (dalu-themes--darken c alpha)))
        ((dalu-themes--blend color "#000000" (- 1 alpha)))))

;;;###autoload
(defun dalu-themes--lighten (color alpha)
  "Brighten a COLOR (a hexidecimal string) by a coefficient ALPHA (a float between 0 and 1)."
  (cond ((and color (symbolp color))
         (dalu-themes--lighten (dalu-themes--color color) alpha))
        ((listp color)
         (cl-loop for c in color collect (dalu-themes--lighten c alpha)))
        ((dalu-themes--blend color "#FFFFFF" (- 1 alpha)))))

;;;###autoload
(defun dalu-themes--color (name &optional type)
  "Retrieve a specific color named NAME (a symbol) with TYPE from the current theme."
  (let ((colors (if (listp name)
                    name
                  (cdr-safe (assq name dalu-themes--colors)))))
    (and colors
         (cond ((listp colors)
                (let ((i (or (plist-get '(256 1 16 2 8 3) type) 0)))
                  (if (> i (1- (length colors)))
                      (car (last colors))
                    (nth i colors))))
               (t colors)))))

;;;###autoload
(defun dalu-themes--def (face prop &optional class)
  "Define themes."
  (let ((spec (or (cdr (assq face dalu-themes--faces))
                  (error "Couldn't find the '%s' face" face))))
    (when (memq (car spec) '(quote backquote \`))
      (user-error "Can't fetch the literal spec for '%s'" face))
    (when class
      (setq spec (cdr (assq class spec)))
      (unless spec
        (error "Couldn't find the '%s' class in the '%s' face"
               class face)))
    (unless (plist-member spec prop)
      (error "Couldn't find the '%s' property in the '%s' face%s"
             prop face (if class (format "'s '%s' class" class) "")))
    (plist-get spec prop)))

(defun dalu-themes--prepare-facelist (custom-faces)
  "Return an alist of face definitions for `custom-theme-set-faces'.

CUSTOM-FACES in EXTRA-FACES override the default faces."
  (declare (pure t) (side-effect-free t))
  (setq dalu-themes--faces (dalu-themes--apply-faces custom-faces))
  (mapcar #'dalu-themes--build-face dalu-themes--faces))

(defun dalu-themes--prepare-varlist (vars)
  "Return an alist of variable definitions for `custom-theme-set-variables'.

VARS in EXTRA-VARS override the default ones."
  (declare (pure t) (side-effect-free t))
  (cl-loop for (var val) in (append dalu-themes--base-vars vars)
           collect `(list ',var ,val)))

;;;###autoload
(defun dalu-themes--set-faces (theme &rest faces)
  "Customize THEME (a symbol) with FACES.

If THEME is nil, it applies to all themes you load.
FACES is a list of theme face specs.

These is a simplified spec.  For example:

  (dalu-themes--set-faces 'user
    '(default :background red :foreground blue)
    '(dalu-modeline-bar :background (if -modeline-bright modeline-bg highlight))
    '(dalu-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
    '(dalu-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
    '(dalu-modeline-buffer-project-root :foreground green :weight 'bold))"
  (declare (indent defun))
  (apply #'custom-theme-set-faces
         (or theme 'user)
         (eval
          `(let* ((bold   ,dalu-themes-enable-bold)
                  (italic ,dalu-themes-enable-italic)
                  ,@(cl-loop for (var . val) in dalu-themes--colors
                             collect `(,var ',val)))
             (list ,@(mapcar #'dalu-themes--build-face faces))))))

(defmacro def-dalu-theme (name docstring defs &optional extra-faces extra-vars)
  "Define a theme, named NAME (a symbol) with DOCSTRING, DEFS and optinal EXTRA-FACES EXTRA-VARS."
  (declare (doc-string 2))
  (let ((dalu-themes--colors defs))
    `(let* ((bold   dalu-themes-enable-bold)
            (italic dalu-themes-enable-italic)
            ,@defs)
       (setq dalu-themes--colors
             (list ,@(cl-loop for (var val) in defs
                              collect `(cons ',var ,val))))
       (deftheme ,name ,docstring)
       (custom-theme-set-faces
        ',name ,@(dalu-themes--prepare-facelist extra-faces))
       (custom-theme-set-variables
        ',name ,@(dalu-themes--prepare-varlist extra-vars))
       (unless bold (set-face-bold 'bold nil))
       (unless italic (set-face-italic 'italic nil))
       (provide-theme ',name))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (let* ((base (file-name-directory load-file-name))
         (dir (expand-file-name "themes/" base)))
    (add-to-list 'custom-theme-load-path
                 (or (and (file-directory-p dir) dir)
                     base))))

(provide 'dalu-themes)

;;; dalu-themes.el ends here
