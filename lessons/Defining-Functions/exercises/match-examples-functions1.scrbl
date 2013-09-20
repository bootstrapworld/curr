#lang curr/lib

@(define exprs (list '(+ 4 5) 
                     '(* 7 6)
                     '(- (* 2 3) (+ 1 0))
                     '(- (+ 5 8) 12)
                     '(* -2 -6)
                     '(+ (* (- 4 1) -2) 12)
                     '(/ 10 (* 2 (+ 3 1)))
                     ))

@(define e1
   (code #:multi-line #t 
"(EXAMPLE (mystery \"red\")    (circle 10 \"red\"))
(EXAMPLE (mystery \"orange\") (circle 10 \"orange\"))"))

@(define f1
   (code #:multi-line #t
"(define (mystery c)
  (circle 10 c))"))

@(define e2
   (code #:multi-line #t
"(EXAMPLE (mystery 30) (circle 30 \"red\"))
(EXAMPLE (mystery 10) (circle 10 \"red\"))"))

@(define f2
   (code #:multi-line #t
"(define (mystery r)
  (circle r \"red\"))"))

@(define e3
   (code #:multi-line #t
"(EXAMPLE (mystery 30) (rectangle 30 10 \"red\"))
(EXAMPLE (mystery 10) (rectangle 10 10 \"red\"))"))

@(define f3
   (code #:multi-line #t
"(define (mystery w)
  (rectangle w 10 \"red\"))"))

@(define e4
   (code #:multi-line #t
"(EXAMPLE (mystery 30) (rectangle 20 30 \"red\"))
(EXAMPLE (mystery 20) (rectangle 20 20 \"red\"))
(EXAMPLE (mystery 10) (rectangle 20 10 \"red\"))"))

@(define f4
   (code #:multi-line #t
"(define (mystery h)
  (rectangle 20 h \"red\"))"))

@(define e5
   (code #:multi-line #t
"(EXAMPLE (mystery 2) (+ 2 2))
(EXAMPLE (mystery 4) (+ 4 4))
(EXAMPLE (mystery 5) (+ 5 5))
"))

@(define f5
   (code #:multi-line #t
"(define (mystery num)
  (+ num num))"))

@(define f6
   (code #:multi-line #t
"(define (mystery num)
  (* num 2))"))

@(define f7
   (code #:multi-line #t
"(define (mystery h)
  (rectangle 10 h \"red\"))"))

@(define examples-lst
   (list e1 e2 e3 e4 e5 "" ""))

@(define functions-lst
   (list 
    f2
    f6
    f3
    f5
    f7
    f1
    f4
    ))

@(exercise-handout 
  #:title "Matching Examples and Function Definitions"
  #:instr "The left column shows several collections of Examples, each with the same fake function names.
           The right column has several functions.  Figure out which function goes with each collection of
           examples.  You might not use all of the functions."

  @;Using matching exercise to override right floats of CoE in CSS
  @(matching-exercise examples-lst functions-lst)) 

