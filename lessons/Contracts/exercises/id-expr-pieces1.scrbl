#lang curr/lib

@(define q1 (elem "How many arguments does the circle function take in" @code{(circle (* 3 10) "outline" "black")} "?"))

@(define q8 (elem "How many arguments does the string-append function take in" @code{(string-append "Happy" "Halloween")} "?"))

@(define q2 (elem "What is the name of the function being used in" @code{(* 4 5)} "?"))

@(define q9 (elem "What is the name of the function being used in" @code{(string-length "Math is fun!")} "?"))

@(define q3 (elem "What is the name of the function being used in" @code{(rotate 45 (star 15 "solid" "orange"))} "?"))

@(define q10 (elem "Is \"outline\" the name of a function or an argument in" @code{(triangle 48 "outline" "pink")} "?"))

@(define q7 (elem "How many arguments does rotate expect in" @code{(rotate 45 (star 15 "solid" "orange"))} "?"))

@(define q4 (elem "What is the first argument to the rotate function in" @code{(rotate 45 (star 15 "solid" "orange"))} "?"))

@(define q5 (elem "What is the first argument to the star function in" @code{(rotate 45 (star 15 "solid" "orange"))} "?"))

@(define q6 (elem "What is the third argument to the star function in" @code{(rotate 45 (star 15 "solid" "orange"))} "?"))

@(exercise-handout 
  #:title "Identifying Parts of Expressions"
  #:instr "Answer each of the following questions in the space provided below the question:"
  @(create-exercise-itemlist #:with-answer-blanks? #t (list q1 q8 q2 q9 q3 q10 q7 q4 q5 q6))
  )
