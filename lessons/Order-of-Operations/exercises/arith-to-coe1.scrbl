#lang curr/lib

@(define exprs '((- 4 (- 6 17))
		 (- (+ 25 14) 12)	
		 (+ 1 (* 15 5))
		 (* (+ 2 17) (- 12 8))
		 (* (* 23 14) (+ 3 20))
		 (+ (- 5 17) (* 14 5))
		 (* 9 (+ 17 2))
		 (- 19 (+ 12 11))
		 ))

@(define exprs-as-math (map sexp->math exprs))
@(define exprs-as-coe (map sexp->coe exprs))

@(exercise-handout 
  #:title "Creating Circles of Evaluation from Arithmetic Expressions"
  #:instr "For each math expression in the lefthand column below, draw its Circle of Evaluation in the box on the righthand column"
  @(open-response-exercise (map sexp->math exprs))
  @(exercise-answers
    (completion-exercise exprs-as-math exprs-as-coe))
  )

