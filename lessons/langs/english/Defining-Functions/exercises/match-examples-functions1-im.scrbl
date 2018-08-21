#lang curr/lib

@;apparent misalignment in second piece of each first example is intentional
@;to make code render aligned once scribbled

@(define e1
   (code #:multi-line #t 
"examples:
 mystery(\"red\") is 
         circle(10, \"solid\", \"red\")
 mystery(\"orange\") is
         circle(10, \"solid\", \"orange\")
end"))

@(define f1
   (code #:multi-line #t
"fun mystery(c):
  circle(10, \"solid\", c)
end"))

@(define e2
   (code #:multi-line #t
"examples:
 mystery(30) is 
         circle(30, \"outline\", \"red\")
 mystery(10) is 
         circle(10, \"outline\", \"red\")
end"))

@(define f2
   (code #:multi-line #t
"fun mystery(r):
  circle(r, \"outline\", \"red\")
end"))

@(define e3
   (code #:multi-line #t
"examples:
 mystery(30) is 
         rectangle(30, 10, \"outline\", \"red\")
 mystery(10) is 
         rectangle(10, 10, \"outline\", \"red\")
end"))

@(define f3
   (code #:multi-line #t
"fun mystery(w):
  rectangle(w, 10, \"outline\", \"red\")
end"))

@(define e4
   (code #:multi-line #t
"examples:
 mystery(30) is 
         rectangle(20, 30, \"solid\", \"red\")
 mystery(20) is 
         rectangle(20, 20, \"solid\", \"red\")
 mystery(10) is 
         rectangle(20, 10, \"solid\", \"red\")
end"))

@(define f4
   (code #:multi-line #t
"fun mystery(h):
  rectangle(20, h, \"solid\", \"red\")
end"))

@(define e5
   (code #:multi-line #t
"examples:
 mystery(2) is (2 + 2)
 mystery(4) is (4 + 4)
 mystery(5) is (5 + 5)
end
"))

@(define f5
   (code #:multi-line #t
"fun mystery(num):
  num + num
end"))

@(define f6
   (code #:multi-line #t
"fun mystery(num):
  num * 2
end"))

@(define f7
   (code #:multi-line #t
"fun mystery(h):
  rectangle(10, h, \"solid\", \"red\")
end"))

@(define examples-lst (list e1 e2 e3 e4 e5))
@(define functions-lst (list f1 f2 f3 f4 f5))
@(define permuted-functions-lst (list f2 f6 f3 f5 f7 f1 f4))

@(exercise-handout 
  #:title "Matching Examples and Function Definitions"
  #:instr "Match the EXAMPLEs on the left with the definitions on the right. NOTE: Some definitions may not match any examples!"
  #:forevidence (exercise-evid-tags "BS-DR.3&1&2" "F-IF.1-3&1&2" "F-IF.1-3&1&4" "F-LE.1-4&1&5")
  @(matching-exercise examples-lst permuted-functions-lst)
  @(exercise-answers
    (matching-exercise-answers examples-lst functions-lst permuted-functions-lst)))


