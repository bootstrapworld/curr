#lang curr/lib
@title{Unidad 8: Detección de colisiones}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sqr sqrt expt} "1 ,4 ,44.6") 
                                       (list "String" @code{string-append string-length} " \"hello\" ")                          
                                       (list "Image" @code{rectangle circle triangle ellipse star scale rotate put-image} "(circle 25 \"solid\" \"red\")")
                                       (list "Boolean" @code{= > < string=? and or} "true false"))]{
@unit-descr{Los estudiantes derivan, discuten y aprueban el teorema de Pitágoras, luego utilizan ese teorema---en conjunto con booleanos---para detectar colisiones en sus juegos.}
}

@unit-lessons{
@lesson/studteach[
     #:title "Distancia 1D" 
     #:duration "20 min"
     #:overview "Students act out a collision in their game, and reason about the mathematical behavior of collision detection"
     #:learning-objectives @itemlist[@item{Students learn how to compute the distance between objects in one dimension}]
     #:evidence-statements @itemlist[@item{Students will be able to explain how a Number line is used to calculate distance in one dimension}
                                     @item{Students will be able to explain why the @code{line-length} function uses a conditional}]
     #:product-outcomes @itemlist[]
     #:standards (list "BS-PL.3" "BS-PL.4" "6.NS.5-8")
     #:materials @itemlist[@item{Entorno de edición (WeScheme o DrRacket con el bootstrap-teachpack instalado)}
                           @item{El @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "Libro de Trabajo") del estudiante}
                           @item{Lapiceros/lápices para los estudiantes, marcadores de pizarra para profesores}
                           @item{Cartel de clase (Lista de reglas, tabla de lenguaje, calendario del curso)}
                           @item{Tabla de Lenguaje (Vea abajo)}
                          ]
     #:preparation @itemlist[@item{Los estudiantes están registrados en WeScheme.org, o han abierto DrRacket.}]
     #:prerequisites (list "Luigi's Pizza" "Coordinate Planes")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
       @points[@point{@student{Supongamos que dos objetos se mueven a través del espacio, cada uno con sus propias coordenadas (x,y). ¿Cuándo empiezan a superponerse sus bordes? Ciertamente se superponen si sus coordenadas son idénticas (x1=x2, y1=y2), pero, ¿y si sus coordenadas están separadas por una pequeña distancia? ¿Qué tan pequeña debe ser esa distancia antes de que sus bordes se toquen?.}
                       @teacher{[@(hyperlink "https://www.youtube.com/watch?v=Bbq0oCmvSmA" "Video")] Visual aids are key here: be sure to diagram this on the board!}
                       }
                @point{@student{@bitmap{images/numberline.png}En una dimensión, es fácil calcular cuándo se superponen dos objetos . En este ejemplo, el círculo rojo tiene un radio de 1 y el círculo azul tiene un radio de 1.5 . Los círculos se superpondrán si la distancia @italic{entre sus centros} es @italic{menor que la suma de sus radios} (@math{1 + 1.5 = 2.5}). ¿Cómo se calcula la distancia entre sus centros? En este ejemplo, sus centros están separados por 3 unidades, porque @math{4 - 1 = 3}. @activity{¿Cambiaría la distancia entre ellos si los círculos intercambiaran lugares? ¿Por qué o por qué no?}}
                       @teacher{Work through a number of examples, using a number line on the board and asking students how they calculate the distance between the points.  Having students act this out can also work well: draw a number line, have two students stand at different points on the line, using their arms or cutouts to give objects of different sizes.  Move students along the number line until they touch, then compute the distance on the number line.  The first few seconds of our @(hyperlink "http://www.youtube.com/watch?v=leP3tQ_GZL8&feature=player_embedded" "Bootstrap video") show this exercise in action.}
                       }
                @point{@student{Tú archivo de juego proporciona una función llamada @code{line-length} que calcula la diferencia entre dos puntos en una línea numérica.  Específicamente, la @code{line-length} toma dos números como entrada y determina la distancia entre ellos.
                       @activity[#:forevidence (list "BS-PL.3&1&3" "BS-PL.4&1&1" "6.NS.5-8&1&6")]{¿Qué respuestas esperarías de cada uno de los siguientes dos usos de @code{line-length}:
                                 @itemlist[@item{@code{(line-length 2 5)}}
			                   @item{@code{(line-length 5 2)}}
                                          ]
                                 ¿Esperas la mismas respuesta independientemente de si la entrada más grande o más pequeña va primero?}}
                       @teacher{If you have time and want to reinforce how conditionals arise from examples, you can have students fill in blanks in Examples such as @code{(EXAMPLE (line-length 2 5) ___)}, circle what's different, and notice that the circle labels are in different orders depending on whether the first or the second input is larger.  This in turn suggests that the code for @code{line-length} will need a conditional.  In this case, one could avoid the conditional by taking the absolute value of the difference (the function @code{abs} does this); if you are working with older students who already know about absolute value you could show it.  Using @code{cond}, however, emphasizes how code structure arises from examples.}}

                @point{@student{Dezplázate hasta las funciones @code{line-length} y @code{collide?} en tu archivo de juego. Nota que la @code{line-length} utiliza un condicional para que se reste el número más pequeño del más grande. 
                       @activity[#:forevidence (list "BS-M&1&1" "8.F.5&1&1")]{¿Puedes explicar por qué la @code{line-length} necesita usar @code{cond}? ¿Cuáles son las dos condiciones?}}
                       @teacher{The two conditions are: @itemlist[@item{A is @italic{less than} B} @item{B is @italic{less than or equal} to A}]}}
                       
                @point{@student{@bitmap{images/3004graph.png}Desafortunadamente, la @code{line-length} solo puede calcular la distancia entre puntos en una sola dimensión (x or y). ¿Cómo se calcularía la distancia entre los objetos que se mueven en 2 dimensiones (como los elementos de tu juego)?. La @code{line-length} puede calcular las líneas verticales y horizontales en el gráfico mostrado aquí, utilizando la distancia entre las coordenadas x  y la distancia entre las coordenadas y. Desafortunadamente, no nos dice cuán distantes están los dos centros.}
                       @teacher{}
                       }
                @point{@student{@bitmap{images/3004ABCgraph.png}Dibujar una línea desde el centro de un objeto a otro crea un triángulo rectángulo, con lados A, B y C. A y B son las distancias verticales y horizontales, siendo C la distancia entre las dos coordenadas. La @code{line-length} se puede utilizar para calcular A y B, pero ¿cómo podemos calcular C?}
                       @teacher{Students' gamefiles all have a value called @code{*distances-color*}, which is set to the empty string @code{""}. By changing this to a color such as "yellow" or "red", the game will draw right triangles between each game character, and fill in the lengths for each side. You may want to demonstrate this using your own game file, and have the students follow along. Hint: to make it as easy as possible to see these triangles, set your background to be a simple, black rectangle and slow down the animation functions.}
                       }
                @point{@student{En un triángulo rectángulo, el lado opuesto al ángulo de  90-grados se denomina @vocab{hipotenusa}. Pensando de nuevo en nuestra detección de colisión, sabemos que los objetos chocarán si la hipotenusa es @italic{menor que la suma de sus radios}. Saber la longitud de la hipotenusa será esencial para determinar cuando ocurre una colisión.}
                       @teacher{}
                       }
                ]}
                                                           
@lesson/studteach[
     #:title "Distancia 2D" 
     #:duration "35 min"
     #:overview "Students explore the Pythagorean Theorem using shapes on paper, then reason about the mathematical behavior of collision detection"
     #:learning-objectives @itemlist[@item{Students learn that two-dimensional distance corresponds to the hypotenuse of a right triangle}
                                     @item{Students learn how to compute the distance between objects in two dimensions}]
     #:evidence-statements @itemlist[@item{Students understand that two-dimensional distance needs a different computation than one-dimensional distance}
                                     @item{Students can draw out the right triangles that compute the distance between two coordinates}
                                     @item{Students understand that geometric manipulation is a useful tool for figuring out certain computations}
                                     @item{Some students can use geometric manipulation to derive the Pythagorean Theorem}
                                     @item{Students can state the Pythagorean Theorem}
                                     @item{Students can turn the Pythagorean Theorem into code by writing a @code{distance} function}
                                    ]
     #:product-outcomes @itemlist[@item{Los estudiantes escriben la función de distancia en sus archivos de juego.}]
     #:standards (list "8.G.6-8" "BS-PL.4" "BS-DR.3")
     #:materials @itemlist[@item{Entorno de edición (WeScheme o DrRacket con el bootstrap-teachpack instalado)}
                           @item{El @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "Libro de Trabajo") del estudiante}
                           @item{Todas las computadoras de los estudiantes deben tener sus plantillas de juego precargadas, con sus archivos de imagen enlazados}
                           @item{Recortes de los paquetes de Teorema de Pitágoras [@(resource-link #:path "images/pythag1.png" #:label "1"), @(resource-link #:path "images/pythag2.png" #:label "2")] - 1 por grupo de estudiantes trabajando juntos}
                           @item{Lapiceros/lápices para los estudiantes, marcadores de pizarra para profesores}
                           @item{Cartel de clase (Lista de reglas, tabla de lenguaje, calendario del curso)}
                           @item{Tabla de Lenguaje (Vea abajo)}
                          ]
     #:preparation @itemlist[ @item{REQUERIDO: Reparta la @(hyperlink "https://docs.google.com/document/d/1Vkaz30B8AAaze6fMiFJypFb1bOIeH0RzkeaBLCCPf9E/edit?usp=sharing" "Hoja de Actividades de Calentamiento").}]
     #:prerequisites (list "1D Distance")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
       @points[@point{@student{ Las civilizaciones antiguas tenían el mismo problema: ¡también se esforzaban por encontrar la distancia entre puntos en dos dimensiones!  Trabajemos en una manera para pensar sobre este problema: ¿qué expresión calcula la longitud de la hipotenusa de un triángulo rectángulo?
                               Echa un vistazo a un, @(video-link (hyperlink "https://www.youtube.com/watch?v=Ln7myXQx8TM" "video de este problema")), ¡y luego explóralo tú mismo! 
                               [Credit: @(hyperlink "https://www.youtube.com/user/AlternatingSum/videos" "Tova Brown")]}
                       @teacher{This exercise is best done in small groups of students (2-3 per group).  Pass out Pythagorean Proof materials [@(resource-link #:path "images/pythag1.png" #:label "1"), @(resource-link #:path "images/pythag2.png" #:label "2")] to each group, and have them review all of their materials:@itemlist[@item{A large, white square with a smaller one drawn inside}@item{Four gray triangles, all the same size}]}
                       }
                @point{@student{@bitmap{images/csquared.png}Para cualquier triángulo rectángulo, es posible dibujar una imagen donde la hipotenusa se utiliza para los cuatro lados de un cuadrado. En el diagrama mostrado aquí, el cuadrado blanco está rodeado por cuatro grises, triángulos rectángulos idénticos, cada uno con lados A y B. El cuadrado tiene cuatro lados idénticos de longitud C, que son las hipotenusas para los triángulos. Si el área de un cuadrado se expresa por @math{side * side}, entonces el área del espacio en blanco es @math{C^{2}}.}
                       @teacher{Have students place their gray triangles onto the paper, to match the diagram.}
                       }
                @point{@student{@animated-gif{images\Pythag_anim.gif} Al mover los triángulos grises, es posible crear dos rectángulos que encajen dentro del cuadrado original. Mientras que el espacio ocupado por los triángulos ha cambiado, no se ha vuelto más grande o pequeño. Del mismo modo, el espacio en blanco se ha dividido en dos cuadrados, pero en total permanece del mismo tamaño. Al usar las longitudes laterales A y B, se puede calcular el área de los dos cuadrados.
                                 @activity[#:forevidence (list "8.G.6-8&1&1" "8.G.6-8&1&1" "8.G.6-8&1&3")]{¿Cuál es el área del cuadrado más pequeño? ¿La del cuadrado más grande?}}
                       @teacher{You may need to explicitly point out that the side-lengths of the triangles can be used as the side-lengths of the squares.}
                       }
                @point{@student{@bitmap{images/absquare.png}El cuadrado más pequeño tiene un área de @math{A^{2}}, y el cuadrado más grande tiene un área de @math{B^{2}}. Dado que estos cuadrados son sólo el cuadrado original dividido en dos piezas, sabemos que la suma de estas áreas debe ser igual al área del cuadrado original:
                                 @bannerline{@math{A^{2} + B^{2} = C^{2}}}
                                 @activity[#:forevidence (list "8.G.6-8&1&1" "8.G.6-8&1&2" "8.G.6-8&1&3")]{¿Funciona la misma ecuación para cualquier valor de A y B?}}
                       @teacher{}
                       }
                @point{@student{Para obtener C por sí mismo, tomamos la raíz cuadrada de la suma de las áreas:
                                @bannerline{@math{\sqrt{A^{2} + B^{2}} = C}}
                        @activity[#:forevidence (list "BS-CE&1&4")]{
                               Ve a la @worksheet-link[#:name "distance-example"] de tu libro de ejercicios - veras la misma fórmula 
                               escrita, esta vez utilizando @code{line-length} para calcular la distancia a lo largo de los ejes x-y. El Círculo de Evaluación
                               ya ha sido parcialmente completado aquí, pero tendrás que terminarlo por tu cuenta. Una vez que hayas terminado, convierte ese círculo 
                               en código en la parte inferior de la página.}}
                        @teacher{Remind students that A and B are the horizontal and vertical lengths, which are calculated by @code{line-length}.}
                        }
                @point{@student{El código de la @worksheet-link[#:name "distance-example"] calculará con precisión la distancia entre dos objetos cuyos centros están en (3,0) y (0,4). Pero, ¿qué pasa con otros puntos? Sería bueno tener una función que calcula la distancia para @italic{cualquier} dos conjuntos de puntos.
                                @activity[#:forevidence (list "BS-DR.3&1&1" "BS-PL.4&1&1" "8.G.6-8&1&3" "8.F.1-3&1&1" "8.F.1-3&1&3")]{
                                   Ve a la  @worksheet-link[#:name "distance"] de tu libro de ejercicios y utiliza la receta de diseño para escribir tu función de @code{distance}. 
                                   Ten la libertad de usar tu trabajo de la página anterior como tu primer ejemplo, y luego regresa con uno nuevo.}}
                        @teacher{WARNING: make sure students are giving @code{line-length} the proper coordinates! Many students mistakenly pair @code{px} and @code{py} 
                                 together, rather than pairing the x-coordinates. Check student work carefully!}
                        }
                ]}

@lesson/studteach[
     #:title "¿Choque?" 
     #:duration "25 min"
     #:overview "Students reason about the mathematical behavior of collision detection"
     #:learning-objectives @itemlist[@item{Students learn how to use the distance formula to detect collisions in games}]
     #:evidence-statements @itemlist[@item{Students understand that collisions occur when the distance between objects is below some threshhold}
                                     @item{Students understand how to determine the collision threshhold between two objects}
                                     @item{Students write a @code{collide?} function that determines whether the player and danger elements in their games have collided}]
     #:product-outcomes @itemlist[@item{Los estudiantes agregan una función @code{collide?} a sus juegos para detectar cuando el jugador y el peligro han chocado}]
     #:exercises (list (make-exercise-locator/file "Collide" "late-to-class-design-recipe-assess" "Check this Design Recipe: Are You Late to Class?"))
     #:standards (list "F-IF.1-3" "F-IF.4-6" "8.F.1-3" "A-SSE.1-2" "8.G.6-8")
     #:materials @itemlist[@item{Entorno de edición (WeScheme o DrRacket con el bootstrap-teachpack instalado)}
                           @item{El @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "Libro de Trabajo") del estudiante}
                           @item{Todas las computadoras de los estudiantes deben tener sus plantillas de juego precargadas, con sus archivos de imagen enlazados}
                           @item{Lapiceros/lápices para los estudiantes, marcadores de pizarra para profesores}
                           @item{Cartel de clase (Lista de reglas, tabla de lenguaje, calendario del curso)}
                           @item{Tabla de Lenguaje (Vea abajo)}
                          ]
     #:prerequisites (list "2D Distance" "and/or")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
       @points[@point{@student{A estas alturas, haz definido una función llamada @code{distance}: tiene cuatro entradas numéricas (representando al jugador X, jugador Y, peligro X y peligro Y) y produce un número que representa la distancia entre esas coordenadas. Si el jugador está parado en (320, 240) y el peligro está en (400, 159), la distancia se puede calcular evaluando @code{(distance 320 240 400 159)}.}
                       @teacher{}
                       }
                @point{@student{@activity[#:forevidence (list "F-IF.1-3&1&1" "F-IF.4-6&1&3" "A-SSE.1-2&1&4")]{Para cada una de las siguientes coordenadas de jugador y peligro, escribe la expresión que utiliza la función de @code{distance} para calcular la distancia entre los puntos. Puedes escribir en código o en un Círculo de Evaluación:
                                        @itemlist[@item{El jugador está en (100, 225) y el peligro está en (174, 300)}
                                                  @item{El jugador está en (48, 20) y el peligro está en (210, 160)}
                                                  @item{El jugador está en (300, 60) y el peligro está en (130, 240)}
                                                 ]}}
                        @teacher{}
                       }
                @point{@student{Ahora que sabes cómo calcular la distancia entre dos objetos, debes decidir cuándo dos objetos han colisionado.  Hemos discutido esto antes en la unidad utilizando círculos: dos círculos chocan cuando la distancia entre ellos es menor que la suma de sus radios.  Si tus objetos tienen esquemas más interesantes que círculos, este cálculo puede ser difícil de hacer con precisión.  Afortunadamente, la mayoría de los juegos no tienen que ser precisos (se mueven demasiado rápido para que la gente vea el momento exacto del impacto).  Sólo tenemos que averiguar cuándo los elementos están lo suficientemente cerca, y utilizar eso para detectar la colisión.}
                       @teacher{You can spend additional time on this point by having students think about collision distances between different shapes.  The rest of Bootstrap doesn't require this, but this may be a good point to integrate additional geometry if you are teaching math.}}
                @point{@student{A menos que las imágenes seleccionadas para tu juego sean muy pequeñas, 50 pixeles es generalmente una distancia suficiente para detectar las colisiones entre tu jugador y su peligro. Si estas utilizando imágenes muy pequeñas, es posible que desees detectar una colisión cuando la distancia entre los caracteres sea inferior a 20.
                              @activity[#:forevidence (list "8.G.6-8&1&3")]{¿Cómo podrías comprobar si la distancia entre (320, 240) y (400, 159) es @italic{menor de 50?} ¿Cómo podrías comprobar si la distancia entre esas coordenadas es menor de 20?}}
                       @teacher{}
                       }
                @point{@student{@activity[#:forevidence (list "8.F.1-3&1&1" "8.F.1-3&1&3")]{Ve a la  @worksheet-link[#:name "collide"] de tu libro de trabajo, y utiliza la receta de diseño para escribir una función que produzca @code{true} si la distancia entre dos coordenadas es menor de 50. SUGERENCIA: ¡Deberías utilizar tu función de @code{distance}!}
                                @activity{¿Ingresar tu @code{collide?} Definición de la función en tu archivo de juego. Juega tu juego y haz que tu jugador colisione con su peligro. ¿Tu juego ahora hace algo diferente de lo que hizo antes de que escribieras @code{collide?}?}
                      }
                        @teacher{}
                        }
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
        @points[@point{@student{¡Felicidades - tu juego está completo! Tómate un minuto para desplazarte por todo el código que has estado escribiendo y piensa
                                 en que tanto has aprendido: Los Círculos de Evaluación, tipos de datos como @code{Number}, @code{String}, @code{Image}
                                y @code{Boolean}, la importancia de los Contratos, Declaraciones de Propósito y funciones por partes. Has aprendido un nuevo 
                                lenguaje de programación y, lo que es más importante, has aprendido la Receta de Diseño, que te permite resolver problemas de palabras
                                 y retos de programación concentrándote en un solo paso a la vez, asegurándote de que cada paso se comprueba contra el
                                que venía antes.
                                }
                        @teacher{}
                        }
                 @point{@student{@activity{Una vez que los programadores consiguen que algo trabaje, vuelven siempre sobre su código y se cercioran que es legible, 
                                          claro y fácil para que los demás lo entiendan. Un coche que funciona bien podría ser agradable, pero no vale mucho
                                          ¡si es imposible para un mecánico repararlo o actualizarlo! Asegúrate que tu código sea hermoso, por dentro y por fuera.
                                          @itemlist[@item{¿Cada función tiene su contrato escrito correctamente?}
                                                     @item{¿Cada función tiene una declaración de propósito que describe exactamente lo que hace?}
                                                     @item{¿Cada función tiene por lo menos dos ejemplos?}
                                                     @item{Cuando hace clic en "Run", ¿pasan todos sus ejemplos?}
                                                     ]}}
                         @teacher{@itemlist[@item{Have students volunteer what they learned in this lesson}
                                            @item{Reward behaviors that you value: teamwork, note-taking, engagement, etc}
                                            @item{Pass out exit slips, dismiss, clean up.}]}}
                        ]}
}