
(defpackage :kme
    (:use :common-lisp
          ;#:cl ;#:asdf 
          :km ;#:km 
          ;#:decisiontree
          )
   ;(:export "taxonomy" "show" "showme" "km" "all-instances")
   (:import-from :km
                 :taxonomy 
                 ;:show 
                 :showme :km :load-kb :all-instances :save-kb
                 ;:PORT-TO-PACKAGE
                  ;:gvl :svl :pin :typ 
                ;:eval-km :typ-p :is-a-p
                       :get-slotsvals))


#+ignore
(import 'km::(taxonomy show showme km load-kb all-instances save-kb
                       get-slotsvals))
;(km:port-to-package '(taxonomy show showme km load-kb all-instances save-kb get-slotsvals) :kme)
(defun lo () (sb-ext:exit)) ;better one in my .sbclrc
(defun bt (&optional (n 7)) (sb-debug:backtrace n))

