#lang curr/lib

@(define exprs '((and (string-equal place "safe") 
                      (or (>= x 50) (<= y 2)))
                 (and (or (= 6 7) (> 7 5)) (< 8 10))
                 (string-equal "6" "7")
                 (> (+ 6 7) 15)
                 (or (= (* 6 5) 30) (< 8 9)) 
                 ;(= (string-length "Bananas") 8) 
                 ))

@(define exprs-as-coe (map sexp exprs))
@(define exprs-as-code (map sexp->code exprs))

@(exercise-handout 
  #:title "Converting Circles of Evaluation with Booleans to Code"
  #:instr "For each Circle of Evaluation in the left column, write the code that corresponds to the Circle in the right column:"
  #:forevidence (exercise-evid-tags "BS-CE&1&4")
  @(open-response-exercise exprs-as-coe "code")
  @(exercise-answers (questions-and-answers exprs-as-coe exprs-as-code))
  )
