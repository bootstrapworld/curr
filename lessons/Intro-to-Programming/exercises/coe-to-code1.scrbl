#lang curr/lib

@(define exprs '((- (+ 17 16) (* 13 17))
                 (+ (* 12 5) 24)
                 (- (* 4 13) (- 19 21))
                 (- 21 (* 4 13))
                 (- (- 19 9) (* (+ 10 9) -3))
                 (* 1 (* 21 10))
                 (- (* 17 (* 5 5)) 4)
                 (/ 8 (* 7 6))
                 (+ 76 (- 9 0))
                 (* (+ 8 (- 0 1)) (/ 25 5))
                 (/ (+ (- 4 9) 4) (- (* 0 4) 13))
                 (* 9 (- 34 9))
                 ))

@(define exprs-as-coe (map sexp->coe exprs))
@(define exprs-as-code (map sexp->code exprs))

@(exercise-handout 
  #:title "Converting Circles of Evaluation to Code"
  #:instr "For each Circle of Evaluation on the left-hand side, write the code
           for the Circle on the right-hand side:" 
  #:forevidence (exercise-evid-tags "BS-CE&1&4")
  @(open-response-exercise exprs-as-coe "code")
  @(exercise-answers
    (questions-and-answers exprs-as-coe exprs-as-code))
  )
