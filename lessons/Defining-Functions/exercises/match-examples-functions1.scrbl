#lang curr/lib

@;apparent misalignment in second piece of each first example is intentional
@;to make code render aligned once scribbled

@(define e1
   (code #:multi-line #t 
"(EXAMPLE (mystery \"red\") 
         (circle 10 \"solid\" \"red\"))
(EXAMPLE (mystery \"orange\") 
         (circle 10 \"solid\" \"orange\"))"))

@(define f1
   (code #:multi-line #t
"(define (mystery c)
  (circle 10 \"solid\" c))"))

@(define e2
   (code #:multi-line #t
"(EXAMPLE (mystery 30) 
         (circle 30 \"outline\" \"red\"))
(EXAMPLE (mystery 10) 
         (circle 10 \"outline\" \"red\"))"))

@(define f2
   (code #:multi-line #t
"(define (mystery r)
  (circle r \"outline\" \"red\"))"))

@(define e3
   (code #:multi-line #t
"(EXAMPLE (mystery 30) 
         (rectangle 30 10 \"outline\" \"red\"))
(EXAMPLE (mystery 10) 
         (rectangle 10 10 \"outline\" \"red\"))"))

@(define f3
   (code #:multi-line #t
"(define (mystery w)
  (rectangle w 10 \"outline\" \"red\"))"))

@(define e4
   (code #:multi-line #t
"(EXAMPLE (mystery 30) 
         (rectangle 20 30 \"solid\" \"red\"))
(EXAMPLE (mystery 20) 
         (rectangle 20 20 \"solid\" \"red\"))
(EXAMPLE (mystery 10) 
         (rectangle 20 10 \"solid\" \"red\"))"))

@(define f4
   (code #:multi-line #t
"(define (mystery h)
  (rectangle 20 h \"solid\" \"red\"))"))

@(define e5
   (code #:multi-line #t
"(EXAMPLE (mystery 2) 
         (+ 2 2))
(EXAMPLE (mystery 4) 
         (+ 4 4))
(EXAMPLE (mystery 5) 
         (+ 5 5))
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
  (rectangle 10 h \"solid\" \"red\"))"))

@(define examples-lst (list e1 e2 e3 e4 e5))
@(define functions-lst (list f1 f2 f3 f4 f5))
@(define permuted-functions-lst (list f2 f6 f3 f5 f7 f1 f4))

@(exercise-handout 
  #:title "Matching Examples and Function Definitions"
  #:instr "Match the EXAMPLEs on the left with the definitions on the right. NOTE: Some definitions may not match any examples!"
  @;#:forevidence (list "BS-DR&1&5" "F-IF.1-3&1&2" "F-IF.1-3&1&4" "F-LE.1-4&1&5")
  @(matching-exercise examples-lst permuted-functions-lst)
  @(exercise-answers
    (matching-exercise-answers examples-lst functions-lst permuted-functions-lst)))


