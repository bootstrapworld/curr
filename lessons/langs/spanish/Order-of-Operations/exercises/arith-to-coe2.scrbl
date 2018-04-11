#lang curr/lib

@(define exprs '(;(- 4 (- 6 17))
                 ;(- (+ 25 14) 12)	
                 ;(+ 1 (* 15 5))
                 (* (+ 2 17) (- 12 8))
                 (* (* 23 14) (+ 3 20))
                 (+ (- 5 17) (* 14 5))
                 ;(* 9 (+ 17 2))
                 ;(- 19 (+ 12 11))
                 ;(/ 7 (* 7 (+ 9 8)))
                 ))

@(define exprs-as-math (map sexp->math exprs))
@(define exprs-as-coe (map sexp->coe exprs))

@(exercise-handout 
  #:title "Creando círculos de evaluación a partir de expresiones aritméticas"
  #:instr "Para cada expresión matemática de la izquierda, dibuje su círculo de evaluación a la derecha."
  #:forevidence (exercise-evid-tags "BS-CE&1&1" "BS-CE&1&2")
  @(open-response-exercise (map sexp->math exprs) "circeval")
  @(exercise-answers
    (questions-and-answers exprs-as-math exprs-as-coe))
  )