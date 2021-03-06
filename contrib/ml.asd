;http://www.cs.cmu.edu/afs/cs.cmu.edu/project/ai-repository/ai/areas/learning/systems/utexas/progs/0.html 
;http://www.cs.cmu.edu/afs/cs.cmu.edu/project/ai-repository/ai/areas/learning/systems/utexas/progs/readme.txt
(defsystem ml
 :name "ml"
 :version "0.0.1"
 :maintainer "asd,bobak"
 :author "Raymond J. Mooney"
 :description "adding asd" 
 :components (
  (:module ml :components (  
    (:file "data-utilities")
    (:file "deduce")
    (:file "theory-utilities")
    (:file "binary-encoder")
    (:file "t-test")
    (:file "aq")
    (:file "backprop-multi")
    (:file "backprop")
    (:file "bayes-indp")
    (:file "c4.5-multi")
    (:file "c4.5")
    (:file "cobweb")
    (:file "data-generator")
    (:file "dlist")
    (:file "dna-standard")
    (:file "id3-all")
    (:file "id3-all-multi"  :depends-on ("id3-all"))
    (:file "knn")
    (:file "labor-neg")
    ;(:file "learn-curves") ;needs clasp ;see if cl-stats will help
    (:file "perceptron")
    (:file "pfoidl")
    (:file "pfoil-cnf")
    (:file "pfoil")
    (:file "pgolem")
    ;(:file "sample-dna-saved-tests")  ;check on
    (:file "universal-tester")
    (:file "univ-tester-multi" :depends-on ("universal-tester"))
    )  :serial t)))
