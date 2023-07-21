;;; sinolor-themes.el --- an opinionated pack of modern color-themes -*- lexical-binding: t; -*-

;; Author: dalu <mou.tong@qq.com>
;; Maintainer: dalu <mou.tong@qq.com>
;; Version: 0.1.0
;; Package-Requires: ((emacs "25.1") (cl-lib "0.5"))
;; Homepage: https://github.com/dalugm/sinolor-themes
;; Keywords: themes, faces

;; This file is not part of GNU Emacs

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Sinolor Themes is an opinionated UI plugin and pack of themes
;; inspired by `doom-themes'.
;;
;;   `sinolor-black'
;;   `sinolor-elydis'
;;   `sinolor-eva'
;;   `sinolor-green'
;;   `sinolor-light'
;;   `sinolor-palace'
;;

;;; Code:

(require 'cl-lib)
(require 'sinolor-themes-base)

(defgroup sinolor-themes nil
  "Options for sinolor-themes."
  :group 'faces)

(defcustom sinolor-themes-padded-modeline nil
  "Default value for padded-modeline setting for themes that support it."
  :group 'sinolor-themes
  :type '(choice integer boolean))

(defcustom sinolor-themes-enable-bold t
  "If nil, bold will be disabled across all faces."
  :group 'sinolor-themes
  :type 'boolean)

(defcustom sinolor-themes-enable-italic t
  "If nil, italics will be disabled across all faces."
  :group 'sinolor-themes
  :type 'boolean)

;;; API

(defvar sinolor-themes--colors nil)
(defvar sinolor-themes--min-colors '(257 256 16))
(defvar sinolor-themes--quoted-p nil)
(defvar sinolor-themes--faces nil)

(defun sinolor-themes--colors-p (item)
  "Judge themes ITEM colors."
  (declare (pure t) (side-effect-free t))
  (when item
    (cond ((listp item)
           (let ((car (car item)))
             (cond ((memq car '(quote sinolor-themes--color)) nil)
                   ((memq car '(backquote \`))
                    (let ((sinolor-themes--quoted-p t))
                      (sinolor-themes--colors-p (cdr item))))
                   ((eq car '\,)
                    (let (sinolor-themes--quoted-p)
                      (sinolor-themes--colors-p (cdr item))))
                   ((or (sinolor-themes--colors-p car)
                        (sinolor-themes--colors-p (cdr-safe item)))))))
          ((and (symbolp item)
                (not (keywordp item))
                (not sinolor-themes--quoted-p)
                (not (equal (substring (symbol-name item) 0 1) "-"))
                (assq item sinolor-themes--colors))))))

(defun sinolor-themes--apply-faces (new-faces &optional default-faces)
  "Apply NEW-FACES to DEFAULT-FACES."
  (declare (pure t) (side-effect-free t))
  (let ((default-faces (or default-faces sinolor-themes--base-faces))
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
                   (dolist (prop (append (unless sinolor-themes-enable-bold   '(:weight normal :bold nil))
                                         (unless sinolor-themes-enable-italic '(:slant normal :italic nil))))
                     (when (and (plist-member plist prop)
                                (not (eq (plist-get plist prop) 'inherit)))
                       (plist-put plist prop
                                  (if (memq prop '(:weight :slant))
                                      (quote 'normal))))))
                 (push (cons face plist) results))
               faces)
      (nreverse results))))

(defun sinolor-themes--colorize (item type)
  "Colorize ITEM and TYPE."
  (declare (pure t) (side-effect-free t))
  (when item
    (let ((sinolor-themes--quoted-p sinolor-themes--quoted-p))
      (cond ((listp item)
             (cond ((memq (car item) '(quote sinolor-themes--color))
                    item)
                   ((eq (car item) 'sinolor-themes--def)
                    (sinolor-themes--colorize
                     (apply #'sinolor-themes--def (cdr item)) type))
                   ((let* ((item (append item nil))
                           (car (car item))
                           (sinolor-themes--quoted-p
                            (cond ((memq car '(backquote \`)) t)
                                  ((eq car '\,) nil)
                                  (t sinolor-themes--quoted-p))))
                      (cons car
                            (cl-loop
                             for i in (cdr item)
                             collect (sinolor-themes--colorize i type)))))))
            ((and (symbolp item)
                  (not (keywordp item))
                  (not sinolor-themes--quoted-p)
                  (not (equal (substring (symbol-name item) 0 1) "-"))
                  (assq item sinolor-themes--colors))
             `(sinolor-themes--color ',item ',type))
            (item)))))

