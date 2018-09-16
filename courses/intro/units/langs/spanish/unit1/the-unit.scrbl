#lang curr/lib

@title{Unidad 1: Videojuegos y Planos Cartesianos}

@unit-overview/auto[#:lang-table (list (list "" @code{} ""))]{
  @unit-descr{Los estudiantes discuten los componentes de sus videojuegos favoritos y descubren que pueden ser reducidos a una serie de coordenadas. A continuación, exploran las coordenadas en el espacio cartesiano, e identifican las coordenadas de los personajes en un juego en varios puntos en el tiempo. Una vez que se sienten cómodos con las coordenadas, ellos hacen una lluvia de ideas sobre sus propios juegos y crean listas de coordenadas de muestra para diferentes puntos en el tiempo en su propio juego.}
}
@unit-lessons{
@lesson/studteach[
     #:title "Introducción"
     #:duration "5 mins"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[@item{OPCIONAL: Reparta la @(new-tab "https://docs.google.com/document/d/1USFPXkeO5AbGOzm_U0tMv4NV3RrxTMTyg-bqIKUf4q4/edit?usp=sharing" "Hoja de Actividades de Calentamiento").}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
 @point{@student{Bienvenido a Bootstrap! En este curso, tú estarás aprendiendo un nuevo @vocab{lenguaje de programación} - una manera de decirle a las computadoras exactamente lo que quieres que ellas hagan. Así cómo el español, inglés o francés, un lenguaje de programación tiene su propio vocabulario y gramática que tu tendrás que aprender. Afortunadamente, el lenguaje que tú estarás usando acá ¡tiene mucho en común con la simple matemática que tú ya conoces!}                    @teacher{Set expectations and rules for the class.
                              Connect the material to come with things students already know:
                              @itemlist[@item{What makes a language? Do some students already speak more than one language?}
                                         @item{Programming is very much a language, with its own syntax, semantics, etc}
                                         @item{Ask students about their favorite videogames. Be open about the scale of a modern game: they cost millions of dollars, are built by huge teams of programmers and artists, and are developed over years.}
                                         @item{Set expectations about what can be accomplished in a single, introductory programming class.}]}
                     }
              ]
         }

