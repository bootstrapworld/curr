#lang curr/lib


@lesson/studteach[
     #:title "Figura Roja (red-shape)" 
     #:duration "10 minutos"
     #:overview "Students define a piecewise function"
     #:learning-objectives @itemlist[@item{Students learn the concept of piecewise functions}
                                     @item{Students learn about conditionals (how to write piecewise functions in code)}
                                    ]
     #:evidence-statements @itemlist[@item{Students will understand that functions can perform different computations based on characteristics of their inputs}
                                     @item{Students will begin to see how Examples indicate the need for piecewise functions}
                                     @item{Students will understand that @code{cond} statements capture pairs of questions and answers when coding a piecewise function}
                                    ]
     #:product-outcomes @itemlist[@item{Students complete @code{red-shape}, which produces different shapes based on the input string}]
     #:standards (list "A-SSE.1-2" "F-IF.1-3" "F-IF.4-6" "F-IF.7-9" "F-LE.5")
     #:materials @itemlist[@item{Computers w/ DrRacket or WeScheme}
                           @item{Student @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook")}
                           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                           @item{Class posters (List of rules, basic skills, course calendar)}
                           @item{Language Table (see below)}
                          ]
     #:preparation @itemlist[]
     #:prerequisites (list "Luigi's Pizza" )
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
  @points[
     @point{@student{Los condicionales permiten que las funciones tengan un comportamiento muy diferente, basado en su entrada. Una función que produce círculos rojos de varios tamaños no necesita condicionales (ya que el código dibujará siempre un círculo), pero una función que produce diferentes formas enteramente necesitaría evaluar la expresión apropiada para una forma dada.}
             @teacher{You may want to show students the code for simpler functions (@code{red-circle}, @code{green-triangle}, etc), pointing out that those functions evaluate the same expression no matter what - they merely fill in the variable with a given value.}}
      @point{@student{@activity{Ve a la @worksheet-link[#:page 34 #:name "red-shape"], y utiliza la receta de diseño para completar el problema de palabras para @code{red-shape}.}}
              @teacher{Pause and debrief after each section, if necessary.}}

     @point{@student{Las condiciones se pueden utilizar en muchos lugares dentro de un videojuego:
                     @itemlist[@item{Hacer que el jugador dibuje de manera diferente cuando recibe un aumento de potencia.}                                                         
                                @item{Abrir las puertas cuando el jugador tiene una llave}
                                @item{Moverse de forma diferente dependiendo de la entrada del teclado}]}
             @teacher{}
           }]
   }
                                                                                                                    
                                                                                                                    
