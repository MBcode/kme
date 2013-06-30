(in-package #:cl-user)
#+quicklisp (defun ql (a) (ql:quickload  a))
#+quicklisp (defun qa (a) (ql:system-apropos  a))
#+quicklisp (defun qd (a) (ql:who-depends-on  a)) 
(defun al (l) "asdf load" (asdf:oos 'asdf:load-op l))

;I should get all these libs down in :depends-on
(ql 'km)
;(lt) ;was test for new u2.lisp fncs
(ql 'cl-csv) ;for io
;ML libs
;(ql 'arnesi) ;for dt
;(al 'cl-decision-tree) ;https://github.com/kroger/cl-decision-tree
;or:
(ql 'lisp-unit)
(al 'decisiontree)        ;https://github.com/reubencornel/cl-decisiontree
;or
;(al 'cl-decision-tree)   ;https://github.com/kroger/cl-decision-tree.git
;&/or start by integrating a pkg w/a wider variety of routines
;=deciding on how to interface the km/e data w/the present dt data

(in-package #:cl-user)

(defun in () 
  (in-package :kme))

;defpackage :kme-system
(defpackage :kme
    (:use #:cl #:asdf 
         #:km #:decisiontree
          )
   (:export :i2al :all) ;will be more
   ;(:export "taxonomy" "show" "showme" "km" "all-instances") ;these are km
  ;(:export :taxonomy :show :showme :km :load-kb :all-instances :save-kb :get-slotsvals :all)
    ) ;consider a packages.lisp file

;(in-package :kme-system)
(in-package :kme)
;#+ignore
(import 'km::(taxonomy show showme km load-kb all-instances save-kb
                       get-slotsvals
                       km-slotvals put-vals ;needed in kmb
                       ;every ;another way to do 'all'
                       ))

(defun lo () (sb-ext:exit)) ;better one in my .sbclrc
(defun bt (&optional (n 7)) (sb-debug:backtrace n))

(asdf:defsystem kme
  :name "kme"
  :version "0.0.1"
  :maintainer "bobak@balisp.org"
  :author "bobak"
  :licence "GPL-ish tbd"
  :description "km for ML/discovery/etc" 
  :serial t
  :components (;(:file "package") ;see if this helps
                (:file "util_mb")
               ;(:file "util_km") ;maybe transition u2 here?
                (:file "u2")
                (:file "kmb")
                (:file "io")
                ) 
  :depends-on (km))

(import 'km::(svl gvl ;gvl was in u2.lisp
               pin typ)) ;newer kmb km utils

;try calling a ml fnc then run more of it's tests:
; work on this load &/or make a more simple test
;(load "test/decisiontreeTests.lisp" :print t)

;;(load "test/decisiontreeT.lisp" :print t)
;(load "test/dt.cl" :print t)
;try loading from ld.cl 

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

;want to finish dt, work on a larger family of ML routines, &get a sparql client in
;also, using lisp for: https://class.coursera.org/optimization-001 which I'd like to use here too.
;Will focus on lisp ml libs, but might call out to others
