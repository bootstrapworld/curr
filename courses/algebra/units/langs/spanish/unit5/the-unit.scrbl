#lang curr/lib

@title{Unidad 5: Animación del juego}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sqr sqrt expt} "1 ,4 ,44.6") 
                                       (list "String" @code{string-append string-length} " \"hello\" ")                          
                                       (list "Image" @code{rectangle circle triangle ellipse star scale rotate put-image} "(circle 25 \"solid\" \"red\")"))]{
@unit-descr{Los estudiantes definen funciones que mapean atributos de su juego de un marco a otro, permitiéndoles mover sus peligros, objetivos y proyectiles.}
}

@unit-lessons{
@lesson/studteach[
     #:title "Cazando Errores"
     #:duration "20 mins"
     #:overview ""
     #:learning-objectives @itemlist[@item{Gain more experience understanding and correcting programming errors}]
     #:evidence-statements @itemlist[@item{Students will be able to read error messages for basic syntax errors}
                                     @item{Students will be able to edit programs to eliminate basic syntax errors}]
     #:product-outcomes @itemlist[]
     #:standards (list "BS-PL.1" "BS-PL.2" "BS-PL.3" "BS-IDE")
     #:materials @itemlist[@item{Lapiceros/lápices para los estudiantes, marcadores de pizarra para profesores}
                            @item{Cartel de clase (Lista de reglas, tabla de lenguaje, calendario del curso)}
                            @item{Tabla de Lenguaje (Vea abajo)}
                            @item{"Bug Hunting" [Bugs.rkt de @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @editor-link[#:public-id "MdMWbZJH3t" "WeScheme"]] precargado en las máquinas de los estudiantes}]
     #:preparation @itemlist[@item{Los estudiantes están registrados en WeScheme.org, o han abierto DrRacket.}]
     #:prerequisites (list "Defining Functions")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Depurando (buscando y corrigiendo problemas en el código) es una parte importante de la programación, así que es una buena idea practicar buscando errores en código. 
                                @activity[#:forevidence (list "BS-IDE&1&2" "BS-PL.1&1&2" "BS-PL.2&1&1" "BS-PL.2&1&2" "BS-PL.3&1&3")]{
                                        Abre el programa @editor-link[#:public-id "MdMWbZJH3t" "Bug Hunting"] en una nueva ventana, y observa si puedes encontrar errores en cada expresión. Haz clic en "Run" y lee el mensaje de error cuidadosamente. Después de corregir cada uno, hacer clic en Run te mostrará el mensaje de error del siguiente problema.}}
                        @teacher{Make sure students understand that the goal is not to FIX the bugs, but rather just to find them.}
                        }
                 ]}

@lesson/studteach[
     #:title "Movimiento de peligro y objetivo"
     #:duration "30 minutos"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students learn to move game elements through functions that compute attributes in one frame from attributes in the previous frame}]
     #:evidence-statements @itemlist[@item{Students will be able to write functions that take in one dimension of a game element's coordinate and produce the next coordinate value in that dimension}
                                     @item{Students will learn how to control speed of movement through functions}]
     #:product-outcomes @itemlist[@item{Los estudiantes agregarán movimiento al peligro (danger) de sus juegos}
                                  @item{Los estudiantes agregarán movimiento al objetivo (target) de sus juegos}]
     #:exercises (list (make-exercise-locator/file "Danger-and-Target-Movement" "target-leap-design-recipe-assess" "Check this Design Recipe: Making Players Leap")
		       )
     #:standards (list "F-IF.1-3" "F-LE.5" "BS-DR.2" "BS-DR.3")
     #:materials @itemlist[@item{Lapiceros/lápices para los estudiantes, marcadores de pizarra para profesores}
                            @item{El @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "Libro de Trabajo") del Estudiante}
                            @item{Todas las computadoras de los estudiantes deben tener sus plantillas de juego precargadas, con sus archivos de imagen enlazados}
                            @item{Cartel de clase (Lista de reglas, tabla de lenguaje, calendario del curso)}
                            @item{Tabla de Lenguaje (Vea abajo)}]
     #:preparation @itemlist[@item{OPCIONAL: Reparta la @(new-tab "https://docs.google.com/document/d/1i3WQ4Q58Wn6fhqxEz027KDcUHIewtk-wLPQzJalCFt0/edit?usp=sharing" "Hoja de Actividades de Calentamiento").}]
     #:prerequisites (list "Game Images" "The Design Recipe")
     #:pacings (list 
                @pacing[#:type "remediation"]{At this point, students should be very comfortable with the Design Recipe. If they are struggling, try reviewing the Contract with them first, then having a student act out the function. Ask that student what their name is, what they are expecting to be given, and what they will produce. Have them simulate a function call by calling out their name ("update-danger") and giving them an x-coordinate (they should produce a number that is 50 fewer than what they were given). Then refer back to this skit when writing Examples: the call-and-response is exactly how the code should behave, with students only having to write the code for whatever work your volunteer was doing in their head.}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@bitmap{images/AnimationDiagram.png}Las dimensiones de tu videojuego son 640x480, y cada personaje es ubicado en un conjunto de coordenadas (x,y). Tu Objetivo (T), Jugador (P) y Peligro (D) cada movimiento sobre el eje x- o y-, mueve las coordenadas x- o y- de acuerdo a una función animada. Esas funciones de animación empezaran de forma simple: Ellas toman la coordenada x- o y- actual, y producen la siguiente coordenada x- o y-. Después, tú podrás adaptarlas para crear desplazamientos más sofisticados, usando @italic{ambas} coordenadas x- y y-.}
                        @teacher{}
                        }
                 @point{@student{@activity[#:forevidence (list "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2" "F-LE.5&1&1" "7.EE.3-4&1&4" "F-IF.1-3&1&4")]{
                                           Ve a la @worksheet-link[#:name "update-danger"] de tu libro de trabajo hasta la sección @code{update-danger}.
                                           @itemlist[@item{Lee el problema de palabra cuidadosamente, y presta atención a @italic{qué toma la función}.}
                                                      @item{Llena el @vocab{Contrato} y @vocab{Declaración de propósito} para la función, usando lo que encerraste para ayudarte a elegir el Dominio.}
                                                      @item{Escribe dos @vocab{Ejemplos} para la función.}
                                                      @item{Encierra y etiqueta lo que varía entre esos ejemplos, y etiquétalo con un nombre de @vocab{variable}.}
                                                      @item{Define la función.}]}}
                         @teacher{If students are working on their own, check their work to make sure every last step is being executed correctly. If the class is working through it together, be sure to ask students to justify each step in terms of a prior step. 
                                  Tip: tell students that they must get your permission before typing in their code, then use that expectation to check each student's paper carefully.}
                         }
                 @point{@student{Poniendo todo eso unido, @code{update-danger} es definido por:
                                 @code[#:multi-line]{; update-danger : Number -> Number
                                                     ; resta 50 de la coordenada de peligro x-
                                                     (EXAMPLE (update-danger 171) (- 171 50))
                                                     (EXAMPLE (update-danger -90) (- -90 50))
                                                     (define (update-danger x) (- x 50))}
                                 (Nota: Tú podrías tener diferentes ejemplos o nombres de variable.)
                                 @activity{Abre tu archivo de juego guardado y desplaza hasta que encuentres la definición para @code{update-danger}. ¿Es correcto el contrato?
                                           Asegúrate que coincida con lo que tienes en tu libro de trabajo, agrega tus ejemplos, y corrige la definición. ¡Cuando haces clic en "Run" tú deberías ver tu peligro volar a través de la pantalla!}
                                 }
                         @teacher{}
                         }
                 @point{@student{Ahora es tiempo de animar el objetivo, el cual se mueve en la dirección opuesta.
                                 @activity[#:forevidence (list "BS-DR.3&1&1" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2" "7.EE.3-4&1&4" "F-IF.1-3&1&4")]{
                                           Ve a la @worksheet-link[#:name "update-target"] de tu libro de trabajo hasta la sección @code{update-target}.
                                           @itemlist[@item{Lee el problema de palabra cuidadosamente, y presta atención a @italic{qué toma la función}.}
                                                      @item{Llena el @vocab{Contrato} y @vocab{Declaración de Propósito} para la función, usando lo que encerraste para ayudarte a elegir el Dominio.}
                                                      @item{Escribe dos @vocab{Ejemplos} para la función.}
                                                      @item{Encierra y etiqueta lo que varía entre esos ejemplos, y etiquétalo con un nombre de @vocab{variable}.}
                                                      @item{Define la función.}]}}
                         @teacher{For students who finish these quickly, have them experiment with making the Target and Danger move faster or slower, or change direction altogether. Be sure that they are typing in Examples, and updating those examples to keep up with any changes to their definition.}
                         }
     ]}

@lesson/studteach[
     #:title "Movimiento de Proyectil (Opcional)"
     #:duration "15 minutos"
     #:overview "OPTIONAL: students discover that the \"mystery\" definitions in the game are actually used to add projetiles, and adapt these definitions to add a custom projectile and projectile animation to their game."
     #:learning-objectives @itemlist[@item{Students learn to move game elements through functions that compute attributes in one frame from attributes in the previous frame}]
     #:evidence-statements @itemlist[@item{Students will be able to write functions that take in one dimension of a game element's coordinate and produce the next coordinate value in that dimension}]
     #:product-outcomes @itemlist[@item{Los estudiantes agregarán movimiento al proyectil de sus juegos}]
     #:standards (list "F-IF.1-3" "F-LE.5" "BS-DR.3")
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:prerequisites (list "Brainstorming" "The Design Recipe")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Esta plantilla de juego también tiene un objeto misterioso, el cual es definido al final de la pantalla. El "Misterio" es realmente un @italic{proyectil}, el cual será ubicado en la posición del jugador cada vez que la barra espaciadora sea presionada. Como puedes ver, el @code{mystery} es definido para ser una pequeña estrella gris, pero tu puedes cambiarla por la imagen que desees. Si tienes un juego donde el jugador es un mono, puedes cambiar la definición de @code{mystery} para que sea la imagen de una banana, para que el mono tire bananas cada vez que presiones la barra espaciadora. Un juego que se desarrolla en el espacio podría tener un alíen tirando cristales, o un juego deportivo podría tratarse de un atleta lanzando un balón.
                                @activity[#:forevidence (list "BS-DR.3&1&1" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2" "7.EE.3-4&1&4" "F-IF.1-3&1&4")]{
                                          @itemlist[@item{Cambia la definición de @code{mystery}, para que tu proyectil luzca de la forma que desees. No olvides usar @code{scale} y @code{rotate} si tienes que cambiar ligeramente la imagen.}
                                                     @item{Usa las instrucciones de diseño para escribir @code{update-mystery}, para que el proyectil se mueva de izquierda a derecha. Pista: esto será muy parecido a tus soluciones para @code{update-danger} y @code{update-target}!}]}}
                        @teacher{Be careful when introducing Projectiles into the game! Many students will actually be @bold{less creative} when using them, as it will automatically push their mindset towards the standards "shoot the bad guy" format. Many teachers choose to skip this section entirely, or else add it after the games are complete.}
                         }]
         }
       
@lesson/studteach[
     #:title "Concluyendo"
     #:duration "5 minutos"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
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
        @points[@point{@student{¡Felicidades - tienes los inicios de un juego funcional! Sin embargo, varias cosas siguen incompletas:
                                @itemlist[@item{El jugador no se mueve}
                                           @item{Cuando el objetivo y el peligro se mueven fuera de la pantalla, nunca regresan}
                                           @item{Nada sucede cuando el jugador colisiona con el peligro o el objetivo}]
                                Las siguientes lecciones incrementarán lo que conoces sobre las funciones, de tal manera que puedas definir funciones para implementar en cada una de esas características.}
                        @teacher{@itemlist[@item{Have students volunteer what they learned in this lesson}
                                            @item{Reward behaviors that you value: teamwork, note-taking, engagement, etc}
                                            @item{Pass out exit slips, dismiss, clean up.}]}
                        }]
         }
}

