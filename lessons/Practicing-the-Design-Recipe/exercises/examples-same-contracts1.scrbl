#lang curr/lib

@(define e1
   (code #:multi-line #t
"(EXAMPLE (mystery 30)
         (* 30 50))
(EXAMPLE (mystery 10)
         (text \"Welcome!\" 10 \"darkgreen\"))"))
@(define a1 "no match (the range types are different)")


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
@(define a3 "no match (the domain types are different)")


@(define e4
   (code #:multi-line #t
"(EXAMPLE (mystery \"green\" 32)
         (circle 32 \"outline\" \"green\"))
(EXAMPLE (mystery 18 \"green\")
         (circle 18 \"outline\" \"green\"))"))
@(define a4 "no match (the domain types are in different orders)")

@(define e5
   (code #:multi-line #t
"(EXAMPLE (mystery 6 9 10)
         (/ 6 (+ 9 10)))
(EXAMPLE (mystery 3 7)
         (/ 3 (+ 7 10)))"))
@(define a5 "no match (the domains have different numbers of arguments)")

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


@(define e8
   (code #:multi-line #t
"(EXAMPLE (mystery \"Free Phone\" 25 \"darkgreen\")
         (text \"Free Phone\" 25 \"darkgreen\"))
(EXAMPLE (mystery 25 \"Free Phone\")
         (text \"Free Phone\" 25 \"darkgreen\"))"))
@(define a8 "no match (the domains have different numbers and order of arguments)")

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

@(define e16
   (code #:multi-line #t
"(EXAMPLE (mystery 4 \"double\") 
          (* 4 2))
(EXAMPLE (mystery 10 \"half\") 
          (/ 10 2))"))
@(define a16 (code "; mystery : number string -> number"))



@(exercise-handout
  #:title "Do Examples Have the Same Contracts?"
  #:instr "For each pairs of Examples below, decide whether the two examples
           have the same contract. If they do, fill in the contract in the space
           provided. If not, write a few words explaining why."
  #:forevidence (exercise-evid-tags "BS-DR.2&1&2" "F-IF.1-3&1&1" "F-IF.1-3&1&2")
  @(create-exercise-itemlist/contract-answers (list e1 e2 e3 e4 e5 e6 e7 e8 e11 e9 e10 e12 e13 e14 e15 e16))
  @(exercise-answers
     (questions-and-answers (list e1 e2 e3 e4 e5 e6 e7 e8 e11 e9 e10 e12 e13 e14 e15 e16)
                            (list a1 a2 a3 a4 a5 a6 a7 a8 a11 a9 a10 a12 a13 a14 a15 a16))))
   