(defun sinolor-themes--build-face (face)
  "Build FACE."
  (declare (pure t) (side-effect-free t))
  `(list
    ',(car face)
    ,(let ((face-body (cdr face)))
       (cond ((keywordp (car face-body))
              (let ((real-attrs face-body)
                    defs)
                (if (sinolor-themes--colors-p real-attrs)
                    (dolist (cl sinolor-themes--min-colors `(list ,@(nreverse defs)))
                      (push `(list '((class color) (min-colors ,cl))
                                   (list ,@(sinolor-themes--colorize real-attrs cl)))
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
                           (cond ((sinolor-themes--colors-p real-attrs)
                                  (dolist (cl sinolor-themes--min-colors)
                                    (push `(list '((class color) (min-colors ,cl) (background ,bg))
                                                 (list ,@(sinolor-themes--colorize real-attrs cl)))
                                          defs)))
                                 ((push `(list '((background ,bg)) (list ,@real-attrs))
                                        defs)))))))))))))

;;; Color helper functions

;;;###autoload
(defun sinolor-themes--name-to-rgb (color)
  "Retrieves the hexidecimal string repesented the named COLOR (e.g. \"red\")
for FRAME (defaults to the current frame)."
  (cl-loop with div = (float (car (tty-color-standard-values "#ffffff")))
           for x in (tty-color-standard-values (downcase color))
           collect (/ x div)))

;;;###autoload
(defun sinolor-themes--blend (color1 color2 alpha)
  "Blend two colors together by a coefficient ALPHA.
COLOR1/COLOR2: (hexidecimal strings)
ALPHA: (a float between 0 and 1)."
  (when (and color1 color2)
    (cond ((and color1 color2 (symbolp color1) (symbolp color2))
           (sinolor-themes--blend (sinolor-themes--color color1) (sinolor-themes--color color2) alpha))

          ((or (listp color1) (listp color2))
           (cl-loop for x in color1
                    when (if (listp color2) (pop color2) color2)
                    collect (sinolor-themes--blend x it alpha)))

          ((and (string-prefix-p "#" color1) (string-prefix-p "#" color2))
           (apply (lambda (r g b) (format "#%02x%02x%02x" (* r 255) (* g 255) (* b 255)))
                  (cl-loop for it    in (sinolor-themes--name-to-rgb color1)
                           for other in (sinolor-themes--name-to-rgb color2)
                           collect (+ (* alpha it) (* other (- 1 alpha))))))

          (color1))))

;;;###autoload
(defun sinolor-themes--darken (color alpha)
  "Darken COLOR by a coefficient ALPHA.

color : hexidecimal string.
alpha : float between 0 and 1."
  (cond ((and color (symbolp color))
         (sinolor-themes--darken (sinolor-themes--color color) alpha))
        ((listp color)
         (cl-loop for c in color collect (sinolor-themes--darken c alpha)))
        ((sinolor-themes--blend color "#000000" (- 1 alpha)))))

;;;###autoload
(defun sinolor-themes--lighten (color alpha)
  "Brighten COLOR by a coefficient ALPHA.

color : hexidecimal string.
alpha : float between 0 and 1."
  (cond ((and color (symbolp color))
         (sinolor-themes--lighten (sinolor-themes--color color) alpha))
        ((listp color)
         (cl-loop for c in color collect (sinolor-themes--lighten c alpha)))
        ((sinolor-themes--blend color "#FFFFFF" (- 1 alpha)))))

;;;###autoload
(defun sinolor-themes--color (name &optional type)
  "Retrieve a NAME color with TYPE from the current theme."
  (let ((colors (if (listp name)
                    name
                  (cdr-safe (assq name sinolor-themes--colors)))))
    (and colors
         (cond ((listp colors)
                (let ((i (or (plist-get '(256 1 16 2 8 3) type) 0)))
                  (if (> i (1- (length colors)))
                      (car (last colors))
                    (nth i colors))))
               (t colors)))))

;;;###autoload
(defun sinolor-themes--def (face prop &optional class)
  "Define themes with FACE, PROP and CLASS."
  (let ((spec (or (cdr (assq face sinolor-themes--faces))
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

(defun sinolor-themes--prepare-facelist (custom-faces)
  "Return an alist of face definitions for `custom-theme-set-faces'.

CUSTOM-FACES in EXTRA-FACES override the default faces."
  (declare (pure t) (side-effect-free t))
  (setq sinolor-themes--faces (sinolor-themes--apply-faces custom-faces))
  (mapcar #'sinolor-themes--build-face sinolor-themes--faces))

(defun sinolor-themes--prepare-varlist (vars)
  "Return an alist of variable definitions for `custom-theme-set-variables'.

VARS in EXTRA-VARS override the default ones."
  (declare (pure t) (side-effect-free t))
  (cl-loop for (var val) in (append sinolor-themes--base-vars vars)
           collect `(list ',var ,val)))

;;;###autoload
(defun sinolor-themes--set-faces (theme &rest faces)
  "Customize THEME (a symbol) with FACES.

If THEME is nil, it applies to all themes you load.
FACES is a list of theme face specs.

These is a simplified spec.  For example:

  (sinolor-themes--set-faces \\='user
   \\='(default :background red :foreground blue)
   \\='(sinolor-modeline-bar :background (if -modeline-bright
                                             modeline-bg
                                           highlight))
   \\='(sinolor-modeline-buffer-file :inherit \\='mode-line-buffer-id
                                     :weight \\='bold)
   \\='(sinolor-modeline-buffer-path :inherit \\='mode-line-emphasis
                                     :weight \\='bold)
   \\='(sinolor-modeline-buffer-project-root :foreground green
                                             :weight \\='bold))"
  (declare (indent defun))
  (apply #'custom-theme-set-faces
         (or theme 'user)
         (eval
          `(let* ((bold   ,sinolor-themes-enable-bold)
                  (italic ,sinolor-themes-enable-italic)
                  ,@(cl-loop for (var . val) in sinolor-themes--colors
                             collect `(,var ',val)))
             (list ,@(mapcar #'sinolor-themes--build-face faces))))))

(defmacro def-sinolor-theme (name docstring defs &optional extra-faces extra-vars)
  "Define a custom theme.

NAME with DOCSTRING, DEFS and optional EXTRA-FACES EXTRA-VARS."
  (declare (doc-string 2))
  (let ((sinolor-themes--colors defs))
    `(let* ((bold   sinolor-themes-enable-bold)
            (italic sinolor-themes-enable-italic)
            ,@defs)
       (setq sinolor-themes--colors
             (list ,@(cl-loop for (var val) in defs
                              collect `(cons ',var ,val))))
       (deftheme ,name ,docstring)
       (custom-theme-set-faces
        ',name ,@(sinolor-themes--prepare-facelist extra-faces))
       (custom-theme-set-variables
        ',name ,@(sinolor-themes--prepare-varlist extra-vars))
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

(provide 'sinolor-themes)

;;; sinolor-themes.el ends here
