#lang curr/lib

@(define q1 (elem "¿Cuántos " @vocab{argumentos} " requiere la función
" @code{(circle (* 3 10) "outline" "black")} "?"))
@(define a1 "3")

@(define q8 (elem "¿Cuántos " @vocab{argumentos} " requiere la función " @code{(string-append "Happy" "Halloween")} "?"))
@(define a8 "2")

@(define q2 (elem "¿Cuál es el " @vocab{nombre} " de la función invocada en" @code{(* 4 5)} "?"))
@(define a2 "*")

@(define q9 (elem "¿Cuál es el " @vocab{nombre} " de la función invocada en" @code{(string-length "¡ Las Matemáticas son divertidas !")} "?"))
@(define a9 "string-length")

@(define q3 (elem "¿Cuál es el " @vocab{nombre} " de la función más exterior en la expresión " @code{(rotate 45 (star 15 "solid" "orange"))} "?"))
@(define a3 "rotate (star es también una función, pero no la que aparece en la expresión de este ejemplo
)")

@(define q10 (elem "Indique si la palabra " (code "\"outline\"") "es el nombre de una " @vocab{función} " or an " @vocab{argumento} " en la expresión " @code{(triangle 48 "outline" "pink")} "?"))
@(define a10 "an argument")

@(define q7 (elem "¿Cuántos " @vocab{argumentos} " requiere " @code{rotate} "  en la expresión" @code{(rotate 45 (star 15 "solid" "orange"))} "?"))
@(define a7 "2")

@(define q5 (elem "¿Cuál es el primer " @vocab{argumento} " de la función " @code{rotate} "en la expresión" @code{(rotate 45 (star 15 "solid" "orange"))} "?"))
@(define a5 "45")

@(define q6 (elem "¿Cuál es el tercer " @vocab{argumento} " de la función " @code{star} " en la expresión " @code{(rotate 45 (star 15 "solid" "orange"))} "?"))
@(define a6 "\"orange\"")



@(define ques (list q1 q8 q2 q9 q3 q10 q7 q5 q6))
@(define ans  (list a1 a8 a2 a9 a3 a10 a7 a5 a6))

@(exercise-handout 
  #:title "Identificar los Componentes de una Expresión"
  #:instr "Responda las preguntas en el espacio provisto"
  #:forevidence (exercise-evid-tags "BS-PL.2&1&1" "BS-PL.2&1&3")
  @(open-response-exercise ques "texto")
  @(exercise-answers (questions-and-answers ques ans))
  )
