#lang curr/lib

@title{Unidad 6: Enseñando Funciones para Comparar}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sqr sqrt expt} "1 ,4 ,44.6") 
                                       (list "String" @code{string-append string-length} " \"hello\" ")                          
                                       (list "Image" @code{rectangle circle triangle ellipse star scale rotate put-image} "(circle 25 \"solid\" \"red\")"))]{
@unit-descr{ Los estudiantes descubren tipos booleanos y los usan para crear programas que prueban valores y luego modelan escenarios usando estos programas.}
}

@unit-lessons{
@lesson/studteach[
     #:title "Revisión"
     #:duration "15 mins"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[@item{
Lapiceros/lápices para los estudiantes, marcadores de pizarra para profesores}
                            @item{Cartel de clase (Lista de reglas, tabla de lenguaje, calendario del curso)}
                            @item{Tabla de Lenguaje (Vea abajo)}]
     #:preparation @itemlist[@item{OPCIONAL: Reparta la @(hyperlink "https://docs.google.com/document/d/1WvlflsKM28IOwgyV2HttnGxul3sAUnL0-KOZhvb6C2s/edit?usp=sharing" "Hoja de Actividades de Calentamiento").}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{¿Qué tipos de datos has visto hasta ahora? ¿Puedes pensar en valores @code{numéricos}? ¿Valores de @code{cadena}? ¿Valores de @code{Imagen}?
                               ¿Cuáles son algunas expresiones que equivalen a un @code{Número}? ¿Qué hay de otros tipos de datos?}
                       @teacher{Before introducing a new datatype (Booleans), this would be a good time to quickly review the three major 
                                contexts students have learned for working with expressions: Circles of Evaluation, Contracts and Design Recipe.
                                In this lesson, students will apply each one of them to Booleans, discovering that everything they've already 
                                learn still applies - even in the new type.}}]}

@lesson/studteach[
     #:title "Booleanos"
     #:duration "10 mins"
     #:overview "Students are introduced to a new type (Boolean), and practice using it with Circles of Evaluation, Contracts and Code."
     #:learning-objectives @itemlist[@item{Students learn about Boolean values and functions that manipulate them}]
     #:evidence-statements @itemlist[@item{Students will know the two Boolean values (true and false)}
                                     @item{Students will write Circles of Evaluation for Boolean-producing functions}
                                     @item{Students learn how to use arithmetic operators (like @code{<} and @code{>}) that produce Booleans}
                                    ]
     #:product-outcomes @itemlist[]
     #:exercises (list (make-exercise-locator/file "Booleans" "enough-cash-design-recipe-assess" "Do You Have Enough Cash?")
                       (make-exercise-locator/file "Booleans" "long-name-design-recipe-assess" "Is This Name Long?")
                       (make-exercise-locator/file "Booleans" "equal-length-design-recipe-assess" "Do Strings Have the Same Size?")
                       (make-exercise-locator/file "Booleans" "enough-carpet-design-recipe-assess" "Do You Have Enough Carpet?")
		       )
     #:standards (list "7.EE.3-4" "BS-IDE" "BS-PL.1" "BS-PL.2")
     #:materials @itemlist[@item{
