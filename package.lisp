
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
                  ;:gvl :svl :pin :typ 
                ;:eval-km :typ-p :is-a-p
                       :get-slotsvals))

(defun lo () (sb-ext:exit)) ;better one in my .sbclrc
