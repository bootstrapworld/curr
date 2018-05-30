#lang curr/lib

@(define exprs '(;(- (+ 17 16) (* 13 17))
                 ;(+ (* 12 5) 24)
                 ;(- (* 4 13) (- 19 21))
                 ;(- 21 (* 4 13))
                 ;(- (- 19 9) (* (+ 10 9) -3))
                 ;(* 1 (* 21 10))
                 (- (* 17 (* 5 5)) 4)
                 (/ 8 (* 7 6))
                 (* (+ 8 (- 0 1)) (/ 25 5))
                 (/ (+ 0 4) (- 0 13))
                 (* 9 (- 34 9))
                 ))

@(define exprs-as-coe (map sexp->coe exprs))
@(define exprs-as-code (map sexp->code exprs))

@(exercise-handout 
  #:title  "Conversión de círculos de evaluación al código"
  #:instr "Para cada Círculo de Evaluación en el lado izquierdo, escriba el código para el círculo en el lado derecho: " 
  #:forevidence (exercise-evid-tags "BS-CE&1&4")
  @(open-response-exercise exprs-as-coe "code")
  @(exercise-answers
    (questions-and-answers exprs-as-coe exprs-as-code))
  )
