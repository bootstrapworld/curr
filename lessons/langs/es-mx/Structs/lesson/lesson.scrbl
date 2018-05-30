#lang curr/lib


@lesson/studteach[
     #:title "Movimientos en 2D usando Estructuras" 
     #:duration "20 minutos"
     #:overview "Students are introducted to the @code{Posn} struct, and use it to add 2-dimensional movement to their game"
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{}]
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
     @point{@student{En este momento, cada personaje de tu juego se mueve a lo largo de un solo eje. @code{update-danger} toma la coordenada x del peligro y produce la siguiente, pero no tiene capacidad para leer o actualizar la coordenada y.  Como resultado, su peligro sólo puede moverse hacia la izquierda o la derecha.
                     @code[#:multi-line #t]{; update-danger : Number -> Number
                                            ; takes in object's x-coordinate and returns the next one}
                     @activity{Supongamos que queriamos que se moviera en diagonal. ¿Qué tendría que cambiar en el dominio? ¿El rango? ¿La Declaración de Propósito?}}
             @teacher{Use a diagram on the board to demonstrate that @code{update-danger} will need to take in both the x- and the y-coordinate, and that it will have to produce both as well.}}
      @point{@student{Mientras que has visto una función tomar en varios valores, nunca has visto una función @italic{producir} más de una cosa a la vez.
                       @bannerline{Todas las funciones deben producir un valor.}}
              @teacher{}
              }
      @point{@student{Sin embargo, Racket en realidad nos permite crear nuevos tipos de datos que pueden contener más de una cosa. A éstos se les llama @vocab{estructuras de datos}, o "estructuras" para abreviar. Un tipo de estructura que es útil para nosotros se llama una posición, que Racket abreviará @code{posn}.
                     @activity{Abre un nuevo programa.
                               @itemlist[@item{Digita un valor Number en la ventana Interacciones y presiona Enter. ¿Qué obtuviste?}
                                          @item{Digita un valor String en la ventana Interacciones y presiona Enter. ¿Qué obtuviste?}
                                          @item{Digita un valor Boolean en la ventana Interacciones y presiona Enter. ¿Qué obtuviste?}]
                               Como puedes ver, todos los valores se evaluan a sí mismos. Para crear un @code{posn}, escribe el siguiente código en la ventana Interacciones:
                               @code[#:multi-line #t]{(make-posn 10 40)}
                               ¿Qué obtuviste cuando pulsas Enter? ¿Qué número es la coordenada x? ¿La coordenada y?
                               }}
              @teacher{Have students make @code{Posn}s for other coordinates, like the corners of the screen or the center.}
              }
      @point{@student{Pensemos en un @code{update-danger} que se mueve en diagonal, ahora sabemos que el @vocab{Rango} debe ser un @code{posn}.
                      @activity{Comencemos con una @(resource-link #:path "DesignRecipeWorksheet.pdf" #:label "Receta de diseño en blanco"), y volvamos a escribir el @code{update-danger} para producir un Posn en lungar de un Number. En lugar de producir un @code{(- x 50)},tu función tendría que producir un Posn en el que x y y han cambiado de alguna manera. Aquí hay un ejemplo, que mueve el peligro a la izquierda por 50 píxeles y hacia abajo por 10:
                               @code[#:multi-line #t]{(EXAMPLE (update-danger 200 300) (make-posn (- 200 50) (- 300 10)))}
                               @itemlist[@item{Escribe un segundo ejemplo.}
                                          @item{Identifica lo que cambia.}
                                          @item{¡Define la función en tu hoja de trabajo, después modifica la definición en tu programa de modo que tu peligro se mueva diagonalmente!}]}}
              @teacher{}
              }
   @point{@student{@activity{Modifica @code{update-target} para que se mueva en diagonal también.}}
           @teacher{}
           }
   @point{@student{@code{update-player} también tendrá que ser cambiado, de modo que toma en la coordenada x y en la coordenada y la llave que fue presionada. El @vocab{Rango}, previsiblemente, será un Posn.
                    @activity{@itemlist[@item{Cambie sus EJEMPLOS para "arriba" y "abajo" de modo que tomen en ambas coordenadas y produzcan Posns.}
                                         @item{Añade dos EJEMPLOS más, esta vez para "izquierda" y "derecha".}
                                         @item{Modifique cada cláusula de su sentencia @code{cond}, para que cada una produzca un Posn. No te olvides de cambiar la cláusula @code{else} también!}]}}
           @teacher{}
           }]
   }