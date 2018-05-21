#lang curr/lib


@lesson/studteach[
     #:title "Yendo más allá" 
     #:duration ": flexible"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list )
     #:materials @itemlist[@item{Computers w/ DrRacket or WeScheme}
                           @item{Student @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "workbook")}
                           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
                           @item{Class posters (List of rules, basic skills, course calendar)}
                           @item{Language Table (see below)}
                          ]
     #:preparation @itemlist[]
     #:prerequisites (list "collide?")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
  @points[
     @point{@student{Ahora que has terminado tu juego, aquí hay algunas otras cosas que puedes agregar para hacerlo más emocionante:
                     @itemlist[@item{Algunas personas prefieren usar las teclas "WASD" para el movimiento, en lugar de las teclas cursoras. 
                                     Añade eso a @code{update-player}, para que cualquiera de ellos funcione.}
                                @item{Después de haber implementado @code{Posn}s, añade teclas para el movimmiento diagonal.}
                                @item{Usa @code{and} dentro de @code{update-player}, ara que el jugador sólo se mueva hacia arriba si su coordenada y es menor que 480.
                                      Has lo mismo para el movimiento hacia abajo.}
                                @item{Agrega una "Zona Segura": pon una caja verde o una sombra verde en el fondo y luego cambia @code{collide}
 De modo que un jugador sólo choca si el jugador toca un peligro Y no están dentro de la zona.}
                                @item{Si ya has añadido movimiento bidimensional usando Posns, intenta hacer que la coordenada y de su cambio de peligro 
                                      @italic{sea una función de x}. Tu puedes moverte en un patrón de onda usando @code{sin} y @code{cos}!}]
                     }
             @teacher{The last item on this list has connections to trigonometry: if the y-coordinate is detemined by @math{sin(x)}, for example, 
                      the character will bob up and down, following the sine wave. Students can practice drawing "flight paths" using a graphing
                      calculator, then enter those functions into their game!}
             }]
   }