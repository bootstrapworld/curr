#lang curr/lib

@(define exprs '((> (+ 4 5) 9)
                 ;(or (> 10 11) (<= 7 9))
                 (and (< 5 10) (< 10 15))
                 (or (string=? yum "apple") (string=? yum "banana"))
                 (>= (string-length "My Game") 6)
                 (or (and (< 1 x) (< x 5))
                     (and (< 8 x) (< x 10)))
                 ))

@(define exprs-as-coe (map sexp exprs))
@(define exprs-as-code (map sexp->code exprs))

@(exercise-handout 
  #:title "Conversión de Círculos de Evaluación con Booleanos al Código"
  #:instr "Para cada círculo de evaluación en la columna de la izquierda, escriba el código que corresponde al círculo en la columna de la derecha:"
  #:forevidence (exercise-evid-tags "BS-CE&1&4")
  @(open-response-exercise exprs-as-coe "code")
  @(exercise-answers (questions-and-answers exprs-as-coe exprs-as-code))
  )