@lesson/studteach[
     #:title "Veamos una Demostración"
     #:duration "10 mins"
     #:overview "Juegue un juego simple, luego deséchelo y averigüe qué está pasando en la computadora."
     #:learning-objectives @itemlist[@item{Model a simple videogame}]
     #:evidence-statements @itemlist[@item{Students will be able to identify the elements of a game and how each one changes during gameplay}]
     #:product-outcomes @itemlist[@item{En los libros de trabajo, los estudiantes crean un modelo de datos que describe un videojuego simple.}]
     #:standards (list "BS-M")
     #:materials @itemlist[@item{Entorno de edición (WeScheme o DrRacket con el bootstrap-teachpack instalado)}]
     #:preparation @itemlist[@item{Computadora para cada estudiante (o pareja), corriendo WeScheme o DrRacket}
                             @item{Si utiliza DrRacket, asegúrese de que el archivo Ninja.rkt está cargado}
                             @item{"NinjaCat" [NinjaCat.rkt de @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @editor-link[#:public-id "sggzRzgU5T" "WeScheme"]] precargado en las maquinas de los estudiantes}
                             @item{El @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "libro de trabajo"] del estudiante, carpetas con nombres en las cubiertas y algo con que escribir.}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
          @point{@student{Comencemos por explorar un videojuego simple, y luego averiguar cómo funciona. Abre @run-link[#:public-id "sggzRzgU5T" "este enlace"] 
                         para jugar el juego, y pasar un minuto o dos explorándolo. @italic{¡Tú puedes utilizar los cursores para mover el gato a la izquierda, derecha y saltar -  para tratar de atrapar el rubí y evitar el perro!}}
                 @teacher{[@(new-tab "https://www.youtube.com/watch?v=KSt_3ovWfjk" "Video")] Show the kids NinjaCat, either letting them play or by demoing it in front of the class. You can move the cat up, down, left and right by using the arrow keys. 
                          Play until the students see all the characters (the clouds, the ruby, the dog and the cat), and be 
                          sure to point out the title and score as well.}
                 }
          
          @point{@student{Este juego se compone de @italic{caracteres}, cada uno de los cuales tiene su propio comportamiento. El Rubí se mueve de la derecha a la izquierda, al igual que el perro. NinjaCat sólo se mueve cuando pulsa las teclas de flecha, y puede moverse hacia la izquierda, derecha, arriba y abajo. Podemos averiguar cómo funciona el juego pero primero debemos entender cómo funciona cada personaje. }
                 @teacher{}
                 }
          
          @point{@student{@activity[#:forevidence (list "BS-M&1&1")]{@bitmap{images/game-table1.png} Pasa a @worksheet-link[#:name "NinjaCat-Dissection"] en tú libro de trabajo. Acá tenemos una tabla, que usaremos para hacer ingeniería inversa a NinjaCat y ver cómo funciona. Llena la primera columna con una lista completa de todas las cosas en el juego.}
                           }
                 @teacher{This can be a team activity. Solicit a few examples from students, to make sure they understand what's being listed here: nouns like "the cat", not verbs like "jumping". During this activity, walk around and see how groups are doing. 
                          This is the time to encourage expectations of community and respect - call out good teamwork when you see it! When time is up, give them a countdown: "30...10... 5... 4... 3... 2... 1... PENCILS DOWN, EYES UP HERE!" Wait for total silence and complete attention. }
                 }
          
          @point{@student{¿Listaste los cuatro personajes en movimiento? ¿Qué más hay en el juego? ¿Es el fondo una parte del juego? ¿El puntaje?}
                 @teacher{Have students come up to the board, and fill in the table with what they've found. If time is short, call on students and have them tell you what to write.}
                 }
          
          @point{@student{@activity{@bitmap{images/game-table2.png} También necesitamos que pienses sobre lo que esta @italic{cambiando} cuando jugamos el juego. ¿Qué hay acerca del Rubí? ¿Se hace más grande? ¿Cambia de color? ¿Acaso da vueltas? ¡La única cosa que cambia en el Rubí es la @italic{posición}! Todo lo demás acerca de él es igual. ¿Qué hay acerca del perro? ¿y del gato? Llena el resto en la segunda columna, listando todo lo que cambia sobre cada personaje.}}
                 @teacher{}
                 }
                            
          @point{@student{¿Notaste que el perro, el Rubí, la nube y el gato solo cambiaron de posición y nada más? ¿Qué hay del fondo no cambia en nada, por lo que @italic{podemos dejar ese cuadro de la tabla en blanco.} ¿Notaste que la puntuación cambia de valores? ¡Tú querrás agregar eso a la tabla también!}
                 @teacher{Quickly fill in the second column on the board. Assign scores.}
                 }
          ]}

@lesson/studteach[
     #:title "Planos Cartesianos"
     #:duration "15 mins"
     #:overview "Students must use the Cartesian plane to describe the location of characters in a picture."
     #:learning-objectives @itemlist[@item{Understand the use of number lines in defining locations via coordinates}]
     #:evidence-statements @itemlist[@item{Students apply the number line as a tool for objectively defining location, first identifying how to apply it to 
                                           describe the position of a character onscreen in one dimension. This understanding is extended to two dimensions, 
                                           ultimately motivating the use of a coordinate grid.}]
     #:product-outcomes @itemlist[@item{Los estudiantes identifican las coordenadas de los personajes en una imagen}]
     #:standards (list "6.NS.5-8" "N-Q" "5.G.1-2")
     #:materials @itemlist[@item{Recortes del  @resource-link[#:path "images/ninjacat.png" #:label "NinjaCat"],  @resource-link[#:path "images/dog.png" #:label "Perro"]
                                 y el  @resource-link[#:path "images/ruby.png" #:label "Rubí"]}
                            @item{Los libros de trabajo de los estudiantes y algo con que escribir.}]
     #:preparation @itemlist[@item{Los libros de trabajo de los estudiantes y algo con que escribir.}]
     #:prerequisites (list "Dissecting a Demo")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{Are there locations that can be described using one coordinate system, that cannot be described 
                                                            using another? Can any valid coordinate system can be perfectly mapped to any other valid 
                                                            coordinate system?}]}
                )
        ]{
  @points[
      @point{@student{@bitmap{images/number-line.png}Las computadoras usan números para representar la posición de un personaje en la pantalla, usando líneas numéricas cómo reglas para medir la distancia desde la esquina inferior izquierda de la pantalla. Para nuestro videojuego, colocaremos la línea numérica de modo que la pantalla pase de 0 (a la izquierda) a 640 (a la derecha). }
              @teacher{The key point for students here is @italic{precision} and @italic{objectivity}. There are many possible correct answers, but students
                       should understand why any solution should be accurate and unambiguous. This requires students to propose solutions that share a common
                       "zero" (the starting point of their number line) and direction (literally, the direction from which a character's position is measured).
                       Have students discuss this. If time allows, have a student leave the room and let other students come up with ways to write
                       down where the dog is on the board. Then remove the dog, call in the other student, and have the class direct them using 
                       only what they've written down.Try positioning the characters at different places on the line, and have students tell you 
                       what their coordinates are. Try giving them verbal descriptions (e.g. "The center of the screen", "Off the righthand 
                       side of the screen", etc.) and have them translate those into coordinates.}
              }
       @point{@student{Podemos tomar la imagen del perro, pegarlo en cualquier parte de la línea, y medir la distancia de vuelta al borde izquierdo. Cualquier otra persona que conozca nuestra línea numérica será capaz de duplicar la posición exacta del perro, conociendo sólo el número. ¿Cuál es la coordenada del perro en el lado derecho de la pantalla? ¿El centro? ¿Qué coordenada colocaría al perro más allá del borde izquierdo de la pantalla?}
               @teacher{}
               }
      @point{@student{@bitmap{images/cat-coordinates.png}Agregando una segunda línea de números, nosotros podemos localizar a un personaje en cualquier parte de la pantalla en cualquier dimensión. La primera línea es llamada eje x, que va de izquierda a derecha. La segunda línea, que va de arriba a abajo es llamada eje y. Una @italic{coordenada} bidimensional consiste en posiciones localizadas tanto en el eje x cómo en el eje y.}
              @teacher{A coordinate represents a single point, and an image is (by definition) many points. Some students will ask whether a
                       character's coordinate refers to the center of the image, or one of the corners. In this particular program, the center 
                       serves as the coordinate - but other programs may use another location. The important point in discussion with students
                       is that there is flexibility here, @italic{as long as the convention is used consistently}.}
              }
      @point{@student{Supongamos que queremos localizar la posición del NinjaCat en la pantalla. Nosotros podemos encontrar la coordenada en x trazando una línea desde el NinjaCat hasta el eje leyendo el número de la posición correspondiente. La coordenada @italic{y} se encuentra trazando una línea hasta el eje y.}
              @teacher{(If time allows, invite volunteers up to the board to try placing NinjaCat and the Ruby at different locations. Have students identify the
                       coordinates at the corners of the screen. For additional practice, have students bisect each side of the screen and label
                       the midpoints.)}
             }
      @point{@student{Cuando escribimos estas coordenadas siempre escribimos la de x antes de la de y (¡cómo en el alfabeto!). La mayor parte del tiempo veas las coordenadas escritas de la siguiente manera: (200, 50) lo que significa que la coordenada en x es 200 y que la coordenada en y es 50.}
              @teacher{}
              }

      @point{@student{Dependiendo de cómo se mueva un personaje, su posición podría cambiar sólo a lo largo del eje x, sólo a lo largo del eje y, o ambos. Mira de nuevo la tabla que llenaste en el libro de trabajo (@worksheet-link[#:name "NinjaCat-Dissection"]).
                      ¿Puede NinjaCat moverse arriba y abajo en el juego? ¿Puede moverse a izquierda y derecha? Entonces, ¿qué está cambiando: su coordenada x, su coordenada y, o ambas cosas? ¿Qué pasa con las nubes? ¿Se mueven arriba y abajo? ¿Izquierda y derecha? ¿Ambos?}
              @teacher{}
              }
      
      @point{@student{@activity[#:forevidence (list "N-Q&1&4" "5.G.1-2&1&1" "5.G.1-2&1&2")]{
                          @bitmap{images/game-table3.png}Llena el resto de la tabla, identificando que está cambiando para cada uno de los personajes.}
                       }
              @teacher{}
              }
      
      @point{@student{@activity[#:forevidence (list "6.NS.5-8&1&2")]{Ve a la @worksheet-link[#:name "NinjaCat-Coordinates"] en tú libro de trabajo, y mira la página del proyecto que tiene la imagen del juego NinjaCat. ¿Cuáles son las coordenadas en la esquina inferior izquierda de la pantalla? ¿Parte superior derecha? ¿Centrar? Para la práctica, etiquetar las coordenadas en el punto medio de @italic{cada lado} de la pantalla, a continuación, etiquetar las coordenadas de cada uno de los personajes.}}
              @teacher{}
              }]
   }

@lesson/studteach[
     #:title "Lluvia de Ideas"
     #:duration "15 mins"
     #:overview "Students select the theme and characters for their videogame"
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Los estudiantes completan la hoja de trabajo de diseño de videojuegos para diseñar su propio juego.}]
     #:standards (list)
     #:materials @itemlist[@item{}]
@;     #:preparation @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket}
@;                            @item{If using DrRacket, make sure the Ninja.rkt file is loaded}
 @;                            @item{Student Workbooks, and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        
        
@points[
        @point{@student{En la @worksheet-link[#:name "Game-Design"], encontraras una plantilla de planificación para que tú puedas hacer tú propio juego. Al igual que hicimos una lista de todo en el juego NinjaCat, vamos a empezar con una lista de todo en tú juego.}
                @teacher{Have students put their names at the top of this page.}
                }
         
        @point{@student{Para iniciar, tú juego debe tener cuatro cosas en el: 
                        @itemlist[
                                  @item{Un fondo, cómo un bosque, una ciudad, el espacio, etc.}
                                   @item{Un jugador, que se pueda mover cuando el usuario presione una tecla}
                                   @item{Un objetivo, que vuela desde la derecha hacia la izquierda, y le da al jugador puntos por golpearlo.}
                                   @item{Un peligro, que vuela desde la derecha hacia la izquierda, y que el jugador debe evitar.}]}
                @teacher{Have students walk through some sample themes, to make sure they understand the format of the game. For example: A football 
                         game might have a quarterback for the player, a rival player for the danger, and a football as the target. A jungle game
                         might have a monkey as the player, a snake as the danger, and bananas as the target.}
                }
        
        @point{@student{@activity{¡Ahora es tiempo de ponernos creativos! Llena la @worksheet-link[#:name "Game-Design"] en tú libro de trabajo para @italic{tú} juego, usando tú propio jugador, objetivo y peligro.}}
                @teacher{Be sure to consult with every team. A lot of students will have trouble fitting their ideas into this 
                         format, or they'll struggle with coordinates. Be clear about what can and cannot be done! (e.g. - no 
                         3d games, joysticks, multiplayer games, etc. Hint: students who have a well-worded description of their
                         images will be happier with any images you could find them. Try searching for "Person" versus "Jogger",
                         for example.}
                }
        ]}

@lesson/studteach[
     #:title "Orden de operaciones"
     #:duration "20 mins"
     #:overview "Students identify the order of operations for complicated arithmetic expressions through diagramming (circles) and 
                 evaluating (the numerical answer). This lesson introduces students to the Circle of Evaluation, which is a sentence 
                 diagramming tool for arithmetic expressions. This is a powerful way to understand Order of Operations, as it forces
                 students to focus on the structure of expressions over their computed result."
     #:learning-objectives @itemlist[@item{Understand the structure of arithmetic expressions}
	                             @item{Understand order of operations in an expression}
                                     @item{Write expressions as Circles of Evaluation}
                                     @item{Translate between Circle of Evaluation and arithmetic expressions}
]
     #:evidence-statements @itemlist[@item{Students will be able to explain why arithemetic expressions require structure}
                                     @item{Students will be able to identify the order of operations in an expression that includes 
                                           adding, subtracting, multiplying and dividing}                                     
                                     @item{Given a Circle of Evaluation, students will be able translate the expression into the 
                                           arithmetic expression it represents}
                                     @item{Given an arithmetic expression, students will be able to complete a partially-finished Circle
                                           of Evaluation for the same expression}
                                     @item{Given a bank of Circles of Evaluation and arithmetic expressions, students will be able to match them}
                                     @item{Students will be able to translate the structure of an arithmetic expression into a Circle of 
                                           Evaluation}
]
     #:product-outcomes @itemlist[@item{Los estudiantes convierten varias expresiones aritméticas entre múltiples representaciones,}]
     #:standards (list "A-SSE.1-2" "BS-CE" "5.OA.1-2")
     #:exercises (list (make-exercise-locator "Order-of-Operations" "complete-coe-from-arith1")
                       (make-exercise-locator "Order-of-Operations" "complete-coe-from-arith2")
                       (make-exercise-locator "Order-of-Operations" "arith-to-coe1")
                       (make-exercise-locator "Order-of-Operations" "arith-to-coe2")
                       (make-exercise-locator "Order-of-Operations" "arith-to-coe3")
                       (make-exercise-locator "Order-of-Operations" "coe-to-arith1")
                       (make-exercise-locator "Order-of-Operations" "coe-to-arith2")
                       (make-exercise-locator "Order-of-Operations" "match-arith-coe1")
                       (make-exercise-locator "Order-of-Operations" "coe-to-math-answer1")
                       (make-exercise-locator "Order-of-Operations" "coe-to-math-answer2"))
@;     #:materials @itemlist[@item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}]
@;     #:preparation @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket}
@;                            @item{If using DrRacket, make sure the Ninja.rkt file is loaded}
 @;                            @item{Student Workbooks, and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{Have students practice translating very simple (one-operation) expressions into 
                                                              simple (one-circle) Circles of Evaluation. By choosing the numbers in these 
                                                              examples carefully, you can gradually introduce nesting by replacing a number 
                                                              in one expression with the Circle of Evaluation for another expression that 
                                                              evaluates to the same number. @italic{Replace the 7 in @code{7+5} with the 
                                                                                                                     Circle for @code{10-3}.}}]}
                @pacing[#:type "misconception"]{@itemlist[@item{This is the first opportunity to expose students to core vocabulary words, 
                                                                so be sure to use words like @bold{function}, @bold{value} and @bold{expression} 
                                                                carefully and consistently. Ask students to identify the parts of a Circle of 
                                                                Evaluation, and push them to use the vocabulary as well.}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
                @point{@student{Las matemáticas son un lenguaje, cómo el español, inglés o cualquier otro lenguaje. Nosotros usamos nombres cómo "pan", "tomate", "mostaza" y "queso" para describir objetos físicos. Las matemáticas tienen @vocab{valores}, cómo los números @math{1}, 
                                @math{2} o @math{3}, para describir cantidades.}

                        @teacher{Students should begin to look at math as a @italic{language}.  To help them with this, you can discuss syntax 
                                 and grammar of math, and its potential for ambiguity in the absence of a fixed order of operations.  Help 
                                 students see that math is a way to communicate calculations among people.}
                        }
                 @point{@student{Los humanos tenemos verbos cómo "Tirar", "correr", "construir" y "saltar" para describir acciones de esos nombres. Las matemáticas tienen 
                                 @vocab{funciones} cómo la suma y la resta, que son operaciones realizadas con números. Así cómo puedes "Cortar una pieza de pan", una persona puede también "agregar cuatro y cinco".}
                         @teacher{}
                        }
                 @point{@student{Una @vocab{expresión matemática} es cómo una oración: es una instrucción para hacer algo.  La expresión @math{4+5} nos dice que sumemos 4 y 5.  Para @vocab{evaluar} una expresión, seguimos las instrucciones en la expresión.  La expresión @math{4+5} @vocab{equivale a} @math{9}.}
                       @teacher{}
                       }
                 @point{@student{@activity{¿A que equivale la expresión @math{8*4}?  ¿A que equivale la expresión @math{20-16}?  ¿A que equivale la expresión @math{16-20}?}}
                         @teacher{}
                        }
                 @point{@student{A veces, necesitamos expresiones múltiples para realizar una tarea. Si tuvieras que escribir instrucciones para hacer un sándwich, importaría mucho lo primero: derretir el queso, cortar el pan, extender la mostaza, etc. El orden de las funciones también es importante en matemáticas. Si alguien dice "cuatro más dos menos uno", podrían significar varias cosas:
                                @itemlist[@item{Suma uno y dos, y después resta uno: @math{(4+2) - 1}}
                                          @item{Suma cuatro a la resta de uno menos dos: @math{4 + (2-1)}}]
                        @activity{Escribe una expresión que pueda significar varias cosas.}}
                        @teacher{}
                        }
                 
                 @point{@student{Dependiendo de la forma en la que leas la expresión, ¡tú podrías tener diferentes resultados!  Este es un problema, porque a menudo usamos matemáticas para compartir cálculos entre personas.  Por ejemplo, tú y tu empresa de telefonía  
                                  deben acordar de antemano cuánto pagaras por enviar mensajes de texto y hacer llamadas. Diferentes resultados podrían significar que tú factura esta mal.}
                         @teacher{}}
                 @point{@student{Evitamos problemas al acordar el orden en el cual usar las diferentes operaciones en una expresión. Hay dos maneras de hacer esto:
                               @itemlist[#:style 'ordered
                                         @item{Podemos acordar todos un orden para usar.}
                                         @item{Podemos agregar detalles a las expresiones para señalar un orden.}]
                          @activity{Escribe abajo una razón por la que es importante tener reglas sobre el orden de las operaciones.}}
                         @teacher{}
                        }
                  @point{@student{@bitmap{images/PEMDASTriangle.png} Los matemáticos no siempre estuvieron de acuerdo en el orden de las operaciones, pero ahora tenemos un conjunto común de reglas para evaluar las expresiones. La pirámide de la derecha resume el orden. Al evaluar una expresión, comenzamos aplicando las operaciones escritas en la parte superior de la pirámide (multiplicación y división). Sólo después de haber completado todas esas operaciones podemos bajar al nivel inferior. Si ambas operaciones están presentes
     (cómo en @math{4+2-1}), leemos la expresión de izquierda a derecha, @vocab{aplicando} las expresiones en el orden en el que aparecen.}
                         @teacher{This item covers PEMDAS (order of operations in ambiguous expressions).  You can skip this item if you
                                  do not need to cover PEMDAS.}
                         }
                  @point{@student{ @activity[#:forevidence (list "A-SSE.1-2&1&3" "5.OA.1-2&1&2")]{¿En qué orden debemos aplicar las funciones en el siguiente ejemplo? 
                                    @math{19 \div 2 * 11 - 7 + 8}
                                    @itemlist[#:style 'ordered
                                              @item{@math{+ \div * - }}
                                              @item{@math{\div * - +}}
                                              @item{@math{\div * + -}}
                                              @item{@math{* \div + -}}]}}
                          @teacher{}
                         }
                @point{@student{@bitmap{images/FixedCircle.png} Una forma de indicar el orden de las operaciones en una expresión es primero dibujar la expresión cómo un diagrama. Este diagrama se llama @vocab{Círculo de Evaluación}.  Aquí puedes ver un ejemplo de un Círculo de Evaluación, para la expresión matemática @math{4-5}.}
                        @teacher{[@(new-tab "https://www.youtube.com/watch?v=AMFaPKHp3Mg" "Video")] This section benefits enormously from visual aids, diagrams, etc. Make sure you have plenty of board space to 
                         draw examples!}
                        }
                @point{@student{Los Círculos de Evaluación muestran la estructura que se está desarrollando dentro de una expresión. Todos los Círculos de Evaluación tienen dos reglas:
                                @bannerline{Regla del Círculo 1: Cada círculo debe tener una función, que va en la parte superior del círculo.}
                                @bannerline{Regla del Círculo 2: Los números se escriben a continuación, en orden de izquierda a derecha.}
                       @activity[#:forevidence "BS-CE&1&1"]{@bitmap{images/CircleBug.png}¿Que regla rompe este círculo de evaluación?}}
                        @teacher{}
                        }
                @point{@student{@activity[#:forevidence (list "BS-CE&1&1" "5.OA.1-2&1&1")]{Intenta dibujar un círculo de evaluación para cada una de las siguientes expresiones:
                                          @itemlist[#:style 'ordered
                                                    @item{@math{6*4}}
                                                    @item{@math{7-10}}
                                                    @item{@math{5 + 8}}
                                                    @item{@math{\frac{351}{-1} }}]
                                          }
                                 @bitmap{images/FixedCircle.png} Cada círculo de evaluación @vocab{equivale a} el resultado de su expresión. Por ejemplo el círculo en la derecha equivale a @math{-1}, el círculo dice que se use la resta (la función que esta arriba) en los números en orden (@math{4-5}).}
                        @teacher{It's important for students to view the Circles of Evaluation as "just another way of writing arithemetic". 
                                 Have students discuss whether associativity and commutativity still matter here (they do).}
                        }
                @point{@student{@bitmap{images/Nesting.png}Para utilizar múltiples funciones en la misma expresión, podemos combinar Círculos de Evaluación. Mira el Círculo de Evaluación que has escrito para @math{351 / -1}. Ya sabemos que el Círculo parar @math{4 - 5} equivale a @math{-1}, por lo que podemos @italic{reemplazar el 
                                 numero con la expresión.} ¿Cambia esto a lo que equivale la expresión?}
                        @teacher{From this point forward, the Circles of Evaluation are your assessment tool for Order of Operations. 
                                 Quizzing students by asking them to correctly evaluate an expression is fraught with false negatives,
                                 as many student might get the order right but may still have problems with basic calculations. This 
                                 method is also vulnerable to Commutativity, since a student will correctly evaluate @math{1*2+2} 
                                 even if they get the order of operations wrong! Circles of Evaluation have neither of these flaws,
                                 as they put the emphasis where it should be: exercising a student's ability to see the structure 
                                 inside the arithemetic.}
                        }
                @point{@student{@activity[#:forevidence (list "BS-CE&1&2" "5.OA.1-2&1&1")]{
                                      @bitmap{images/fill-in-circle.png}Termina de escribir el Círculo de Evaluación que se muestra aquí, de modo que represente @math{(23 + 7) * (13 - 5)}}}
                        @teacher{}
                       }
                @point{@student{@bitmap{images/NestedCircle.png}¿A que es lo que equivale este Círculo de Evaluación?  Repasemos cómo evaluamos un Círculo::
                                 @itemlist[@item{Sabemos que estamos multiplicando porque esa es la función en la parte superior del Círculo.} 
                                           @item{El número @math{6}es el primer número en la multiplicación, porque está en el lado izquierdo.}
                                           @item{El segundo número de la multiplicación está en el lado derecho. El lado derecho tiene un círculo separado, por lo que necesitamos @vocab{evaluar} el número para ese círculo.  El segundo número es, por lo tanto, @italic{el resultado de sumar 4 y 5}.}
                                           @item{@math{4 + 5} (el círculo interno) equivale a @math{9}, y @math{6 * 9} (el círculo externo) equivale a @math{54}.  Este círculo equivale a @math{54}.}]
                        @activity[#:forevidence (list "BS-CE&1&3" "A-SSE.1-2&1&3" "5.OA.1-2&1&1")]{
                               @bitmap{images/NestedCircle2.png}Convierte este círculo de evaluación en una expresión aritmética.}
                        }
                        @teacher{Work through several of these examples with students, asking them to come up with arithmetic
                                 expressions and then convert them into Circles, or giving them Circles and having them 
                                 translate them back into arithmetic.  When you talk about Circles, be sure to consistently use
                                 the term @italic{function} for what's on top, rather than similar terms like "operation", "symbol",
                                 "procedure", "name", etc.  The Circles of Evaluation will help students see the similarity between
                                 arithmetic functions (like @math{+}) and algebraic functions (like @math{f}) if you use 
                                 terminology carefully.}
                        }
                @point{@student{@activity[#:forevidence (list "BS-CE&1&3" "A-SSE.1-2&1&3" "5.OA.1-2&1&1")]{
                              Haz coincidir los siguientes Círculos de Evaluación con las correspondientes expresiones aritméticas:
                                  @(circeval-matching-exercise/math 
				    (list (math "9 * (4 - 3)")
					  (math "(9 * 4) - 3")
					  (math "(9 - 3) * 4")
					  (math "(2 + 4) / (6 - 3)")
					  (math "-5 * 2"))
				    (list "(/ (+ 2 4) (- 6 3))"
					  "(- (* 9 4) 3)"
					  "(* -5 2)"
					  "(* 9 (- 4 3))"
					  "(* (- 9 3) 4)"))}
                        }
                        @teacher{}
                        }
             ]
         }

@lesson/studteach[
     #:title "Introducción a Programación"
     #:duration "15 mins"
     #:overview "Students are introduced to the programming environment"
     #:learning-objectives @itemlist[@item{Convert Circles of Evaluation into code}
                                     @item{Enter and evaluate code expressions for arithmetic on the computer}
                                     @item{Understand the goal of error messages from the computer}]
     #:evidence-statements @itemlist[@item{Students will be able to identify the Interactions and Definitions areas}
                                     @item{Students will be able to enter and evaluate simple arithmetic expressions in the Interactions area}
                                     @item{Students will be able to convert Circles of Evaluation into correctly-formed programs}
                                     @item{Students will be able to explain an 'unbounded identifier' error message}
                                     @item{Students will be able to explain the purpose of error messages}
                                     @item{Given a Circle of Evaluation, students will be able to complete a partially-written program}
                                     @item{Given a bank of Circles of Evaluation and programs, students will be able to match them}]
     #:product-outcomes @itemlist[]
     #:standards (list "A-SSE.1-2" "N-Q" "BS-CE" "BS-PL.1" "BS-IDE")
   @;  #:materials @itemlist[@item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}]
     #:preparation @itemlist[
 @;@item{Computer for each student (or pair), running WeScheme or DrRacket}
   @;                           @item{Students are logged into WeScheme.org, OR have opened DrRacket.}
    @;                          @item{Student Workbooks, and something to write with}
                              @item{Proyector}]
     #:prerequisites (list "Order of Operations")
     #:exercises (list (make-exercise-locator "Intro-to-Programming" "complete-code-from-coe1")
                       (make-exercise-locator "Intro-to-Programming" "coe-to-code1")
                       (make-exercise-locator "Intro-to-Programming" "coe-to-code2")
                       (make-exercise-locator "Intro-to-Programming" "coe-code-matching1")
                       )
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
                @point{@student{Abre la herramienta de programación de tu elección: Si haz instalado, DrRacket, haz doble clic en la aplicación para iniciarla. Si estas utilizando la herramienta en línea, @login-link["haz clic aquí para iniciar sesión"]
                                ingresa tú nombre de usuario y contraseña para iniciar sesión, luego haz clic en "Iniciar un nuevo programa".}
                        @teacher{Have the students look at the editor on their computers. Refer to overhead 
                                 projector as necessary.}
                        }
                 
                @point{@student{@bitmap{images/wireframeIDE.png}Esta pantalla es llamada el @vocab{editor}, y se parece al diagrama que ves acá. Hay algunos botones en la parte superior, pero la mayor parte de la pantalla está ocupada por dos grandes cuadros: el @vocab{área de definiciones} en la izquierda y el @vocab{área de Interacciones} en la derecha.}
                        @teacher{The Definitions area is where programmers define values and functions in their program, 
                                 while the Interactions area allows them to experiment with those values and functions. 
                                 This is analogous to writing a series of function definitions on a blackboard, and having 
                                 student evaluate expressions using those function on scrap paper. As students are not yet 
                                 defining values of their own, it is not important that students understand this distinction 
                                 right now.  For now, we will work only with the Interactions area.}
                        }
                
                @point{@student{Un programa @vocab{expresión legal} que cuando se evalúa, produce un valor. ¡Has estado escribiendo programas utilizando expresiones matemáticas desde que aprendiste a sumar! Al igual que en inglés, hay reglas que determinan si una oración tiene sentido. ¡Los programas también tienen reglas! Un programa puede ser muy complicado, pero no tiene que ser así: los programas más simples de todos son sólo Números.}
                        @teacher{Draw students' attention to the Language Table (see Lesson Overview for Unit 1),
                                 which currently sits empty. Add "Numbers" to the Types section of the language 
                                 table.}
                        }
                @point{@student{@bannerline{Regla de código 1: Todos los valores son expresiones legales.}
                                 @activity[#:forevidence "BS-IDE&1&1"]{¿A que crees que equivale @code{4}? 
                                                                       @editor-link[#:interactions-text "4"
                                                                                    "Haz clic aquí para probarlo."]}
                                              @itemlist[@item{Escribe 4 en el área de interacciones y presiona "enter". Tú veras el valor @code{4} aparecer en la siguiente línea en el área de interacciones.}
                                                        @item{Escribe 10 en el área de interacciones y presiona "enter"  Ahora el valor @code{10} aparecerá en el área de interacciones.}
                                                         @item{Intenta evaluar números cómo @code{10345017}, o números negativos, cómo @code{-2}.¿Hay un límite para cuán grande puede ser un número? ¿Qué sucede si escribes un decimal? ¿Qué sucede cuando tú das clic en un decimal, cómo @code{0.75}? Tú obtendrás un nuevo tipo de numero, una fracción, cómo @code{3/4}.}]
                                }
                        @teacher{The editing environment evaluates all fractions and returns them as decimals by default. This can be
                                 surprising to students at first, so you may want to take a moment to explain what's going on, and 
                                 show them that these decimals can be converted back to fractions just by clicking on them.  The 
                                 environment uses standard annotations for repeating, non-terminating decimal expressions and 
                                 properly handles expressions like @math{(\sqrt -1)}.  If you want to work with those kinds of 
                                 numbers in your class, enter them to get familiar with how they appear in the Interactions area.}
                        }
           
                
                @point{@student{@activity[#:forevidence "BS-IDE&1&2"]{La computadora obviamente sabe de números, pero ¿Qué pasa si tú le escribes algo de lo que @italic{no} conoce?
                                                                      ¿Se quejará? ¿Adivinara?
                                                                      @editor-link[#:interactions-text "dog" "Intenta preguntar a la computadora"] 
                                                                      que evalúe la palabra @code{perro} en el área de interacciones.}
                                 Estos mensajes de error son muy útiles para los programadores. En lugar de decir "este programa no funciona", el equipo hace lo mejor que puede para decirle lo que salió mal, y para darle tanta información cómo sea posible para ayudarle a solucionar el problema. ¡Asegurate siempre de leer estos mensajes cuidadosamente!
                                 }
                        @teacher{The error message uses the term "variable".  Don't worry if your students don't already know this 
                                 term; we will teach it to them shortly.  For now, students just need to get used to error messages 
                                 and the kinds of problems that they catch in programs.}
                        }
                
                @point{@student{Los Círculos de Evaluación también son fáciles de convertir en programas informáticos. Para traducir un Círculo de Evaluación en un programa, comienza con un paréntesis abierto  @code{(},  luego la función escrita en la parte superior del círculo, luego traduce las entradas de izquierda a derecha de la misma manera, agregando un paréntesis de cierre@code{)} cuando termines. Este proceso nos da la segunda regla para las @vocab{expresiones}:  
                                @bannerline{Regla de Código 2: Cada paréntesis abierto es seguido por una función, luego por una o más expresiones legales, y finalmente por un paréntesis de cierre.}
                                 @bitmap{images/FixedCircle.png}Acá esta el código para el Círculo de Evaluación: @code{(- 4 5)}
                                 @activity[#:forevidence "BS-PL.1&1&2"]{ @editor-link[#:interactions-text "(- 4 5)" "Mira que pasa"]
                                                                         cuando este código entra al área de interacciones.
                                                                         Presiona la tecla enter para evaluar el programa.  Tú deberías ver @math{-1} cómo respuesta.
                                                                        }
                        }
                        
                        @teacher{Have students practice converting simple Circles of Evaluation into code.  If you want to help students 
                                 understand when to use the parentheses, here are two explanations that we find useful.  First, the
                                 parens look like the Circle, and the Circle encloses the function name and its inputs.  Second, we
                                 use a more visual description of an ant eating its way through the expression.  The ant eats into the 
                                 Circle (an open paren), then goes to the function at the top, then to the arguments from left to right,
                                 then finally out of the Circle (a close paren).  If the ant encounters another Circle while writing 
                                 down the arguments, it needs another open paren, etc.}
                        }   
                @point{@student{@bitmap{images/NestedCircle.png}Cuando un Círculo de Evaluación tiene otros círculos dentro de él, la traducción sigue las mismas reglas: cada Círculo requiere un nuevo conjunto de paréntesis:
                                 @code{(* 6 (+ 4 5))}
                                 @activity[#:forevidence "BS-PL.1&1&2"]{@itemlist[@item{Intente ingresar este código en el área Interacciones. ¿Qué debe evaluar el programa cuando presiones enter?}
                                                     @item{Practica convirtiendo los otros círculos de evaluación que has dibujado en código.}]}}
                        @teacher{[@(new-tab "https://www.youtube.com/watch?v=vgkahOzFH2Q" "Video on Roles in Pair Programming.")]
                                  Scaffolding for Pair Programming: Talk to students about the roles of @italic{Driver} 
                                  and @italic{Navigator}. The Driver is the student with their hands on the keyboard - they're 
                                  in charge of typing, using the mouse, etc. The Navigator should be telling the Driver what to
                                  type, and pointing out mistakes or suggesting things. It's important to clarify what these 
                                  roles are (perhaps reinforcing them with a visual), to ensure that both partners are active 
                                  and talking to one another about the task at hand.  The linked video does a great job discussing these roles.}
                        }
               
                @point{@student{@bannerline{Todas las expresiones que siguen al nombre de la función se llaman @vocab{argumentos}  a la función. El siguiente diagrama resume la forma de una expresión que utiliza una función.
                                            @bitmap{images/ExpressionDiagram.png}}
                                @activity[#:forevidence (list "BS-CE&1&2" "BS-CE&1&4")]{
                                        Para practicar, pasa a la @worksheet-link[#:name "Circle-of-Evaluation-Practice"]
                                        en tú libro de trabajo. Para cada expresión matemática, dibuja el Círculo de Evaluación, y luego convierte ese Círculo en código de Racket.}}
                        @teacher{}
                        }
                @point{@student{Cuando las expresiones no siguen las reglas de código, el equipo te dirá que encontró un problema. La computadora también te da información para ayudarte a solucionar el problema. Esta información se denomina 
                                @vocab{mensaje de error}. Hablaremos más sobre los mensajes de error más tarde. Por ahora, solo queremos que veas un par de mensajes de error para que sepas lo que son si te encuentras con uno durante la programación.
                       @activity[#:forevidence "BS-IDE&1&2"]{Ingresa cada una de las siguientes expresiones ilegales en el área Interacciones y observa el mensaje de error o comportamiento que le da el equipo.
                                 @itemlist[@item{@code{(5 * 6)} [Pone la función en el medio, en lugar de en la parte delantera.]}
                                           @item{@code{(*5 6)}  [Falta un espacio después de la función]}
                                           @item{@code{* 5 6)}  [Olvida el paréntesis de apertura]}
                                           @item{@code{(* 5 6}  [Olvida el paréntesis de cierre]}
                                          ]}}
                       @teacher{At this point, the goal is simply to have students @italic{see} error messages.  Students are not 
                                expected to be experts at reading error messages this early 
                                (you will drill this later).  NOTE: When a close parenthesis is missing, hitting return will do nothing, 
                                because the computer is waiting for the parenthesis.  When an open parenthesis is missing, WeScheme
                                does nothing and waits for the programmer 
                                to add the parens.  If students hit enter and "nothing happens", they should check their parentheses. 
                                Also note that if you do this sequence of exercises with @code{+} instead of @code{*}, the error 
                                appears differently, because @code{+5} is a perfectly valid number (just like @code{-5}).}
                      }
                ]}


@lesson/studteach[
     #:title "Concluyendo."
     #:duration "5 mins"
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
        @points[@point{@student{¡Has hecho mucho en esta primera unidad!
                                @itemlist[@item{Tú desglosaste un juego para ver cómo funciona.}
					  @item{Diseñaste Tú propio juego, que harás durante este curso}
                                          @item{Tú practicaste usando coordenadas para poner caracteres en una pantalla}
                                          @item{Tú aprendiste sobre el orden de las operaciones, los círculos de evaluación, cómo convertir los círculos de evaluación en programas y cómo ejecutarlos para obtener respuestas.}]
                        En la siguiente unidad, empezaremos a escribir programas para cosas más interesantes que simplemente la aritmética.}
                        @teacher{Make sure student names are on the Game Design page. Take this page, or take photos of it, to prep game images for a later Unit. }}
               ]
         }
}

