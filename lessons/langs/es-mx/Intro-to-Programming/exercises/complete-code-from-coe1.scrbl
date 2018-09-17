#lang curr/lib

@(define exprs '((+ 16 (* 6 -3))
                 (- (+ 25 13) (* 2 4))
                 (* (+ 10 4) 28)
                 (* 13 (/ 7 (+ 2 -4)))
                 (+ (/ (+ 8 1) 3) (- 5 3))
                 ))

@(define exprs-with-holes '((+ BSLeaveAHoleHere (* 6 BSLeaveAHoleHere))
			    (- (+ BSLeaveAHoleHere 13) (BSLeaveAHoleHere BSLeaveAHoleHere 4))
			    (BSLeaveAHoleHere (+ BSLeaveAHoleHere 4) BSLeaveAHoleHere)
			    (* BSLeaveAHoleHere (/ BSLeaveAHoleHere (+ 2 -4)))
			    (+ BSLeaveAHoleHere3 (- BSLeaveAHoleHere 3))
			    ))

@(define exprs-as-code (map sexp->code exprs))
@(define exprs-as-coe (map sexp->coe exprs))

@(exercise-handout 
  #:title "Completar el código a partir de los Círculos de Evaluación"
  #:instr "Cada Círculo de Evaluación en la columna de la izquierdo ha sido parcialmente convertido al código en la columna de la derecha.

   Complete el código, llenando los espacios en blanco, de manera que corresponda al Circulo."
  #:forevidence (exercise-evid-tags "BS-CE&1&4")
  @(completion-exercise exprs-as-coe (map sexp->code exprs-with-holes)) 
  @(exercise-answers
     (completion-exercise exprs-as-coe exprs-as-code))
  )

