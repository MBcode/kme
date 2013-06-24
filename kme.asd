#+quicklisp (defun ql (a) (ql:quickload  a))
#+quicklisp (defun qa (a) (ql:system-apropos  a))
#+quicklisp (defun qd (a) (ql:who-depends-on  a)) 

(ql 'km)

;(defpackage :kme
;    (:use :km :cl :asdf))

;(in-package :kme)

(defsystem kme
  :name "kme"
  :version "0.0.1"
  :maintainer "bobak"
  :author "bobak@balisp.org"
  :licence "GPL-ish tbd"
  :description "km for ML/discovery/etc" 
  :components ( 
                (:file "util_mb")
                (:file "u2")
                ) :serial t
  :depends-on (km))
