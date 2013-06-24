#+quicklisp (defun ql (a) (ql:quickload  a))
#+quicklisp (defun qa (a) (ql:system-apropos  a))
#+quicklisp (defun qd (a) (ql:who-depends-on  a)) 

(ql 'km)

(in-package #:cl-user)
;(in-package #:km)

(defpackage :kme
    (:use :cl :asdf :km)
    (:export "taxonomy" "show" "showme" "km")
    )

(in-package :kme)
;(import 'km::taxonomy)
;(import 'km::show)
(import 'km::(taxonomy show showme km load-kb))

(defun lo () (sb-ext:exit)) ;better one in my .sbclrc
(defun bt (&optional (n 7)) (sb-debug:backtrace n))

(asdf:defsystem kme
  :name "kme"
  :version "0.0.1"
  :maintainer "bobak"
  :author "bobak@balisp.org"
  :licence "GPL-ish tbd"
  :description "km for ML/discovery/etc" 
  :components ( 
                (:file "util_mb")
               ;(:file "util_km") ;maybe transition u2 here?
                (:file "u2")
                ) :serial t
  :depends-on (km))
