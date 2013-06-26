;bobak@balisp.org
(in-package :kme)
(defvar *train* "train") ;can pull from the name of the input file
;last used read csv to clean up some kaggle data
(defvar *h* ;read&construct this instead of hard-coding
  '(classified 
     outlook temp humidity wind))

(defun read-data-csv (&optional (file #p"train.csv"))
  (cl-csv:read-csv file ;(str-cat "data/" file ".csv") 
                   :skip-first-p t
         :map-fn #'(lambda (l)
                     (let* ((name-str (symbol-name (gentemp *train*)))
                            ;(name-str (clean_se (third l)))
                            (name (k_i (under_ name-str)))
                            )
                        ;(sv-al name (mkalst-n *h* l 4))
                        (sv-al name (mkhl *h* l))
                        ;(sv-cls name (fourth l)) 
                        (sv-cls name "data") 
                        ))))
