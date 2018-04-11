#lang curr/lib

@title{Unidad 7: Ramificación condicional}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sqr sqrt expt} "1 ,4 ,44.6") 
                                       (list "String" @code{string-append string-length} " \"hello\" ")                          
                                       (list "Image" @code{rectangle circle triangle ellipse star scale rotate put-image} "(circle 25 \"solid\" \"red\")")
                                       (list "Boolean" @code{= > < string=? and or} "true false"))]{
  @unit-descr{Los estudiantes utilizan funciones por partes para mover a sus jugadores en respuesta a pulsaciones de teclas.}
   }

@unit-lessons{
@lesson/studteach[
     #:title "La Pizza de Luigi" 
     #:duration "20 mins"
     #:overview "Students analyze the behavior of a piecewise function"
     #:learning-objectives @itemlist[@item{Students learn the concept of piecewise functions}
                                     @item{Students learn about conditionals (how to write piecewise functions in code)}
                                    ]
     #:evidence-statements @itemlist[@item{Students will understand that functions can perform different computations based on characteristics of their inputs}
                                     @item{Students will begin to see how Examples indicate the need for piecewise functions}
                                     @item{Students will understand that @code{cond} statements capture pairs of questions and answers when coding a piecewise function}
                                    ]
     #:product-outcomes @itemlist[]
     #:exercises (list (make-exercise-locator/dr-assess "Luigis-Pizza" "scale-shape-design-recipe-assess" "Scaling Shapes")
                       (make-exercise-locator/dr-assess "Luigis-Pizza" "state-tax-design-recipe-assess" "Compute Tax")
                       (make-exercise-locator/dr-assess "Luigis-Pizza" "flower-name-design-recipe-assess" "Name That Flower")
                       (make-exercise-locator/dr-assess "Luigis-Pizza" "turkey-price-design-recipe-assess" "How Much is That Turkey?")
		       )
     #:standards (list "BS-DR.1" "BS-DR.2" "BS-DR.3" "BS-PL.4")
     #:materials @itemlist[@item{Entorno de edición (WeScheme o DrRacket con el bootstrap-teachpack instalado)}
                           @item{El @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "Libro de Trabajo") del estudiante.}
                           @item{Lapiceros/lápices para los estudiantes, marcadores de pizarra para profesores}
                           @item{Cartel de clase (Lista de reglas, tabla de lenguaje, calendario del curso)}
                           @item{Tabla de Lenguaje (Vea abajo)}
                          ]
     #:preparation @itemlist[@item{Los estudiantes están registrados en WeScheme.org, o han abierto DrRacket.}
                             @item{"Luigi's Pizza" [LuigisPizza.rkt de @(resource-link #:path "source-files.zip" 
                                                                                       #:label "source-files.zip") |
@(hyperlink "http://www.wescheme.org/openEditor?publicId=E57eyBCTtD" "WeScheme")] precargado en las máquinas de los estudiantes y en el proyector.}
                              @item{REQUERIDO: Reparta la @(hyperlink "https://docs.google.com/document/d/1k67XlYWkHefd4APynvwSnPKRaSTeOvGD7_lRbI8hHrg/edit?usp=sharing" "Hoja de Actividades de la Pizza de Luigi").}]
     #:prerequisites (list "The Design Recipe" "and/or")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
  @points[
     @point{@student{@activity[#:forevidence (list "BS-DR.1&1&1" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1")]{
                           Para iniciar con esta lección, completa @(hyperlink "https://docs.google.com/document/d/1k67XlYWkHefd4APynvwSnPKRaSTeOvGD7_lRbI8hHrg/edit" 
                                      "La hoja de Trabajo de la Pizza de Luigi").}}
            @teacher{Review students' answers to the exercise. You can see a video demonstration of this intro at these links: @(video-link (hyperlink "http://www.youtube.com/watch?v=2ckWSjWum-8" "1")),
                     @(video-link (hyperlink "http://www.youtube.com/watch?v=iTrY-N3MLRY#t=3m8s" "2"))}
           }
     @point{@student{El código para la función de (costo) @code{cost} está escrito abajo:
                     @code[#:multi-line #t]{; cost : String -> Number
                                            ; given a Topping, produce the cost of a pizza with that topping
                                            (EXAMPLE (cost "cheese")     9.00)
                                            (EXAMPLE (cost "pepperoni") 10.50)
                                            (EXAMPLE (cost "chicken")   11.25)
                                            (EXAMPLE (cost "broccoli")  10.25)
                                            
                                            (define (cost topping)
                                              (cond
                                                [(string=? topping "cheese")     9.00]
                                                [(string=? topping "pepperoni") 10.50]
                                                [(string=? topping "chicken")   11.25]
                                                [(string=? topping "broccoli")  10.25]
                                                [else "That's not on the menu!"]))}}
             @teacher{[@(hyperlink "https://www.youtube.com/watch?v=joF6lOgCN14" "Video")]}
             }
     @point{@student{Hasta ahora, todas las funciones que has visto han hecho @italic{lo mismo} con sus entradas:
                     @itemlist[@item{@code{green-triangle} siempre hizo triángulos verdes, no importa cuál era el tamaño.} 
                                @item{@code{safe-left?} siempre comparó la coordenada de entrada a -50, sin importar cuál era la entrada.}
                                @item{@code{update-danger} siempre agregó o restó la misma cantidad}
                                @item{y así...}]
                     Esto fue evidente al pasar de los EJEMPLOS a la definición de la función: circundando lo que cambia esencialmente da
                     la definición, y el número de variables siempre coincidirá con el número de cosas en el Dominio. 
                     @activity{Ve a la @worksheet-link[#:name "cost"], rellena el Contrato y los EJEMPLOS para esta función,
                               luego marca con un círculo y etiqueta lo que cambia.}}
            @teacher{It may be worthwhile to have some EXAMPLEs and definitions written on the board, so students can follow along.}
           }
     @point{@student{La función de @code{cost} es especial, porque diferentes coberturas pueden resultar en expresiones totalmente diferentes que se están evaluando.
                     Si fueras a marcar en un círculo todo lo que cambia en el ejemplo, tendrías las coberturas y  @italic{el precio} marcados en un círculo. 
                     Esas son dos cosas variables, pero el Dominio de la función solo tiene una cosa en si - por lo tanto ,no podemos tener dos variables.}
            @teacher{Have students refer back to prior Design Recipe pages - it is @bold{essential} that they realize
                     that this is a fundamentally new situation, which will require a new technique in the Design Recipe!}
           }
     @point{@student{Por supuesto, el @code{price} no es realmente una variable independiente, ya que el precio depende totalmente de la @code{topping}. 
                     Por ejemplo: Si la cobertura es @code{"cheese"} la función simplemente producirá @code{9.00}, si la cobertura es 
                     @code{"pepperoni"} la función simplemente producirá @code{10.50}, y así sucesivamente. El precio todavía se define en términos de 
                     la cobertura, y hay cuatro posibles coberturas - cuatro posibles condiciones - de las que la función necesita preocuparse.  
                     La función de @code{cost} hace uso de una característica especial del lenguaje denominada @vocab{condicional}, que se 
                     abrevia en el código como @code{cond}.}
             @teacher{}
             }
     @point{@student{Cada condicional tiene al menos una @vocab{cláusula}. Cada cláusula tiene una pregunta Booleana como resultado. En la función de Luigi, hay una cláusula para el queso, otra para el pepperoni, y así sucesivamente. Si la pregunta se evalúa como @code{true}, la expresión se evalúa y se devuelve. Si la pregunta es @code{false}, la computadora pasará a la siguiente cláusula. 
                     @activity[#:forevidence (list "BS-PL.4&1&1")]{
                               Mira la función de @code{cost}: 
                               @itemlist[@item{¿Cuántas cláusulas hay para el @code{cost} función?}
                                         @item{Identifica la pregunta en la primera cláusula.}
                                         @item{Identifica la pregunta en la segunda cláusula.}]}}
            @teacher{Square brackets enclose the question and answer for each clause.  When students identify the questions, they should find the first expression within the square brackets.  There can only be one expression in each answer.}
           }
     @point{@student{La última cláusula en una condicional puede ser una cláusula @code{else} , que se evalúa si todas las preguntas son @code{false}. 
                      @activity[#:forevidence (list "BS-PL.4&1&1")]{
                              En la función de @code{cost}, ¿Qué se devuelve si todas las preguntas son falsas? ¿Qué pasaría 
                              si no hubiera otra cláusula @code{else} ? Trata de eliminar esa cláusula del código from the code y evaluar una cobertura 
                              desconocida y ve qué pasa.
                              }
                    }
             @teacher{@code{else} clauses are best used as a catch-all for cases that you can't otherwise enumerate.  If you can state a precise question
                       for a clause, write the precise question instead of @code{else}.  For example, if you have a function that does different things 
                       depending on whether some variable @code{x} is larger than @code{5}, it is better for beginners to write the two questions 
                       @code{(> x 5)} and @code{(<= x 5)} rather than have the second question be @code{else}.  Explicit questions make it easier to 
                       read and maintain programs.}
           }
     @point{@student{Las funciones que usan condiciones se denominan @vocab{funciones por trozos}, porque cada condición define una 
                     @italic{pieza} separada de la función. ¿Por qué son útiles las funciones por partes?  Piensa en el jugador de tu juego: Te gustaría que
                     el jugador se mueva de una manera si pulsas la tecla "arriba", y de otra manera si pulsas la tecla "abajo". ¡Subir y bajar necesitan dos
                     expresiones diferentes!  Sin @code{cond}, solo podrías escribir una función que siempre mueva al jugador hacia arriba, o siempre lo mueva hacia
                     abajo, pero no ambas.}
            @teacher{}
           }
     @point{@student{En este momento la cláusula @code{else} produce una cadena de texto (String), aunque el Rango de la función sea Number. ¿Crees que esto es un problema? 
                     ¿Por qué o por qué no? Como seres humanos, tener una salida que rompa ese contrato puede no ser un problema: sabemos que las funciones 
                     producirán el costo de una pizza o un mensaje de error. Pero, ¿Si la salida de este código no iba a los humanos en absoluto? ¿Qué pasa si queremos utilizar
                     desde dentro de algún otro código? ¿Es posible que @italic{ese} código se confunda? Para averiguarlo, descomenta la última 
                     línea del programa @code{(start cost} removiendo el punto y coma. Al hacer clic en "Ejecutar", el simulador utilizará la función de @code{cost}
                     para ejecutar la caja registradora. ¡Mira lo que pasa si ordenas fuera del menú!
                     @activity{Para arreglar esto, cambiemos la cláusula @code{else} para devolver un precio muy alto. Después de todo, si el cliente está dispuesto a pagar
                      un millón de dólares, ¡Luigi hará cualquier pizza que quieran!}}
            @teacher{}
           }
   ]}
 
@lesson/studteach[
     #:title "Movimiento del jugador" 
     #:duration "25 min" 
     #:overview "Students write a piecewise function that allows their player to move up and down using the arrow keys."
     #:learning-objectives @itemlist[@item{Students learn that handling user input needs piecewise functions}
                                     @item{Students learn which questions to ask to detect key presses}
                                     @item{Students learn how to write their own conditional expressions}
                                     @item{Students reason about relative positioning of objects using mathematics}]
     #:evidence-statements @itemlist[@item{Students will understand how to write different expressions that compute new coordinates in different directions}
                                     @item{Students will be able to write expressions that check which key was pressed}
                                     @item{Students will be able to write a conditional connecting key presses to different directions of movement}
                                     @item{Students will learn to write examples that illustrate each condition in a piecewise function}
                                     @item{Students will be able to experiment with using functions to change the speed or nature of character movement in a game}
                                    ]
     #:product-outcomes @itemlist[@item{Los estudiantes escribirán @code{update-player}, que mueve a su jugador en respuesta a pulsaciones de tecla}]
     #:standards (list "A-SSE.1-2" "BS-DR.2" "BS-DR.3")
     #:materials @itemlist[@item{El @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "Libro de Trabajo") del estudiante.}
                           @item{Todas las computadoras de los estudiantes deben tener sus plantillas de juego precargadas, con sus archivos de imagen enlazados}]
     #:preparation @itemlist[]
     #:prerequisites (list "Luigi's Pizza" "Target and Danger Movement")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
    ]{
      @points[
       @point{@student{Ahora que sabemos @code{cond}, podemos escribir @code{update-player}.
                       @activity[#:forevidence (list "BS-M&1&1" "BS-M&1&2" "BS-DR.2&1&1" "BS-DR.3&1&1" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2")]{
                                 @bitmap{images/update-player.png} Mira la siguiente imagen, Cual describe lo que sucede cuando se pulsa la tecla de flecha "arriba". 
                                 @itemlist[@item{¿Cuál es la coordenada x inicial del jugador?}
                                           @item{¿Cuál es la coordenada y inicial del jugador?}
                                           @item{¿Qué pasa después de que el jugador se mueve? 
                                                 @itemlist[@item{¿Cuáles son las nuevas coordenadas x & y?}
                                                           @item{¿Qué ha cambiado? y ¿Qué tanto?}
                                                           @item{¿Qué pasa cuándo presionamos la tecla de flecha "abajo"?}
                                                           @item{¿Cuáles deberían de ser las nuevas coordenadas?}
                                                           @item{¿Qué debería pasar si un usuario presiona @italic{otra} tecla que no sea la tecla de flecha arriba o abajo? }]}]}
                       }
              @teacher{Draw a screen on the board, and label the coordinates for a player, target and danger. Circle all the data associated with the Player.}
              }
       @point{@student{La siguiente tabla resume lo que debería sucederle al jugador por cada tecla:
                           @build-table/cols['("When..." "Do...")
                                             '(("key is \"up\"" "key is \"down\"" "key is anything else")
                                               ("add 20 to player-y" "subtract 20 from player-y" "return y unchanged"))
                                             (lambda (r c) (para ""))
                                             2 3]
                           
                           @activity[#:forevidence (list "BS-M&1&1" "BS-M&1&2" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2")]{
                                    On @worksheet-link[#:name "update-player"] in your workbook, 
                                    you'll find the word problem for @code{update-player}.}
                           (Si no te gusta usar las teclas de flecha para hacer que el jugador se mueva hacia arriba y hacia abajo, 
                           ¡Puedes cambiarlas fácilmente para trabajar con "w" y "x"!)}
               @teacher{Be sure to check students' Contracts and EXAMPLEs during this exercise, especially when it's time for them
                        to circle and label what changes between examples. This is the crucial step in the Design Recipe where they 
                        should discover the need for @code{cond}.}
               }
       @point{@student{También puedes agregar movimientos más avanzados, utilizando lo que aprendiste sobre las 
                       funciones booleanas. Estas son algunas ideas:
                       @itemlist[@item{@bold{Warping:} En lugar de tener que cambiar la coordenada "y" del jugador 
                                       por adición y sustracción, reemplazala con un Número 
                                       para que el jugador aparezca repentinamente en ese lugar. 
                                       (Por ejemplo, al pulsar la tecla "c", el jugador se 
                                       transporta de nuevo al centro de la pantalla, en y=240.)}
                                  @item{@bold{Boundary-detection} Cambia la condición para subir
                                         de modo que el jugador se mueva hacia arriba solamente si la tecla="arriba" Y el
                                         @code{player-y} es menor que 480. Igualmente, cambia la condición
                                         para "abajo" para también comprobar que @code{player-y} es mayor que 0.}
                                  @item{@bold{Wrapping:} Agrega una condición (antes de cualquiera de las teclas) 
                                         que comprueba que la coordenada "y" del jugador está 
                                         por encima de la pantalla (y > 480). Si es así, haz que el jugador 
                                         se transporte hacia abajo (y=0). Añade otra condición para que 
                                         el jugador se transporte de regreso a la parte superior de la pantalla si se 
                                         mueve por debajo de la parte inferior.}
                                  @item{@bold{Challenge:} Haz que el jugador se oculte cuando la tecla "h" es presionada, 
                                        ¡sólo para volver a aparecer cuando se presiona de nuevo!}]}
               @teacher{Hint on the challenge: multiply by -1.}}
       ]}
     
@lesson/studteach[
     #:title "Concluyendo"
     #:duration "5 min"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{¡Felicidades - tienes los principios de un juego en funcionamiento!  
                                ¿Qué falta todavía? ¡No ocurre nada cuando el jugador choca con el objeto o destino!
                                Vamos a arreglar esto en las lecciones siguientes, y también trabajaremos en el arte y la historia 
                                de nuestros juegos, ¡mantente atento!}
                        @teacher{@itemlist[@item{Have students volunteer what they learned in this lesson}
                                            @item{Reward behaviors that you value: teamwork, note-taking, engagement, etc}
                                            @item{Pass out exit slips, dismiss, clean up.}]}
                        }
                        ]}
}
