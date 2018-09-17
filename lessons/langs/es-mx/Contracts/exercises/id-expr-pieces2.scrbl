#lang curr/lib

@(define q11 (elem "¿Cuál es el  " @vocab{nombre} " de la función más interior en la expresión" @code{(+ (string-length "broccoli") 8)} "?"))
@(define a11 "string-length")

@(define q13 (elem "¿Cuál es el  " @vocab{dominio} " de la función más exterior en la expresión" @code{(scale 2 (circle 40 "solid" "blue"))} "?"))
@(define a13 "number image")

@(define q12 (elem "¿Cuál es el  " @vocab{dominio} " de la función más interior en la expresión" @code{(scale 2 (circle 40 "solid" "blue"))} "?"))
@(define a12 "number string string")

@(define q14 (elem "¿Cuántos " @vocab{argumentos} " recibe la función + en la expresión " @code{(+ (string-length "broccoli") 8)} "?"))
@(define a14 "2")

@(define q15 (elem "¿Cuál es el  " @vocab{rango} " de la función string-length?"))
@(define a15 "number")

@(define q16 (elem "¿Es “text” una " @vocab{cadena} ", una " @vocab{función} ", o una " @vocab{imagen} "?"))
@(define a16 "function")

@(define q17 (elem "Es el rango de “text” una " @vocab{cadena} " o una " @vocab{imagen} "?"))
@(define a17 "image")

@(define q18 (elem "¿Cuál es el primer " @vocab{argumento} " de la función " @code{circle} " en la expresión" @code{(scale 2 (circle 40 "solid" "blue"))} "?"))
@(define a18 "40")

@(define q19 (elem "¿Tienen las funciones " @code{rectangle} " y " @code{square} " el mismo " @vocab{dominio} "?"))
@(define a19 "No. El dominio de la función rectangle es número número string string y el dominio de la función square es number string string.")


@(define ques (list q11 q13 q12 q14 q15 q16 q17 q18 q19))
@(define ans  (list a11 a13 a12 a14 a15 a16 a17 a18 a19))

@(exercise-handout 
  #:title "Identificar los Componentes de una Expresión"
  #:instr "Responda a las preguntas en el espacio provisto:"
  #:forevidence (exercise-evid-tags "BS-PL.2&1&1" "BS-PL.2&1&3")
  @(open-response-exercise ques "text")
  @(exercise-answers (questions-and-answers ques ans))
  )
