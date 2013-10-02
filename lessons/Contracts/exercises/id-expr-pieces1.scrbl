#lang curr/lib

@(define q1 (elem "How many arguments does the circle function take in" @code{(circle (* 3 10) "outline" "black")} "?"))
@(define a1 "3")

@(define q8 (elem "How many arguments does the string-append function take in" @code{(string-append "Happy" "Halloween")} "?"))
@(define a8 "2")

@(define q2 (elem "What is the name of the function being used in" @code{(* 4 5)} "?"))
@(define a2 "*")

@(define q9 (elem "What is the name of the function being used in" @code{(string-length "Math is fun!")} "?"))
@(define a9 "string-length")

@(define q3 (elem "What is the name of the function being used in" @code{(rotate 45 (star 15 "solid" "orange"))} "?"))
@(define a3 "rotate (star is also a function, but not the one in the overall expression)")

@(define q10 (elem "Is " (code "\"outline\"") " the name of a function or an argument in" @code{(triangle 48 "outline" "pink")} "?"))
@(define a10 "an argument")

@(define q7 (elem "How many arguments does rotate expect in" @code{(rotate 45 (star 15 "solid" "orange"))} "?"))
@(define a7 "2")

@(define q4 (elem "What is the first argument to the rotate function in" @code{(rotate 45 (star 15 "solid" "orange"))} "?"))
@(define a4 "45")

@(define q5 (elem "What is the first argument to the star function in" @code{(rotate 45 (star 15 "solid" "orange"))} "?"))
@(define a5 "15")

@(define q6 (elem "What is the third argument to the star function in" @code{(rotate 45 (star 15 "solid" "orange"))} "?"))
@(define a6 "\"orange\"")

@(define ques (list q1 q8 q2 q9 q3 q10 q7 q4 q5 q6))
@(define ans  (list a1 a8 a2 a9 a3 a10 a7 a4 a5 a6))

@(exercise-handout 
  #:title "Identifying Parts of Expressions"
  #:instr "Answer each of the following questions in the space provided below the question:"
  @(create-exercise-itemlist #:with-answer-blanks? #t ques)
  @(exercise-answers 
    (create-exercise-sols-itemlist ques ans))
  )
