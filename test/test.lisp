(in)
(load-kb "../kme.km")
(sv-cls "inst1" "data")
(sv "inst1" "val" 1)
(taxonomy)
(showme 'km::|*inst1|)

;expect to see:
;(*inst1 has 
;  (instance-of (data))
;  (val (1))) 
