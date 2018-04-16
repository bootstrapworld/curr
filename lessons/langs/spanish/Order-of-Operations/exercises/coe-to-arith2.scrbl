#lang curr/lib

@(define exprs (list ;'(+ 4 5) 
                     ;'(* 7 6)
                     ;'(- (* 2 3) (+ 1 0))
                     ;'(- (+ 5 8) 12)
                     ;'(* -2 -6)
                     ;'(+ (* (- 4 1) -2) 12)
                     '(/ 10 (* 2 (+ 3 1)))
                     '(/ 5 20)
                     '(+ (* 5 6) (/ 7 3))
                     '(* 4 (+ -9 8))
                     '(- (* 7 12) 8)
                     '(- 9 (+ 4 5))
                     ;'(+ (/ 56 (* 2 4)) (- -7 3))
                     ;'(/ (* 9 12) 12)
                     ))
@(define sexps-as-coe (map sexp->coe exprs))
@(define sexps-as-math (map sexp->math exprs))

@(exercise-handout 
  #:title "Conversión de círculos de evaluación en expresiones aritméticas"
  #:instr "Para cada círculo de evaluación a la izquierda, escribe la expresión aritmética
           a la derecha:"
  #:forevidence (exercise-evid-tags "BS-CE&1&3")
  @(open-response-exercise sexps-as-coe "math")
  @(exercise-answers (questions-and-answers sexps-as-coe sexps-as-math))
  )

