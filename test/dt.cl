;(in-package :decisiontree)
;dt2 go from kme
(in-package :kme) 
;make is use this:
;(in-package :decisiontree)
;io.lisp already loads this into KM instances, so find a way to use that
;Might want an R/iPy/etc data-frame approach, so KM would just wrap that/?

(defparameter *instance-list* (loop for i from 1 to 14 collect (make-instance 'instance)))


;;Below is a very ugly method of initializing the instance list. A better way would be to 
;; Use "define-instance" and push the result into a list.
;; Eg: (push (define-instance <Class> <attr-value pair>) <list>)
(defun i2cn (i y)
  "cp over class-name"
  (let ((kcn (gv i "class-name")))
    (setf (decisiontree:class-name y) kcn)))
;if set-attribute-value  class-name was enough below, could skip i2cn
;;
(defun i2ins (i y)
  "km2clos ins"
  (mapcar #'(lambda(z) (decisiontree::set-attribute-value (first z) (cdr z) y)
                       (i2cn i y)
                       (cdr z)) ;ret-val
          (butlast ;don't need2set the 'data class
            (i2al i)) 
          ))

(defun all-i2ins ()
  (let ((ki (all))
        (iy *instance-list*))
    ;mapcar #'(lambda(x y) (i2ins x y)) ..
    (mapcar #'i2ins ki iy)))

(trace all-i2ins i2ins
       i2cn
       i2al)

(all-i2ins)
;instead of:
#+ignore
(mapcar #'(lambda(x y)
	    (mapcar #'(lambda(z)
			(set-attribute-value (first z) (second z) y))
		    x))
	'(((outlook Sunny) (temp Hot) (humidity High) (wind Weak))
	  ((outlook Sunny) (temp Hot) (humidity High) (wind Strong))
	  ((outlook Overcast) (temp Hot) (humidity High) (wind Weak))
	  ((outlook Rain) (temp Mild) (humidity High) (wind Weak))
	  ((outlook Rain) (temp Cool) (humidity Normal) (wind Weak))
	  ((outlook Rain) (temp Cool) (humidity Normal) (wind Strong))
	  ((outlook Overcast) (temp Cool) (humidity Normal) (wind Strong))
	  ((outlook Sunny) (temp Mild) (humidity High) (wind Weak))
	  ((outlook Sunny) (temp Cool) (humidity Normal) (wind Weak))
	  ((outlook Rain) (temp Mild) (humidity Normal) (wind Weak))
	  ((outlook Sunny) (temp Mild) (humidity Normal) (wind Strong))
	  ((outlook Overcast) (temp Mild) (humidity High) (wind Strong))
	  ((outlook Overcast) (temp Hot) (humidity Normal) (wind Weak))
	  ((outlook Rain) (temp Mild) (humidity High) (wind Strong)))
	*instance-list*)

#+ignore ;should already be set from km ins
(mapcar #'(lambda(x y)
	    (setf (class-name x) y))
	*instance-list*
	'(No No Yes Yes Yes No Yes No Yes Yes Yes Yes Yes No))


;; End of ugly initialization

(defparameter *root-node* (decisiontree:create-classifier *instance-list*))

(trace decisiontree:classify)

(defvar *c*
 (decisiontree:classify *root-node* ;;Root of the tree
	  (decisiontree:define-instance ? (outlook Sunny) (temp Mild) (humidity High) (wind Strong)))
 )

;shorten the original tests, by just calling the routines on the present data:
(print (decisiontree::get-class-list *instance-list*))
(print (decisiontree::get-attribute-list (first *instance-list*)))
(print (decisiontree::get-possible-attribute-values  *instance-list* 'KM::|temp|))
(print (decisiontree::get-instances-with-specific-instance-values  *instance-list* 'KM::|temp| "Cool"))
