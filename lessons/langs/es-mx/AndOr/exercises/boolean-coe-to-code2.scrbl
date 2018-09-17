#lang curr/lib

@(define exprs '((and (string=? place "safe") 
                      (or (>= x 50) (<= y 2)))
                 (and (or (= 6 7) (> 7 5)) (< 8 10))
                 (string=? "6" "7")
                 (> (+ 6 7) 15)
                 (or (= (* 6 5) 30) (< 8 9)) 
                 ;(= (string-length "Bananas") 8) 
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