Lapiceros/lápices para los estudiantes, marcadores de pizarra para profesores}
                            @item{Cartel de clase (Lista de reglas, tabla de lenguaje, calendario del curso)}
                            @item{Tabla de Lenguaje (Vea abajo)}]
     #:preparation @itemlist[@item{Los estudiantes están registrados en WeScheme.org, o han abierto DrRacket.}]
     #:prerequisites (list "Intro to Programming" "Contracts")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@activity[#:forevidence (list "BS-IDE&1&1")]{¿A que @vocab{equivale} cada una de las siguientes expresiones? (¡Si no estás seguro, puedes digitarlas y probar!)
                              @itemlist[@item{@code{(+ 1 4)}}
                                         @item{@code{(/ 4 2)}}
                                         @item{@code{(circle 10 "solid" "blue")}}
                                         @item{@code{(< 3 4)}}]}}
                        @teacher{[@(hyperlink "https://www.youtube.com/watch?v=OMQO66wWqjk" "Video")]}
                        }
                 @point{@student{La última expresión, @code{(< 3 4)},
                                                      usa una nueva expresión que @italic{compara números}, retornando
                                                      @code{true} si 3 es menor que 4. ¿Qué crees que retornaría si los números se invirtieran?
                                                      @activity[#:forevidence (list "BS-IDE&1&1")]{
                                                                                                   La función @code{<} evalúa si un número es menor que otro. ¿Puedes pensar en alguna otra prueba? 
                                                                                                                Pruébalas en la ventana de interacciones.} }
                         @teacher{Give students plenty of practice here! You can see a video demonstration of this intro at @(hyperlink "https://www.youtube.com/watch?v=OMQO66wWqjk" "Video Lesson: Intro to Booleans")}
                         }
                 @point{@student{Funciones cómo @code{<}, @code{>} y @code{=}, todas utilizan 2 números cómo su dominio, y producen un valor especial llamado @vocab{Booleano} cómo su rango.
                    Los Booleanos son respuestas a preguntas de Si o No, y las funciones booleanas son utilizadas para realizar pruebas.
                         En un videojuego, deberías probar si un jugador ha caminado sobre una pared, o si su salud es igual a cero. Una máquina de oficina de doctor podría utilizar booleanos para probar si el ritmo cardíaco de un paciente está arriba o abajo de cierto nivel.
                                                @bannerline{Los valores booleanos solo pueden ser @code{true} o @code{false} (verdadero o falso).}}
                         @teacher{}
                         }
                 @point{@student{@activity[#:forevidence (list "BS-IDE&1&1" "BS-PL.1&1&1")]{Intenta digitar un número dentro de la ventana de interacciones y presiona Enter.
                                                                                            ¿Qué esperas obtener de resultado? ¿Qué tal un String? Ahora intenta un booleano, cómo @code{false}.  
                                    Cómo con todos los valores, los Booleanos equivalen a sí mismos. Los círculos de Evaluación también pueden utilizarse con Booleanos: intenta convertir cada una de las siguientes expresiones matemáticas en círculos de evaluación y luego convertir esos círculos en código:
                                    @itemlist[@item{@math{10 = 16.1}}
                                               @item{@math{-13 \gt 5}}
                                               @item{@math{40-1 \lt 90*2}}
                                               @item{@math{0 = -5 + 10}}]}}
                         @teacher{}
                         }
                 @point{@student{Existen otras funciones que producen booleanos. Aquí hay una que puede utilizarse para comparar dos @vocab{cadenas}: @code[#:multi-line #t]{(string=? "manzanas" "naranjas")}
                    Comparar strings es útil si quieres estar seguro que la contraseña que alguien digita es la contraseña correcta.
                    Se vuelve útil si quieres saber si el usuario presionó la tecla @code{"arriba"} o @code{"abajo"}. ¿Para qué más podría un programador querer comparar dos strings?
                                 @activity[#:forevidence (list "BS-PL.2&1&1" "BS-PL.2&1&3")]{Asegúrate que has escrito el @vocab{Contrato} completo para todas las funciones booleanas.}}
                         @teacher{Make sure students are comfortable using Booleans to compare more complex subexpressions, rather than just comparing two Numbers.}
                         }
                 ]}
                 
@lesson/studteach[
     #:title "onscreen? 1.0"
     #:duration "25 mins"
     #:overview "Students use the Design Recipe to write a simple, Boolean-producing function"
     #:learning-objectives @itemlist[@item{Students use Booleans to determine whether a game element is partly visible onscreen}
                                     @item{Students write functions that use other functions they have written to compute answers}
                                    ]
     #:evidence-statements @itemlist[@item{Students can write functions that consume a single-axis coordinate and determine whether it is within the boundary of a fixed screen size}
                                     @item{Students can use one function they have written to compute the answer for another function}
]
     #:product-outcomes @itemlist[]
     #:standards (list "BS-DR.2" "BS-DR.3" "F-IF.1-3" "F-IF.4-6" "7.EE.3-4" "8.F.1-3")
     #:materials @itemlist[@item{
