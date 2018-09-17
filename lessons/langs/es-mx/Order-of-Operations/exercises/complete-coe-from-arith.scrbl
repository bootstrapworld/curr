#lang curr/lib

@(define exprs '((- (* 5 9) (+ 2 7))
                 (* (+ 3 12) 16)
                 (+ 20 (* -4 6))
                 (/ 15 (+ 10 (* 4 -2)))
                 (+ (/ 20 (+ 2 3)) (- 6 3))
                 (* 4 (- 8 (+ 2 3)))
                 (- (+ 4 2) (/ 10 5))
                 (+ (- 4 5) (* 5 8))
                 (/ -15 (+ 5 -8))
                 (* (+ 4 (- 9 8)) 5)
                 ))

@(define exprs-with-holes '((- (* BSLeaveAHoleHere 9) (+ 2 BSLeaveAHoleHere))
                            (* (+ 3 BSLeaveAHoleHere) BSLeaveAHoleHere)
                            (+ BSLeaveAHoleHere (* BSLeaveAHoleHere 6))
                            (/ 15 (BSLeaveAHoleHere 10 BSLeaveAHoleHere2))
                            (+ (BSLeaveAHoleHere 20 (+ BSLeaveAHoleHere 3)) (BSLeaveAHoleHere BSLeaveAHoleHere 3))
                            (* BSLeaveAHoleHere (- BSLeaveAHoleHere (BSLeaveAHoleHere 2 3)))
                            (BSLeaveAHoleHere (BSLeaveAHoleHere 4 2) (/ BSLeaveAHoleHere 5))
                            (+ (BSLeaveAHoleHere 4 5) (* BSLeaveAHoleHere BSLeaveAHoleHere))
                            (/ BSLeaveAHoleHere (+ 5 BSLeaveAHoleHere))
                            (* (BSLeaveAHoleHere 4 (BSLeaveAHoleHere 9 8)) BSLeaveAHoleHere)
                            ))

@(define exprs-as-code (map sexp->code exprs))
@(define exprs-as-coe (map sexp->coe exprs))
@(define exprs-as-math (map sexp->math exprs))

@(exercise-handout 
  #:title "Completar círculos parciales de evaluación de expresiones aritméticas"
  #:instr "Para cada expresión aritmética de la izquierda, termine el círculo de evaluación
           a la derecha completando los espacios en blanco."
  #:forevidence (exercise-evid-tags "BS-CE&1&1" "BS-CE&1&2")
  @(completion-exercise exprs-as-math (map sexp->coe exprs-with-holes))
  @(exercise-answers
     (completion-exercise exprs-as-math exprs-as-coe))
  )

