#lang curr/lib 

@(define e1a
   (code #:multi-line #t
"examples:
  match(30, \"red\") is 30 + string-length(\"red\")
end"))

@(define e1b
   (code #:multi-line #t
"examples:
  match(10, \"blue\") is 10 + string-length(\"blue\")
end"))

@(define e1c 
   (code #:multi-line #t
"examples:
  match(num-abs(-4), \"45\") is 4
end"))

@(define e2a
   (code #:multi-line #t
"examples:
  match(triangle(20, \"solid\", \"blue\")), 3) is
  scale(3, triangle(20, \"solid\", \"blue\"))
end"))

@(define e2b
   (code #:multi-line #t
"examples:
  match(circle(10, \"solid\", \"orange\") ,22) is
  scale(22, circle(10, \"solid\", \"orange\"))
end"))

@(define e3a
   (code #:multi-line #t
"examples:
  match(5, star(20, \"solid\", \"red\")) is
  rotate((90 - 5), star(20, \"solid\", \"red\"))
end"))

@(define e3b
   (code #:multi-line #t
"examples:
  match(73, star(10, \"outline\", \"orange\"), 22) is
  rotate((90 - 73), star(10, \"outline\", \"orange\"))
end"))

@(define e4a
   (code #:multi-line #t
"examples:
  match(circle(20, \"outline\", \"gold\")) is
  rotate(37, circle(20, \"outline\", \"gold\"))
end"))

@(define e4b
   (code #:multi-line #t
"examples:
  match(circle(10, \"solid\", \"green\")) is
  rotate(37, circle(10, \"solid\", \"green\"))
end"))


@(define c1 (code " match :: Number String -> Number"))
@(define c2 (code " match :: Image Number -> Image"))
@(define c3 (code " match :: Number Image -> Image"))
@(define c4 (code " match :: Image -> Image"))

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
  #:title "Matching Contracts and Examples"
  #:instr "Match each Example on the left with the Contract on the right. NOTE: Multiple examples 
           may match to the same contract!"
  #:forevidence (exercise-evid-tags "BS-DR.2&1&2" "F-IF.1-3&1&1" "F-IF.1-3&1&2")
  @(matching-exercise ques permuted-ans)
  @(exercise-answers 
     (matching-exercise-answers ques ans permuted-ans))
)