Lapiceros/lápices para los estudiantes, marcadores de pizarra para profesores}
                            @item{El @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "Libro de trabajo") del estudiante}
                            @item{Cartel de clase (Lista de reglas, tabla de lenguaje, calendario del curso)}
                            @item{Tabla de Lenguaje (Vea abajo)}]
     #:preparation @itemlist[@item{"Cage" [Cage.rkt de @(resource-link #:path "source-files.zip" #:label "source-files.zip") | @(hyperlink "https://www.wescheme.org/openEditor?publicId=bM6VNiLdkv" "WeScheme")] precargado en las máquinas de los estudiantes.}]
     #:prerequisites (list "Booleans" "The Design Recipe")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{Many students struggle with the idea that "false" means "wrong". When students write EXAMPLEs for these functions, they will often avoid using "unsafe" coordinates, because they don't want to have an expression be "wrong". Remind them that these functions @bold{should} return false sometimes!}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Abre el programa "Cage" (Cage.rkt que se encuentra en @(resource-link #:path "source-files.zip" #:label "source-files.zip") o en @editor-link[#:public-id "bM6VNiLdkv" "WeScheme"]) en tu computadora y haz clic en "Run". La ventana emergente contiene una mariposa, la cual puedes mover usando las teclas direccionales en tu teclado. Esta mariposa se llama Sam, y la ventana es el patio de Sam. Así cómo la pantalla del videojuego, ¡este patio es de 640 pixeles de ancho por 480 pixeles de alto! cómo puedes ver, Sam es libre de caminar sobre el patio, y las coordenadas en el borde superior de la pantalla se actualizan para decirte su ubicación.}
                        @teacher{This may be a good opportunity to review coordinates, for students who need the practice.}
                        }
                 @point{@student{@bitmap{images/buffer.png}La madre de Sam le dice que está bien que salga del patio, ¡pero sólo a corta distancia! Específicamente, quiere asegurarse de que siempre puede ver al menos un pedacito de él. Sam está a salvo  @italic{siempre y cuando una parte de él esté en la pantalla}. Eso significa que puede ir un poco más allá de cero en el tamaño de la izquierda, o un poco más allá de 640 a la derecha - pero ¿hasta dónde @italic{puede} ir?  
                        }
                         @teacher{Pay close attention to the corner-cases: is Sam on the screen at 690? What about 680?}
                         }
                 @point{@student{@activity[#:forevidence (list "7.EE.3-4&1&5" "A-CED.1-4&1&1")]{Ve a la @worksheet-link[#:name "Protecting-Sam"] de tu libro y lee la mitad superior de la página. Usando las teclas de flecha, ve hasta qué punto Sam puede ir a la izquierda @italic{mientras permanece en la pantalla}. Encontrarás que Sam está en pantalla siempre y cuando su coordenada x sea @italic{mayor que} -50, que es exactamente el código que se rellena para el primer problema de la página.
                                                                                                        @itemlist[@item{Descubre hasta qué punto Sam puede ir a la izquierda mientras permanece en la pantalla.}
                                                                                                                   @item{Busca el segundo error en el código.}
                                                                                                                   @item{Convierte ambas expresiones en círculos de evaluación, usando los círculos vacíos al final de la página.}]}
                                  }
                         @teacher{}
                        }
                 @point{@student{Desafortunadamente, ¡por ahora no hay algo que evite que Sam se salga del patio! Observando al código para este programa, encontramos tres definiciones de funciones:
                                  @itemlist[@item{@code{safe-left?}, la cual toma la coordenada x- de Sam y verifica si Sam está seguro en el lado izquierdo de la pantalla. Por ahora, esta función siempre retorna @code{true}.}
                                             @item{@code{safe-right?}, la cual toma la coordenada x- de Sam y verifica si Sam está seguro en el lado derecho de la pantalla. Por ahora, esta función siempre retorna @code{true}.}
                                             @item{@code{onscreen?}, la cual toma la coordenada x- de Sam y verifica si al menos una pequeña parte de Sam se encuentra en la pantalla. Por ahora, esta función @italic{le pregunta a @code{safe-left?} si la coordenada x- es segura.}}]
                                  Por ahora, las tres funciones retornan @code{true} sin importar las coordenadas x- de Sam.}
                         @teacher{It's extremely valuable at this point to have three students stand, and act out each of these three functions:
                                  @itemlist[@item{Ask each student to tell you their Name, Domain and Range. If they get stuck, remind them that all of this information is written in their Contract!}
                                             @item{Practice calling each function, by saying their name and then giving them an x-coordinate. For example, "safe-left? fifty" means that the number @code{50} is being passed into @code{safe-left?}. That student should return "true", since the code currently returns @code{true} for all values of x.}
                                             @item{Do this for all three functions, and have the class practice calling them with different values as well.}
                                             @item{Note: the volunteer for @code{onscreen?} should first call @code{safe-left?}, before replying with the value.}]}
                         }
                 @point{@student{Por ahora @code{safe-left?} está ignorando la coordenada x- de Sam, y ciegamente retorna @code{true} sin importar donde se encuentre. 
                                           ¿Qué debería hacer la función en lugar de eso? 
                                           @activity[#:forevidence (list "BS-DR.1&1&1" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1" "8.F.1-3&1&1" "F-IF.1-3&1&1")]{
                                                 Ve a la @worksheet-link[#:name "safe-left"] de tu libro. Usa las instrucciones de diseño para arreglar la función de tal manera que @code{safe-left?} tome la coordenada x- de Sam y retorne @code{true} o @code{false} 
                                                 dependiendo de dónde si se encuentra sea @italic{mayor que -50}.}
                                           Una vez hayas digitado los Ejemplos y definición de @code{safe-left?}, haz clic en "Run" y observa si se evita que Sam pueda volar afuera por el lado izquierdo de la pantalla. Asegúrate de probar tu función en la ventana de interacciones,
                                           por ejemplo:
                                  @code[#:multi-line #t]{(safe-left? 50)
                                                         (safe-left? -100)
                                                         (onscreen? 50)
                                                         (onscreen? -100)}
                                  }
                         @teacher{Remind students that they've already written the check for this on page 19! 
                                  It may be helpful to have students complete this activity in parts, by giving them a short time
                                  to do the Contract and Purpose Statement, then a short time to write their first example, their second, etc. 
                                  By debriefing and reviewing after each step, you are likely to uncover misunderstandings earlier in the process.
                                 Have the three volunteers from earlier stand again, and act out the code now that @code{safe-left?} is written properly. As before, make sure students practice calling each function individually: now @code{safe-left?} will be able to return true and false (as will @code{onscreen?}), while @code{safe-right?} still returns only @code{true}.}
                         }
                 @point{@student{@activity[#:forevidence (list "7.EE.3-4&1&1" "7.EE.3-4&1&3" "7.EE.3-4&1&4" "7.EE.3-4&1&5" "7.EE.3-4&1&10" "F-IF.4-6&1&1")]{
                                     Ve a la @worksheet-link[#:name "safe-right"] de tu libro. Usa las instrucciones de diseño para arreglar la función de tal manera que @code{safe-right?} tome la coordenada x- de Sam y retorne @code{true} o @code{false} 
                                     dependiendo de dónde si se encuentra sea @italic{menor que 690}.}
                                  }
                         @teacher{After walking through @code{safe-right?} section by section, students should be able to complete this activity on their own. 
                                  If students are doing well with programming, you might discuss whether to compare the x-coordinate to @code{690} or 
                                  @code{(+ 640 50); both yield the same computation, but the second reveals where 690 comes from (screen width plus 50).}
                                  }
                         }
                 @point{@student{Una vez hayas digitado los Ejemplos y definición de @code{safe-right?}, haz clic en "Run" y observa si se evita que Sam pueda volar afuera por el lado derecho de la pantalla. ¡Te sorprenderás de lo que sucede! Prueba tu función en la ventana de Interacciones:
                                  @code[#:multi-line #t]{(safe-right? 50)
                                                         (safe-right? 810)
                                                         (onscreen? 50)
                                                         (onscreen? 810)}
                         ¿@code{safe-right?} está funcionando de la forma que esperabas? ¿@code{onscreen?} está funcionando de la forma que esperabas?
                         La función @code{onscreen?} únicamente está hablando con  @code{safe-left?}, lo que significa que Sam está protegido únicamente por el lado izquierdo de la pantalla. 
                          @activity{Cambia el código para @code{onscreen?} de tal manera que llame a @code{safe-right?} en su lugar. 
                                  Ahora Sam estará protegido por el lado derecho de la pantalla pero no por el izquierdo. ¿Qué debería hacer @code{onscreen?} ?}}
                         @teacher{Have the three actors stand again, and repeat the activity. Now @code{safe-left?} and @code{safe-right?} behave correctly, but @code{onscreen?} is still @bold{only talking to @code{safe-left}!}}
                         }
                 ]}
                 

