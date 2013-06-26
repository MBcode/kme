#+quicklisp (defun ql (a) (ql:quickload  a))
#+quicklisp (defun qa (a) (ql:system-apropos  a))
#+quicklisp (defun qd (a) (ql:who-depends-on  a)) 
(defun al (l) "asdf load" (asdf:oos 'asdf:load-op l))

;I should get all these libs down in :depends-on
(ql 'km)
(ql 'cl-csv) ;for io
;ML libs
;(ql 'arnesi) ;for dt
;(al 'cl-decision-tree) ;https://github.com/kroger/cl-decision-tree
;or:
;(ql 'lisp-unit)
;(al 'decisiontree)      ;https://github.com/reubencornel/cl-decisiontree
;=deciding on how to interface the km/e data w/the present dt data

(in-package #:cl-user)

(defun in () 
  (in-package :kme))

(defpackage :kme
    (:use :cl :asdf :km)
   ;(:export "taxonomy" "show" "showme" "km" "all-instances")
    )

(in-package :kme)
(import 'km::(taxonomy show showme km load-kb all-instances save-kb))

(defun lo () (sb-ext:exit)) ;better one in my .sbclrc
(defun bt (&optional (n 7)) (sb-debug:backtrace n))


(asdf:defsystem kme
  :name "kme"
  :version "0.0.1"
  :maintainer "bobak"
  :author "bobak@balisp.org"
  :licence "GPL-ish tbd"
  :description "km for ML/discovery/etc" 
  :serial t
  :components (;(:file "package") ;see if this helps
                (:file "util_mb")
               ;(:file "util_km") ;maybe transition u2 here?
                (:file "u2")
                (:file "io")
                ) 
  :depends-on (km))


#+ignore ;soon, but just: (load "test/test.lisp") for now
(asdf:defsystem kme-test
  :name "kme-test"
  :version "0.0.1"
  :maintainer "bobak"
  :author "bobak@balisp.org"
  :licence "GPL-ish tbd"
  :description "test the Knowledge_Modeling_Env"
  :serial t
  ((:module #:test
            :serial t
            :components (;(:file "package") ;see if this helps
                         (:file "test")
                        ) 
            :depends-on (kme))
   ))
