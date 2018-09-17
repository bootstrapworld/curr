#lang curr/lib

@(define exprs '((/ (* -1 2) 5)
                 (/ 5 (* -1 2))
		 (* (- 4 5) (+ 2 3))
		 (- (* 4 5) (+ 2 3))
		 ;(* (- (+ 2 2) 5) (+ 3 2))
		 (* (+ 5 (- 2 2)) (+ 3 2))
	         ;(+ (/ 6 3) 0)
	         ;(+ (- 5 5) (/ 6 3))
	         ))

@(define permuted-exprs
   '(;(+ (- 5 5) (/ 6 3))
     (- (* 4 5) (+ 2 3))
     (/ (* -1 2) 5)
     ;(+ (/ 6 3) 0)
     (* (- 4 5) (+ 2 3))
     (* (+ 5 (- 2 2)) (+ 3 2))
     (/ 5 (* -1 2))
     ;(* (- (+ 2 2) 5) (+ 3 2))
     ))

@(exercise-handout 
  #:title "Círculos coincidentes de evaluación y expresiones aritméticas"
  #:instr "Dibuje una línea desde cada círculo de evaluación a la izquierda hasta su expresión aritmética correspondiente a la derecha:" 
  #:forevidence (exercise-evid-tags "BS-CE&1&1" "BS-CE&1&2")
  @(matching-exercise 
    (map sexp->coe exprs)
    (map sexp->math permuted-exprs))
  @(exercise-answers
    (matching-exercise-answers #:compare-with equal?
	                       #:content-of-ans exprs
        (map sexp->coe exprs) (map sexp->math exprs) permuted-exprs))
  )
