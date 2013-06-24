(in)
(load-kb "kme.km") ;"../kme.km"
(sv-cls "inst1" "data")
(sv "inst1" "val" 1)
(taxonomy)
(showme 'km::|*inst1|)

;expect to see:
;Loading kme.km...
;kme.km loaded!
;ka:(*inst1 has (instance-of (data))),CONS
;ka:(*inst1 has (val (1))),CONSRemoving redundant superclasses...
;Removing redundant subclasses...
;Computing subclasses of Thing...
;Thing
;   data
;I     *inst1 
;(*inst1 has 
;  (instance-of (data))
;  (val (1))) 