@lesson/studteach[
     #:title "And/Or"
     #:duration "10 mins"
     #:overview "Students are introduced to and/or, two functions that consume Booleans"
     #:learning-objectives @itemlist[@item{Students learn to combine Boolean values with @code{and} and @code{or}}]
     #:evidence-statements @itemlist[@item{Students understand when to use each of @code{and} and @code{or}}
                                     @item{Students can write Circles of Evaluation for expressions that use @code{and} and @code{or}}
                                     @item{Students can write code expressions that use @code{and} and @code{or}}
                                     @item{Students can determine the answers produced by expressions that use @code{and} and @code{or}}]
     #:product-outcomes @itemlist[]
     #:exercises (list (make-exercise-locator "AndOr" "boolean-coe-to-code1")
                       (make-exercise-locator "AndOr" "boolean-coe-to-code2"))
     #:standards (list)
     #:materials @itemlist[@item{
Lapiceros/lápices para los estudiantes, marcadores de pizarra para profesores}
                            @item{Cartel de clase (Lista de reglas, tabla de lenguaje, calendario del curso)}
                            @item{Tabla de Lenguaje (Vea abajo)}]
     #:preparation @itemlist[]
     #:prerequisites (list "Booleans" "Contracts")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{Many students struggle with the idea that "false" means "wrong". When students write EXAMPLEs for these functions, they will often avoid using "unsafe" coordinates, because they don't want to have an expression be "wrong". Remind them that these functions @bold{should} return false sometimes!}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
       @points[@point{@student{Ya has aprendido algunas funciones que te permiten crear booleanos. Las funciones @code{<} y @code{>}, por ejemplo, retornarán un booleano cuando se utilice una entrada apropiada. ¿Qué sucede cuando tú quieres @italic{combinar} esas pruebas, para ver si más de una cosa es verdadera?
                                @activity{Considera las siguientes afirmaciones - ¿son falsas o verdaderas?:
                                           @itemlist[@item{El azúcar es dulce}
                                                      @item{El hielo es caliente}
                                                      @item{El azúcar es dulce @bold{y} el hielo es helado}
                                                      @item{El azúcar es dulce @bold{y} el hielo es caliente}
                                                      @item{El azúcar es dulce @bold{o} el hielo es helado}
                                                      @item{El azúcar es dulce @bold{o} el hielo es caliente}]}
                                }
                       @teacher{Challenge students on their answers here - ask them to explain why they choose "true" or "false" for the compound statements, especially if the individual statements are a mix of true and false.}
                       }
                @point{@student{@code{and} y @code{or} son dos funciones nuevas.
                                 @bannerline{@code{and} Retornará "true" solo si @italic{ambas entradas} son verdaderas. @code{or} Retornara "true" si @italic{al menos una} entrada es verdadera.}
                                 @code[#:multi-line #t]{
; and: Boolean Boolean -> Boolean
; Retorna true si AMBAS entradas son verdaderas
                                      
; or: Boolean Boolean -> Boolean  
; Retorna true si CUALQUIER entrada es verdadera}
                                 @activity{Completa @worksheet-link[#:name "AND-and-OR"] en tu libro.}}
                        @teacher{}
                        }]
        }                                                                                             

@lesson/studteach[
     #:title "onscreen? 2.0"
     #:duration "25 mins"
     #:overview "Students use the Design Recipe alongside their newfound knowledge of and/or, to write a function that performs two boolean tests."
     #:learning-objectives @itemlist[@item{Students will be able to compose Boolean functions results using @code{and} and @code{or}}
                                     @item{Students will understand how Booleans and Boolean functions are used to control the behavior of game elements}
                                     @item{Students will begin to appreciate why programs are written as compositions of several smaller functions}]
     #:evidence-statements @itemlist[@item{Students will be able to write functions that combine screen-boundary tests using @code{and} and @code{or}}
                                     @item{Students will understand why @code{and} is necessary to check for two boundaries}
                                     @item{Students will be able to explain why re-using existing functions is better than reproducing their computations}
                                     @item{Students will understand how they use Booleans and conditional to control how game elements behave at the screen boundaries}
]
     #:product-outcomes @itemlist[@item{Los estudiantes detectan cuando los elementos del juego se han desplazado fuera de la pantalla (para que puedan volver a aparecer en el otro borde de la pantalla)}]
     #:exercises (list (make-exercise-locator/file "Onscreen2" "offscreen-design-recipe-assess" "Is a Character OffScreen?"))
     #:standards (list "A-CED.1-4" "F-IF.4-6" "A-SSE.1-2" "BS-DR.2")
     #:materials @itemlist[@item{
Lapiceros/lápices para los estudiantes, marcadores de pizarra para profesores}
                            @item{El @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "Libro de trabajo") del estudiante}
                            @item{Cartel de clase (Lista de reglas, tabla de lenguaje, calendario del curso)}
                            @item{Tabla de Lenguaje (Vea abajo)}]
     #:preparation @itemlist[]
     #:prerequisites (list "onscreen? 1.0" "and/or")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
       @points[@point{@student{Ahora que sabes cómo combinar pruebas, ¿cómo @code{onscreen?} puede combinar ambas pruebas para mantener a Sam en la pantalla?
                               @activity[#:forevidence (list "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1" "F-IF.4-6&1&3" "A-SSE.1-2&1&4" "A-CED.1-4&1&1")]{
                                    Ve a la @worksheet-link[#:name "onscreen"] en tu libro y escribe la función completa de @code{onscreen?},
                               de tal forma que evalue @code{safe-left?} y @code{safe-right?}. ¡Digita los ejemplos y definiciones cuando hayas terminado, haz clic en "Run", y observa si Sam está protegido por ambos lados!}
                               }
                       @teacher{Have the volunteers stand once again, and ask the class what @code{onscreen?} @italic{should} do. Should it be using @code{and} or @code{or}? Be sure to give specific examples of points that are onscreen, too far to the left and too far to the right, and challenge the students to justify their answers.}
                       }
                @point{@student{Existen dos formas para resolver el problema @code{onscreen?}:
                                @code[#:multi-line #t]{(define (onscreen? x)
                                                         (and (> x -50) (< x 690)))}
                                y...
                                @code[#:multi-line #t]{(define (onscreen? x)
                                                         (and (safe-left? x) (safe-right? x)))}
                                ¿Tiene importancia cual de los dos utilices?}
                       @teacher{}
                       }
                @point{@student{
                   Se necesita más para ser un escritor que tener buena ortografía y gramática. Se necesita más para que ser un arquitecto o un artista que construir un puente o colorear un lienzo.
                   Todas esas disciplinas involucran un elemento de @italic{design}.
                   Igualmente, Se necesita más para ser un programador que solo escribir código. Te has vuelto decente en escribir código,
                   y ahora tú estás apto para escribir programas sofisticados que incluyan múltiples funciones - ¡Felicidades!
                   Pero eso también significa que estás listo para considerar lo que significa @italic{diseñar} el código que escribas.}
                       @teacher{}
                       }
                @point{@student{Supón que tú acabas de construir un carro, pero aún no funciona. ¿Qué harías? Idealmente, te gustaría probar cada parte del carro
                                (motor, transmisión, etc.) @italic{una por una}, para ver cual parte esta arruinada.
                                ¡Lo mismo sucede con codificar! Si tienes un error, es mucho más fácil buscar cuando cada función es simple y fácil de evaluar,  
                   y las únicas funciones complejas están compuestas por funciones simples. En este ejemplo, puedes probar tus funciones @code{safe-left?} y @code{safe-right?}            
                   de forma independiente, antes de unirlas en @code{onscreen?}.}
                       @teacher{}
                       }
                @point{@student{Otra razón para definir múltiples funciones simples es el hecho que les permite a los programadores ser perezosos.
                                Supón que tienes algunos personajes en un videojuego, y todos deben permanecer en la pantalla.
                                Algunos podrían necesitar únicamente @code{safe-left?}, otros podrían necesitar solo @code{safe-right?}, y solo algunos pocos podrían necesitar @code{onscreen?}.
                                ¿Qué sucede si repentinamente el juego necesita ejecutarse en computadoras con diferente tamaño de monitores, donde el límite sea 100 en lugar de 690?
                                Si tienes funciones simples y complejas dispersas en tu código, necesitaras cambiarlas todas.
                                Si tus funciones complejas solo utilizan funciones simples, ¡solo necesitaras cambiarlas en un lugar!}
                       @teacher{}
                       }
                @point{@student{Los programas mal diseñados pueden funcionar bien, pero son difíciles de leer, difíciles de probar y fáciles de arruinar si cambian las cosas. A medida que crezcas y te desarrolles cómo programador, tendrás que pensar más allá de "hacer el trabajo de código". No es lo suficientemente bueno si sólo funciona - los artistas, también deben preocuparse de si está @italic{bien diseñado} o no. ¡Esto es lo que las funciones nos permiten hacer! Desde los programadores hasta los matemáticos utilizas las funciones para convertir los problemas complejos en piezas más simples, que hacen posible diseñar soluciones elegantes a los problemas difíciles.
                                @activity{¿Puedes enumerar tres razones por las que es bueno tener varias funciones simples, en lugar de una sola compleja?}}
                       @teacher{}
                       }
                @point{@student{

El código de detección de límites que escribiste (a través de @code{safe-left?} Y @code{safe-right?}) Es muy útil para videojuegos. Se puede utilizar para detener a un personaje de viajar a través de una pared, o para regenerar el carácter una vez que ha dejado la pantalla. @activity{Abre el archivo de juego y desplázate hacia abajo después de las funciones @code{update-} hasta que veas las definiciones de @code{safe-left?}, @code{safe-right?} y @code{onscreen?} . En este momento, todos ellos retornan "true". Puesto que su pantalla de juego tiene las mismas dimensiones que el patio de Sam (640x480), puedes utilizar el mismo código para cada una de estas tres funciones. Asegúrate de incluir EJEMPLOS, para que el código del juego pueda probar cada función por separado.}}
                       @teacher{}
                       }
                ]}
                  

@lesson/studteach[
     #:title "Concluyendo"
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
        @points[
           @point{@student{
Has aprendido cómo utilizar Booleanos para restringir a donde se pueden mover los elementos en el juego. En la siguiente unidad, discutiremos cómo utilizar booleanos para mover elementos de juego basado en cuales teclas presionan los usuarios mientras juegan.}
                  @teacher{}}]}
}