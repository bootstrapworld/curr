#lang curr/lib


@(define e9
   (code #:multi-line #t
"(EXAMPLE (mystery (triangle 70 \"solid\" \"green\"))
         (triangle 140 \"solid\" \"green\"))
(EXAMPLE (mystery (circle 100 \"solid\" \"blue\"))
         (circle 200 \"solid\" \"blue\"))"))
@(define a9 (code "; mystery : image -> image"))

@(define e10
   (code #:multi-line #t
"(EXAMPLE (mystery \"red\")
         (triangle 140 \"solid\" \"red\"))
(EXAMPLE (mystery \"blue\" \"circle\"))
         (circle 140 \"solid\" \"blue\"))"))
@(define a10 "no match (the domains have different numbers of arguments)")

@(define e11
   (code #:multi-line #t
"(EXAMPLE (mystery \"+\" 4 5) 
          (+ 4 5))
(EXAMPLE (mystery \"sqrt\" 25)) 
         (sqrt 25))"))
@(define a11 "no match (the domains have different numbers of arguments)")

@(define e12
   (code #:multi-line #t
"(EXAMPLE (mystery \"circle\" 4) 
          (* pi (sqr 4)))
(EXAMPLE (mystery \"square\" 5)) 
         (sqr 5))"))
@(define a12 (code "; mystery : string number -> number"))
   
@(define e13
   (code #:multi-line #t
"(EXAMPLE (mystery \"dog\") 
          3)
(EXAMPLE (mystery \"cat\") 
         \"kitten\")"))
@(define a13 "no match (the range types are different)")


@(define e14
   (code #:multi-line #t
"(EXAMPLE (mystery \"dog\") 
          3)
(EXAMPLE (mystery \"kitten\") 
         6)"))
@(define a14 (code "; mystery : string -> number"))
   
@(define e15
   (code #:multi-line #t
"(EXAMPLE (mystery 4 5 \"big\") 
          (scale 2 (rectangle 4 5 \"solid\" \"blue\")))
(EXAMPLE (mystery 10 \"small\" 4) 
          (scale .5 (rectangle 10 4 \"solid\" \"blue\")))"))
@(define a15 "no match (the domains have different orders of arguments)")




@(exercise-handout
  #:title "Do Examples Have the Same Contracts?"
  #:instr "For each pairs of Examples below, decide whether the two examples
           have the same contract. If they do, fill in the contract in the space
           provided. If not, write a few words explaining why."
  #:forevidence (exercise-evid-tags "BS-DR.2&1&2" "F-IF.1-3&1&1" "F-IF.1-3&1&2")
  @(create-exercise-itemlist/contract-answers (list e11 e9 e10 e12 e13 e14 e15 ))
  @(exercise-answers
     (questions-and-answers (list e11 e9 e10 e12 e13 e14 e15 )
                            (list a11 a9 a10 a12 a13 a14 a15 ))))
   
