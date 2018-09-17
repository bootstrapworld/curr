#lang curr/lib 

@(define e1a
   (code #:multi-line #t
"(EXAMPLE (match 30 \"red\")
         (+ 30 (string-length \"red\")))"))

@(define e1b
   (code #:multi-line #t
"(EXAMPLE (match 10 \"blue\")
         (+ 10 (string-length \"blue\")))"))

@(define e1c 
   (code #:multi-line #t
"(EXAMPLE (match (abs -4) \"45\")
          4)"))

@(define e2a
   (code #:multi-line #t
"(EXAMPLE (match (triangle 20 \"solid\" \"blue\") 
                3)
         (scale 3 (triangle 20 \"solid\"
                               \"blue\")))"))

@(define e2b
   (code #:multi-line #t
"(EXAMPLE (match (circle 10 \"solid\" \"orange\") 
                22)
         (scale 22 
                (circle 10 \"solid\" \"orange\")))"))

@(define e3a
   (code #:multi-line #t
"(EXAMPLE (match 5 (star 20 \"solid\" \"red\"))
         (rotate (- 90 5) 
                 (star 20 \"solid\" \"red\")))"))

@(define e3b
   (code #:multi-line #t
"(EXAMPLE (match 73 (star 10 \"outline\" \"orange\") 22)
         (rotate (- 90 73) (star 10 \"outline\" \"orange\")))"))

@(define e4a
   (code #:multi-line #t
"(EXAMPLE (match (circle 20 \"outline\" \"gold\"))
         (rotate 37 (circle 20 \"outline\" 
                              \"gold\")))"))

@(define e4b
   (code #:multi-line #t
"(EXAMPLE (match (circle 10 \"solid\" \"green\"))
         (rotate 37 
                 (circle 10 \"solid\" \"green\")))"))


@(define c1 (code "; match : number string -> number"))
@(define c2 (code "; match : image number -> image"))
@(define c3 (code "; match : number image -> image"))
@(define c4 (code "; match : image -> image"))

@(define answer-key
    (list (list e1a c1)
          (list e1b c1)
          (list e1c c1)
          (list e2a c2)
          (list e2b c2)
          (list e3a c3)
          (list e4a c4)
          (list e4b c4)
          ))

@(define ques (map car answer-key))
@(define ans (map cadr answer-key))
@(define permuted-ans (list c4 c1 c3 c2))

@(exercise-handout
  #:title "Ejercicio: Contratos y Ejemplos Coincidentes"
  #:instr "Haga coincidir cada ejemplo a la izquierda con el contrato a la derecha. NOTA: Múltiples ejemplos
           puede coincidir con el mismo contrato!"
  #:forevidence (exercise-evid-tags "BS-DR.2&1&2" "F-IF.1-3&1&1" "F-IF.1-3&1&2")
  @(matching-exercise ques permuted-ans)
  @(exercise-answers 
     (matching-exercise-answers ques ans permuted-ans))
)

