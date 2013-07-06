(in-package #:cl-user)
#+quicklisp (defun ql (a) (ql:quickload  a))
#+quicklisp (defun qa (a) (ql:system-apropos  a))
#+quicklisp (defun qd (a) (ql:who-depends-on  a)) 
(defun al (l) "asdf load" (asdf:oos 'asdf:load-op l))
;later combine all ql/al into one big load list

;I should get all these libs down in :depends-on
(ql 'km)
;(lt) ;was test for new u2.lisp fncs
;io, consider a dir, have some sqlite, also use lq
(ql 'cl-csv) ;for io ;look@ data-table, not yet
(ql 'trivial-shell) ;for io
(lq) ;in my .sbclrc ;pnathan/cl-linq
;ML/stat.. libs
(ql 'mgl-example)
(al 'ml)
(ql 'cl-bayesnet) ;get into dne or get around
(al 'sapa)
(ql 'cl-mathstats)
(ql 'screamer) ;try on optimization assignments
;(ql 'cl-graph) ;might want2try
;(ql 'kr) ;km has most of ;miss garnet
;(ql 'arnesi) ;for dt
;(al 'cl-decision-tree) ;https://github.com/kroger/cl-decision-tree
;or: ;might skip these soon:
(ql 'lisp-unit)
(al 'decisiontree)        ;https://github.com/reubencornel/cl-decisiontree
;or
;http://www.cc.gatech.edu/classes/cs3361_99_spring/projects/project3/decision-tree.lisp or
;http://www.cs.cmu.edu/afs/cs/project/theo-11/www/decision-trees.lisp but algo right on km ins
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
   (:export :i2al :all   ;will be more
            ;:gv :gvl ;:km
            :lo :bt)
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
;
;Want to start a dir for the ML routines, might start w/my LispUtils/stat dir, and add
; http://compbio.ucdenver.edu/Hunter_lab/Hunter/cl-statistics.lisp to it.
