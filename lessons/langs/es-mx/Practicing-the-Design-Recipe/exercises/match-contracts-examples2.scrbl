#lang curr/lib 

@(define e5a
   (code #:multi-line #t
"(EXAMPLE (match 30)
         (star (* 30 2) \"outline\" \"purple\"))"))
   
@(define e5b
   (code #:multi-line #t
"(EXAMPLE (match 24)
         (star (* 24 2) \"outline\" \"purple\"))")) 

@(define e6a
   (code #:multi-line #t
"(EXAMPLE (match (triangle 20 \"outline\" \"brown\") 3)
          (* 3 
            (image-height 
               (triangle 20 \"outline\" \"brown\"))))"))
   
@(define e6b
   (code #:multi-line #t
"(EXAMPLE (match (circle 10 \"solid\" \"silver\") 
                16)
         (* 16 
            (image-height 
                (circle 10 \"solid\" \"silver\"))))"))

@(define e7a
   (code #:multi-line #t
"(EXAMPLE (match \"triangle\" \"blue\")
         (triangle 40 \"outline\" \"blue\"))"))

@(define e8a
   (code #:multi-line #t
"(EXAMPLE (match (string-length \"coffee\") 
                 (string-length \"tea\"))
         (+ 6 3))"))



@(define e9a
   (code #:multi-line #t
"(EXAMPLE (match (string-length \"tabletop\"))
         \"8\")"))

@(define e9b
   (code #:multi-line #t
"(EXAMPLE (match 1.50)
         \"greater than 1\")"))

@(define c5 (code "; match : number -> image"))
@(define c6 (code "; match : image number -> number"))
@(define c7 (code "; match : string string -> image"))
@(define c8 (code "; match : number number -> number"))
@(define c9 (code "; match : number -> string"))

@(define answer-key
   (list  (list e5a c5)
          (list e5b c5)
          (list e6a c6)
          (list e6b c6)
          (list e7a c7)
          (list e8a c8)
          (list e9a c9)
          (list e9b c9)
          ))

@(define ques (map car answer-key))
@(define ans (map cadr answer-key))
@(define permuted-ans (list c8 c9 c7 c5 c6))

@(exercise-handout
  #:title "Ejercicio: Contratos y Ejemplos Coincidentes"
  #:instr "Haga coincidir cada ejemplo a la izquierda con el contrato a la derecha. NOTA: Múltiples ejemplos
           puede coincidir con el mismo contrato!"
  #:forevidence (exercise-evid-tags "BS-DR.2&1&2" "F-IF.1-3&1&1" "F-IF.1-3&1&2")
  @(matching-exercise ques permuted-ans)
  @(exercise-answers 
     (matching-exercise-answers ques ans permuted-ans))
)

