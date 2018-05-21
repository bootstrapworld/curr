#lang curr/lib

@(define e1
   (code #:multi-line #t
"examples: 
        mystery(30) is (30 * 50)
        mystery(10) is text(\"Welcome!\" 10 \"darkgreen\")
end"))
@(define a1 "no match (the range types are different)")


@(define e2
   (code #:multi-line #t
"examples: 
        mystery(30, 40) is (40 - (2 * 30))
        mystery(10, 15) is (15 - (2 * 10))
end"))
@(define a2 (code "; mystery :: Number Number -> Number"))


@(define e3
   (code #:multi-line #t
"examples: 
        mystery(\"New York\") is text(\"New York\", 20, \"red\")
        mystery(20) is text(\"New York\" 20 \"red\")
end"))
@(define a3 "no match (the domain types are different)")


@(define e4
   (code #:multi-line #t
"examples:
          mystery(\"green\", 32) is circle(32, \"outline\", \"green\")
          mystery(18, \"green\") is circle(18, \"outline\", \"green\")
end"))
@(define a4 "no match (the domain types are in different orders)")

@(define e5
   (code #:multi-line #t
"examples:
          mystery(6, 9, 10) is (6 / (9 + 10))
          mystery(3, 7) is (3 / (7 + 10))
end"))
@(define a5 "no match (the domains have different numbers of arguments)")

@(define e6
   (code #:multi-line #t
"examples:
          mystery(\"red\", \"blue\") is text(\"blue\", 25, \"red\")
          mystery(\"purple\", \"Go Team!\") is text(\"Go Team!\", 25, \"purple\")
end"))
@(define a6 (code "; mystery :: String String -> Image"))


@(define e7
   (code #:multi-line #t
"examples:
          mystery(circle(55, \"outline\", \"black\"), 12) is 
                  scale(12, circle(55, \"outline\", \"black\"))
          mystery(rectangle(24, 32, \"outline\", \"purple\"), 5) is
                  scale 5 (rectangle 24 32 \"outline\" \"purple\")
end"))
@(define a7 (code "; mystery :: Image Number -> Image"))




@(exercise-handout
  #:title "Do Examples Have the Same Contracts?"
  #:instr "For each pairs of Examples below, decide whether the two examples
           have the same contract. If they do, fill in the contract in the space
           provided. If not, write a few words explaining why."
  #:forevidence (exercise-evid-tags "BS-DR.2&1&2" "F-IF.1-3&1&1" "F-IF.1-3&1&2")
  @(create-exercise-itemlist/contract-answers (list e1 e2 e3 e4 e5 e6 e7))
  @(exercise-answers
     (questions-and-answers (list e1 e2 e3 e4 e5 e6 e7)
                            (list a1 a2 a3 a4 a5 a6 a7))))
   
