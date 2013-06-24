(in)

(load-kb "kme.km") ;"../kme.km"
;Loading kme.km...
;kme.km loaded!

(sv-cls "inst1" "data")
;ka:(*inst1 has (instance-of (data))),CONS

(sv "inst1" "val" 1)
;ka:(*inst1 has (val (1))),CONS

(taxonomy)
;Removing redundant superclasses...
;Removing redundant subclasses...
;Computing subclasses of Thing...
;Thing
;   data
;I     *inst1 

 ;(showme 'km::|*inst1|)
 ;or now:
(show "inst1")
;(*inst1 has 
;  (instance-of (data))
;  (val (1))) 
 
(print (gv "inst1" "val")) 
;1
