#lang curr/lib


@(define e9
   (code #:multi-line #t
"examples:
 mystery(triangle(70, \"solid\", \"green\")) is
   triangle(140, \"solid\", \"green\")
 mystery(circle(100, \"solid\", \"blue\")) is
   circle(200, \"solid\", \"blue\")
end"))
@(define a9 (code "mystery :: Image -> Image"))

@(define e10
   (code #:multi-line #t
"examples:
 mystery(\"red\") is
   triangle(140, \"solid\", \"red\")
end
examples:
 mystery(\"blue\", \"circle\") is
   circle(140, \"solid\", \"blue\")
end"))
@(define a10 "no match (the domains have different numbers of arguments)")

@(define e11
   (code #:multi-line #t
"examples:
 mystery(\"+\", 4, 5) is 4 + 5
 mystery(\"num-sqrt\", 25) is num-sqrt(25)
end"))
@(define a11 "no match (the domains have different numbers of arguments)")

@(define e12
   (code #:multi-line #t
"examples:
 mystery(\"circle\", 4) is pi * num-sqrt(4)
 mystery(\"square\", 5) is num-sqrt(5)
end"))
@(define a12 (code "mystery :: String, Number -> Number"))
   
@(define e13
   (code #:multi-line #t
"examples:
 mystery(\"dog\") is 3
 mystery(\"cat\") is \"kitten\"
end"))
@(define a13 "no match (the range types are different)")


@(define e14
   (code #:multi-line #t
"examples:
 mystery(\"dog\") is 3
 mystery(\"kitten\") is 6
end"))
@(define a14 (code "mystery :: String -> Number"))
   
@(define e15
   (code #:multi-line #t
"examples:
 mystery(4, \"big\") is
   scale(2, circle(4, \"solid\", \"blue\"))
 mystery(\"small\", 10) is 
   scale(.5, circle(10, \"solid\", \"blue\"))
end"))
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
   
