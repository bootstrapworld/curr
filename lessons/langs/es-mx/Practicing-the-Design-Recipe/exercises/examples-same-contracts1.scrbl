#lang curr/lib

@(define e1
   (code #:multi-line #t
"(EXAMPLE (mystery 30)
         (* 30 50))
(EXAMPLE (mystery 10)
         (text \"Welcome!\" 10 \"darkgreen\"))"))
@(define a1 "no coincide (los tipos de rango son diferentes)")


@(define e2
   (code #:multi-line #t
"(EXAMPLE (mystery 30 40)
         (- 40 (* 2 30)))
(EXAMPLE (mystery 10 15)
         (- 15 (* 2 10)))"))
@(define a2 (code "; mystery : number number -> number"))


@(define e3
   (code #:multi-line #t
"(EXAMPLE (mystery \"New York\")
         (text \"New York\" 20 \"red\"))
(EXAMPLE (mystery 20)
         (text \"New York\" 20 \"red\"))"))
@(define a3 "no coincide (los dominios tienen diferentes números de argumentos)")


@(define e4
   (code #:multi-line #t
"(EXAMPLE (mystery \"green\" 32)
         (circle 32 \"outline\" \"green\"))
(EXAMPLE (mystery 18 \"green\")
         (circle 18 \"outline\" \"green\"))"))
@(define a4 "no coincide (los dominios tienen diferentes números de argumentos)")

@(define e5
   (code #:multi-line #t
"(EXAMPLE (mystery 6 9 10)
         (/ 6 (+ 9 10)))
(EXAMPLE (mystery 3 7)
         (/ 3 (+ 7 10)))"))
@(define a5 "no coincide (los dominios tienen diferentes números de argumentos)")

@(define e6
   (code #:multi-line #t
"(EXAMPLE (mystery \"red\" \"blue\")
         (text \"blue\" 25 \"red\"))
(EXAMPLE (mystery \"purple\" \"Go Team!\")
         (text \"Go Team!\" 25 \"purple\"))"))
@(define a6 (code "; mystery : string string -> image"))


@(define e7
   (code #:multi-line #t
"(EXAMPLE (mystery (circle 55 \"outline\" \"black\") 12)
         (scale 12 (circle 55 \"outline\" \"black\")))
(EXAMPLE (mystery (rectangle 24 32 \"outline\" \"purple\") 5)
         (scale 5 (rectangle 24 32 \"outline\" \"purple\")))"))
@(define a7 (code "; mystery : image number -> image"))




@(exercise-handout
  #:title "¿Los ejemplos tienen los mismos contratos?"
  #:instr "Para cada par de ejemplos a continuación, decida si los dos ejemplos
           tener el mismo contrato Si lo hacen, completa el contrato en el espacio
           previsto. Si no, escriba algunas palabras explicando por qué."
  #:forevidence (exercise-evid-tags "BS-DR.2&1&2" "F-IF.1-3&1&1" "F-IF.1-3&1&2")
  @(create-exercise-itemlist/contract-answers (list e1 e2 e3 e4 e5 e6 e7))
  @(exercise-answers
     (questions-and-answers (list e1 e2 e3 e4 e5 e6 e7)
                            (list a1 a2 a3 a4 a5 a6 a7))))
   
