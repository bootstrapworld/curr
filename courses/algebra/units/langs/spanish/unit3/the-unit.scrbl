#lang curr/lib

@title{Unidad 3: Introducción a Definiciones}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sqr sqrt expt} "1 ,4 ,44.6") 
                                       (list "String" @code{string-append string-length} " \"hello\" ")                          
                                       (list "Image"  @code{rectangle circle triangle ellipse star scale rotate put-image} "(circle 25 \"solid\" \"red\")"))]{
  @unit-descr{Los estudiantes son introducidos al área de definiciones, y aprenden la sintaxis para definir valores de varios tipos. También se introducen en la sintaxis de definir funciones y crear ejemplos.}
}
@unit-lessons{
@lesson/studteach[
     #:title "Revisión"
     #:duration "5 mins"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "BS-PL.2" "6.NS.5-8" "F-IF.1-3")
     #:materials @itemlist[@item{Lapiceros/lápices para los estudiantes, marcadores de pizarra para profesores}
                            @item{Cartel de clase (Lista de reglas, tabla de lenguaje, calendario del curso)}
                            @item{Tabla de Lenguaje (Vea abajo)}]
     #:preparation @itemlist[@item{OPCIONAL: Reparta la @(new-tab "https://docs.google.com/document/d/1FN2uLBnwdk3N4Ci6-qf1n6z-M8KpToo27wqZmRlS5as/edit?usp=sharing" "Hoja de Actividades de Calentamiento.").}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Hasta ahora, has visto los Círculos de Evaluación, aprendido sobre Contratos y experimentado con múltiples tipos de datos. Asegúrate de recordar qué es cada uno de ellos, y mira hacia atrás en las lecciones anteriores para recordar si es necesario.
                                @activity[#:forevidence (list "BS-PL.2&1&1" "6.NS.5-8&1&2")]{
                                     ¿Puedes pensar en tres funciones que dibujen formas? Ve si puedes escribir tus contratos sin necesidad de mirar hacia atrás en su página de contratos.
                                     ¿Qué tipo de datos está siempre entre comillas?
                                     ¿Cuáles son las coordenadas de la esquina inferior izquierda de la pantalla? ¿Qué pasa con la parte superior derecha?
                                     }
                                }
                        @teacher{Review Circles of Evaluation, paying special attention to @vocab{tipos} and @vocab{contratos}. 
                                            Make sure that students are comfortable hearing - and using - the proper terminology to describe code.}
                        }
                 ]}

       
@lesson/studteach[
     #:title "Definiendo Variables"
     #:duration "10 mins"
     #:overview "Students define names for simple values (Numbers, Strings and Images) and use them in expressions."
     #:learning-objectives @itemlist[]
     #:evidence-statements  @itemlist[@item{Students will be able to define names for Number, String and Image values.}
                                       @item{Students will be able to identify the name, domain, range, and variable name for a function, when presented with a completed Design Recipe.}
                                      @item{Students will be able to explain what happens when the "Run" button is pressed.}]
     #:product-outcomes @itemlist[]
     #:standards (list "BS-PL.3" "BS-IDE")
     #:materials @itemlist[@item{Lapiceros/lápices para los estudiantes, marcadores de pizarra para profesores}
                            @item{Cartel de clase (Lista de reglas, tabla de lenguaje, calendario del curso)}
                            @item{Entorno de edición (WeScheme o DrRacket con el bootstrap-teachpack instalado)}
                            @item{Tabla de Lenguaje (Vea abajo)}]
     #:preparation @itemlist[]
     #:prerequisites (list "Intro to Programming" "Contracts")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Supongamos que queremos hacer una imagen que tenía cincuenta triángulos rojos idénticos y sólidos.
                    ¡Tendrías que escribir @code{(triangle 50 "solid" "red")} cincuenta veces! ¡Para empeorar las cosas, cualquier cambio en esos triángulos tendría que ser repetido para las cincuenta expresiones! Los buenos programadores saben que es mejor invertir su esfuerzo en otras cosas, así que se aseguraron de que los lenguajes de programación tengan una manera de evitar toda esa repetición.
Escriben algo una vez, lo definen como un acceso directo en el idioma y luego usan el acceso directo donde quieran.}
                        @teacher{}}
                 @point{@student{Nombramos valores en nuestro lenguaje mediante las sentencias @vocab{define}. Miremos 
                                                                      @editor-link[#:definitions-text "(define shape1 (triangle 50 \"solid\" \"red\"))\n"
                                                               #:interactions-text ""
                                                               "an example of a definition"]
                               , Que define a @code{shape1} como un triángulo rojo sólido. Al hacer clic en "Run",
                    puedes evaluar @code{shape1} en el área Interacciones y el ordenador le mostrará el triángulo.
                    ¿Qué crees que pasaría si evaluaras @code{shape1} @italic{sin} hacer clic en "Run"?
                               }
                         @teacher{Make sure students see what happens when @code{shape1} is evaluated without first clicking "Run", so they
                                 can read and understand the error. Similarly, have them change the definition and evaluate @code{shape1}
                                 again - still without clicking "Run". It's important for them to understand that running a program
                                 causes the computer to @italic{read the definitions}, and that any change requires it to re-read them.
                                 }
                        }
                 @point{@student{Las definiciones van en el área izquierda de tu editor. Esta es llamada @vocab{área de definiciones}.        
                               @activity[#:forevidence (list "BS-PL.3&1&1")]{
                                     @itemlist[@item{Ingresa la definición @code{shape1} en el @vocab{área de definiciones}.}
                                                @item{Haz clic en "Run" para que la computadora lea esa definición.}
                                                @item{¿Qué crees que sucederá cuando evalúes @code{shape1} en el área de interacción?}
                                                @item{Agrega una nueva línea al área de definiciones, justo abajo de la definición de @code{shape1}.
                                                      Agrega una nueva definición llamada @code{shape2}, y define que sea un círculo azul solido con 20 de radio.}
                                                @item{Haz clic en "Run" e intenta evaluar @code{shape2.}}
                                               @item{En la siguiente línea, define un nuevo valor llamado @code{age} que sea el número de años de edad que tienes.}
                                                @item{En la siguiente línea, define un nuevo valor llamado @code{name} que sea una cadena que represente tu edad.}]
                                      }
                               
                               @bannerline{Cada vez que se hace clic en "Ejecutar", el equipo lee todas las definiciones y las agrega al idioma. Si se cambia una definición, el equipo seguirá utilizando la definición anterior hasta que se haga clic en la próxima vez que se ejecute "Ejecutar".}
                          }
                         @teacher{}
                        }
                 @point{@student{@activity[#:forevidence (list "BS-PL.3&1&1" "BS-IDE&1&2")]{
                                    En una nueva línea del área de Definiciones, define un valor llamado  @code{eye-color} que sea el color de tus ojos.
                                    ¡Todavía no hagas clic en "Run"!  
                                    @itemlist[@item{Ve al área de Interacciones e intenta evaluar @code{eye-color}. Tú deberías obtener un mensaje de error que la computadora no sabe sobre @code{eye-color},
                                                    porque no hiciste clic en "Run" después de agregar la definición.}
                                              @item{Haz clic en "Run".}
                                              @item{Intenta preguntar por @code{eye-color} nuevamente en el área de interacciones. Esta vez ya no deberías obtener el error.}]}
                                  Las definiciones son útiles porque podemos reutilizarlas en otras expresiones. Por ejemplo, podríamos usar @code{eye-color} 
                                 dentro de otra expresión, como @code{(circle 10 "solid" eye-color)}. Práctica usando definiciones dentro de otras expresiones.
                                 }
                        @teacher{}
                        }
                @point{@student{@activity[#:forevidence (list "BS-PL.3&1&1" "BS-IDE&1&1")]{
                                    Cree las siguientes definiciones en el área Definiciones y compruébelas en el área Interacciones:
                                    @itemlist[@item{Define un valor llamado @code{prize} que sea una estrella amarilla solida (tú eliges el tamaño).}
                                              @item{Define un valor llamado @code{big} que utilice @code{scale} para hacer tu @code{prize} tres veces más grande.}
                                              @item{Define un valor llamado @code{tilt} que utilice @code{rotate} para girar tu gran estrella amarilla por @code{45} grados.}
                                              @item{Digita @code{tilt} en el área de Interacciones, y asegurate de obtener una gran estrella amarilla inclinada.}
                                              @item{Parece que las estrellas verdes son mas populares que las amarillas. Cambia tu expresión en tu definición de @code{prize} a verde en lugar de amarilla.
                                              Haz clic en "Run" para que la computadora lea tu nueva definición.}
                                              @item{Ahora digita @code{tilt} de nuevo en el área de Interacciones.
                                              ¿Qué color de estrella obtuviste? Si tú definiste @code{big} y @code{tilt} para utilizar tus definiciones,
                                              ¡Tú deberías obtener una estrella verde inclinada! Si no obtuviste una estrella verde, intenta arreglar tus definiciones para que eso suceda.}
                                             ]
                                   }
                          }
                        @teacher{It is important to give students ample time to experiment with @code{define}.  Students need to understand that they can use 
                                 the defined name in place of the value.  Have them define several values (each of different types), and then practice using 
                                 them inside other expressions.}
                        }
                 ]
}
       
@lesson/studteach[
     #:title "Definiendo Variables (Álgebra)"
     #:duration "10 mins"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "7.EE.3-4" "A-SSE.1-2")
     #:materials @itemlist[@item{"Algebra Translation" [@resource-link[#:path "source-files/Algebra.rkt" #:label "DrRacket"] | @editor-link[#:public-id "s2s0tkTgeF" "WeScheme"]] precargado en las máquinas de los estudiantes, con los monitores apagados.}]
     #:preparation @itemlist[]
     #:prerequisites (list "Defining Variables")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
             @point{@student{En nuestro lenguaje de programación, las variables son definidas así:
                             @bannerline{@code[#:multi-line #t]{(define x 4)
                                                                (define y (+ 4 9))
                                                                (define z (* x 2))}}
                             Los valores pueden ser fijos (como el primer ejemplo), el resultado de una expresión (el segundo), o incluso ser definido en función de otras variables (el tercero).
                             Podemos hacer lo mismo en álgebra:
                             @bannerline{@math{x = 4}
                                          @math{y = 4+9}
                                          @math{z = x \times 2}}
                             }
                     @teacher{}
                     }
              @point{@student{@activity[#:forevidence (list "7.EE.3-4&1&4" "A-SSE.1-2&1&1")]{Convierte las siguientes tres definiciones algebraicas en definiciones Racket:
                                       @itemlist[@item{@math{dollars = 16.50}}
                                                 @item{@math{feet = 2 \times 3}}
                                                  @item{@math{inches = feet \times 12}}]
                                       }}
                      @teacher{For this activity write all Racket expressions on one side of the board, and all algebra expressions on the other.
                              You'll want to line them up as closely as possible, to reinforce the connection between the two languages.}
                     }
            @point{@student{@activity{Ve a la @worksheet-link[#:name "Translating-to-Algebra"] de tu libro. 
                                              Verás muchas definiciones de valores escritas en código - Toma 2 minutos para convertirlas en matemáticas. ¡Vamos!}}
                    @teacher{[@(new-tab "https://www.youtube.com/watch?v=xRUoQO1AdVs" "Video")]}
                    }]
         }
     
@lesson/studteach[
     #:title "Juego de Imágenes"
     #:duration "30 mins"
     #:overview "Students define values in their videogames"
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Los estudiantes nombrarán su proyecto de videojuegos}
                                  @item{Los estudiantes modificarán las definiciones de @code{TITLE, TITLE-COLOR, BACKGROUND, PLAYER, TARGET} y @code{DANGER}}]
     #:standards (list "BS-PL.3")
     #:materials @itemlist[@item{El @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "Libro de Trabajo"] del estudiante, carpetas con nombres en las cubiertas y algo con que escribir.}]
     #:preparation @itemlist[@item{Los estudiantes están registrados en WeScheme.org, o han abierto DrRacket.}
                             @item{Crear archivos de juego de estudiantes. [Vea la guía del maestro, ubicada en los @(new-tab "../../resources/teachers/" "materiales protegidos") para este curso.]}
                              @item{En las máquinas de los alumnos: Archivos de juego del estudiante (generados a partir de la plantilla "Game" [Game.rkt de @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @editor-link[#:public-id "RHBJYscAWj" "WeScheme"]])}]
     #:prerequisites (list "Defining Values" "Strings and Images" "Brainstorming")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@activity{Abre el archivo de videojuego (Game.rkt de @resource-link[#:path "source-files.zip" #:label "source-files.zip"]
                                          o @editor-link[#:public-id "RHBJYscAWj" "the online template"] de tal forma que puedas ver el código,
                     y haz clic en "Run".(¡Podrías tener que esperar unos segundos para que carguen las Imágenes!) ¡El área que aparece es un videojuego ejecutándose,
                     pero probablemente has notado que nada se mueve - incluso si pulsas las teclas "arriba" o "abajo"! por ahora, haz clic en el botón "close" para regresar al código.}
                                 Este archivo contiene una lista de definiciones, donde podrás definir como lucen, se mueven e interactúan tus personajes.
                                 Si bajas hasta el final, verás muchas definiciones que han sido llenadas para ti. ¡Depende de @italic{ti} si creas definiciones para tu propio juego!
                                 }
                        @teacher{}
                        }
                 @point{@student{ @activity{
Desplázate hasta la parte inferior de la pantalla, leyendo cada una de las cosas que tendrás que definir. Detente cuando llegues al fondo, donde veas
                                            @code{(make_game ...)} utilizado como parte de una definición. ¿Qué notas de los valores pasados en @code{make_game}?}
                                  @code{make_game} es una función que se ha proporcionado para ti, que toma todas tus definiciones y las ensambla en un juego corriente. Detrás de las escenas, @code{make_game}
                                  Inserta tus definiciones dentro de una función gigante que se llama cada décimo de segundo, y utiliza tus definiciones para decidir lo que está sucediendo en ese momento.}
                         @teacher{You can remind students that Bootstrap:2 will show them how to write this function, and customize it to create more advanced games (multiplayer, maze, etc).}}
                 @point{@student{En el área de definiciones, verás que este programa define varios valores: @code{TITLE}, por ejemplo, está definido como el String @code{"My Game"}.
                                @activity[#:forevidence (list "BS-PL.3&1&1")]{@itemlist[@item{Si escribes @code{TITLE} en el área de Interacciones, ¿a qué crees que equivaldría?}
                                                                                         @item{¿Qué otras definiciones ves?}
                                                                                         @item{¿Cuáles son sus valores?}
                                                                                         @item{¿Cuáles son sus tipos?}
                                                                                         @item{Intenta evaluar cada uno de esos valores en el área de Interacciones, empezando con @code{BACKGROUND}}]}
                                }
                         @teacher{(By now, you should have students' graphics already created, and 
                                  @resource-link[#:path "teachers/teachers-guide/teachers-guide.html#addingimages" #:label "added to the file"].)
                                  The purpose of this activity is to increase students' confidence in @italic{reading} and @italic{talking about} code. 
                                  Make sure students get a lot of practice speaking aloud, both to each other and to the instructor.}
                        }
                 @point{@student{Si no te gustan las definiciones que se proporcionan aquí, ¡puedes cambiarlas! Puedes modificar el @code{TITLE} y @code{TITLE-COLOR}
                                     Para cambiar lo que se muestra en la parte superior de la pantalla, y también puedes cambiar las definiciones de las imágenes del juego.
                                     (Puedes cargar nuevos archivos de imagen haciendo clic en el botón "Imágenes" de la barra de herramientas y luego seleccionando "subir" en la ventana emergente resultante).}
                         @teacher{Images should be in PNG or GIF format. Background images should be 640x480, and character images should generally be 
                                   no larger than 200px in either dimension. Make sure that the character images have transparent backgrounds! 
                                   TIP: use animated GIFs for the characters - not only does the animation make the game look a lot better, but these 
                                   images usually have transparent backgrounds to begin with. For more instructions on setting up the game files and
                                   images, read the @(new-tab "../../resources/teachers/" "Teacher's Guide") guide for this course.]}
                         }
                 @point{@student{Si deseas cambiar una de tus definiciones para que la imagen sea más pequeña o más grande, puedes utilizar la función @code{scale}:
                                  @code[#:multi-line #t]{; scale : Number Image -> Image}
Esta función redimensiona el @code{Image} basada en el @code{Number}. Por ejemplo, @code{(scale 10 (triangle 5 "solid" "green")} hará que el diminuto triángulo sea diez veces más grande, mientras que @code{(scale 0.5 (rectangle 200 100 "outline" "purple"))} Reducirá el rectángulo a la mitad.}
                                  
                         @teacher{If a student struggles here, you should fall back to the Circles of Evaluation and Contracts. For example: have the student first draw a circle for @code{rotate}, and have them use the Contract to figure out what the inputs are. When they get to the second input (the @code{image}), ask them what kind of shape they want to rotate. Whatever their answer is, have them look it up in their contracts page, and draw a Circle of Evaluation @italic{inside} the one they drew for @code{rotate}. Once the Circle of Evaluation is correct, have them convert it to code. Once they are confident, you can challenge them to apply another operation to the whole expression, perhaps flipping the rotated shape vertically.}
                         }
                 @point{@student{@activity{Práctica el uso de @code{scale} para agrandar y encoger imágenes diferentes. Si deseas experimentar con más funciones, prueba a utilizar los contratos siguientes:
                                                           @code[#:multi-line #t]{; flip-vertical : Image -> Image
                                                                                  ; flip-horizontal : Image -> Image
                                                                                  ; rotate : Number Image -> Image}
                                                              @editor-link[#:interactions-text "(scale 3 (star 50 \"solid\" \"red\"))"
                                                                           "Práctica jugando con este ejemplo"]
                                                           }}
                         @teacher{}
                        }
                 @point{@student{Otra definición en este programa es @code{SCREENSHOT}. Esta expresión usa la función @code{put-image} para superponer una imagen sobre otra, usando coordenadas para decidir dónde colocar cada imagen.
                          @activity{Los anuncios de videojuegos suelen tener imágenes estáticas (llamadas @italic{screenshots}) del juego en acción, para que la gente sepa como es jugarlo. Cambia las coordenadas usadas en la definición de @code{SCREENSHOT} para que tengas una imagen de tu juego. (Recuerda: ¡la pantalla tiene 640 píxeles de ancho, por 480 píxeles de alto!)}}
                         @teacher{This can be a useful opportunity to review coordinates, especially for students who need the practice.}
                        }
                 @point{@student{Ser capaz de definir valores en un lenguaje de programación es una poderosa herramienta que permite a los programadores simplificar su código y hacerlo más legible y mantenible.}
                         @teacher{}
                         }
             ]
         }
       
@lesson/studteach[
     #:title "Definiendo Funciones"
     #:duration "20 mins"
     #:overview "Students are get a taste of the Design Recipe, but primarily they're introduced to the syntax for function definition."
     #:learning-objectives @itemlist[@item{Students will be able to define very simple functions, given a simple word problem.}]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[@item{Los estudiantes definirán al menos dos funciones, usando la receta de diseño}]

     #:exercises (list (make-exercise-locator "Defining-Functions" "match-examples-functions1")
                       (make-exercise-locator "Defining-Functions" "create-contracts-examples1")
                       (make-exercise-locator "Defining-Functions" "create-contracts-examples2"))
     #:standards (list "F-IF.1-3" "F-IF.4-6" "F-BF.1-2" "BS-PL.3" "BS-DR.1" "BS-DR.2" "BS-DR.3")
@;     #:materials @itemlist[@item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbook"] folders with names on covers.}]
     #:preparation @itemlist[]
     #:prerequisites (list "Contracts" "Stings and Images" )
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
                 ]{
                   @points[@point{@student{Definir un @vocab{valor} es útil cuando un programa tiene muchas expresiones idénticas. A veces, sin embargo, un programa tiene expresiones que no son idénticas, pero son simplemente @italic{muy similares}. Un programa que tiene cincuenta triángulos sólidos y verdes puede simplificarse definiendo un valor único, @italic{siempre que todos tengan el mismo tamaño}. Pero ¿qué pasa si un programa tiene cincuenta triángulos verdes de diferentes tamaños?}
                                   @teacher{[@(new-tab "https://www.youtube.com/watch?v=ZWdLNtPu6PQ" "Video")]}
                                   }
                            @point{@student{Piensa en las funciones de imagen que ya has utilizado,
Como @code{star} y @code{circle}. Toman insumos y producen
Imágenes. De manera similar, podríamos desear una función de triángulo verde que
tome el tamaño como una entrada y produzca un triángulo verde.
El lenguaje de programación no proporciona esta función,
Pero sí te permite definir tus propias funciones. Queremos definir
Nuestra propia función (llamémosla @code{gt}, para el triángulo verde) que
tome un número y produzca un triángulo verde sólido de cualquier tamaño que deseemos.

                                           @itemlist[@item{@code{(gt 10)} sería un atajo para @code{(triangle 10 "solid" "green")}}
                                                     @item{@code{(gt 20)} sería un atajo para @code{(triangle 20 "solid" "green")}}
                                                     @item{@code{(gt 1980)} sería un atajo para @code{(triangle 1980 "solid" "green")}}
                                                     @item{@code{(gt 98)} sería un atajo para @code{(triangle 98 "solid" "green")}}
                                                     @item{y así...}]
                                            }
                                    @teacher{To make this more concrete, have a student "act" as gt. To call the function, another student says "gt ten!" 
                                             (calling out both the name of the function and the input). The actor responds "triangle ten solid green", 
                                             to signify the work that the function does when it receives an input.}
                                    }
                            @point{@student{Los problemas que requieren una definición de función se pueden expresar como un problema de palabra como el siguiente:
                                             @bannerline{Definir una función @code{gt}, que tome un número y produzca un triángulo verde sólido del tamaño dado.}
                                             Afortunadamente, podemos seguir pasos específicos para definir funciones a partir de problemas de palabras. Trabajemos los pasos para
                                             definir @code{gt}.

                                            }
                                    @teacher{}}
                            @point{@student{@bannerline{Paso 1: Escribir el contrato}
                                             El primer paso para definir una función es escribir tu @vocab{contrato}. Los contratos resumen tres piezas de información esencial sobre una función:
                                              @itemlist[@item{El @vocab{nombre} de la función: en este caso, el nombre se da, como @code{gt}}
                                                         @item{El @vocab{dominio} de una función, que es los tipos de datos que espera la función: en este caso, sólo un único número.}
                                                         @item{El @vocab{rango} de esta función, que es el tipo de datos que produce la función: en este caso una Imagen ya que produce triángulos verdes sólidos}]
                                              Aquí está el contrato @code{gt} escrito como código. La línea comienza con un punto y coma seguido del nombre, dos puntos, el dominio, una flecha y, a continuación, el intervalo:
                                              @code[#:multi-line ""]{; gt : Number -> Image}
                                             }
                                    @teacher{It is often a good idea to give students examples of different word problems, and have them pick out the 
                                             contract for each one. @(new-paragraph) Contracts are written as @italic{comments} in Racket: whenever Racket 
                                             sees a semicolon, it ignores the rest of the line after the semicolon.  This means that you will never get an 
                                             error message from Racket for a malformed comment.  That also means that you have to check your students' 
                                             contracts more closely, because the computer will not check anything about them (format or contents).}
                                    }
                            @point{@student{Los problemas de palabras dan varias pistas en cuanto al nombre, dominio y rango de una función. ¡Asegúrate de leer el problema con cuidado! Algunos problemas de palabras describirán funciones que toman múltiples entradas en su dominio, o entradas de diferentes tipos.
                                             @activity[#:forevidence (list "BS-DR.1&1&1")]{
                                                              Abre tu libro en @worksheet-link[#:name "Fast-Functions"], donde dice "Funciones rápidas" y escribe el Contrato para la función @code{gt}.}}
                                    @teacher{}
                                   }
                            @point{@student{@bannerline{Paso 2: Dar ejemplos}
                                              Siempre es buena idea pensar algunos ejemplos antes de definir la función. Los ejemplos muestran el atajo que una función está intentando proporcionar. Este lenguaje de programación proporciona un constructor, llamado @code{EXAMPLE}, que le ayuda a anotar cómo se utiliza la función y lo que debe calcular. Puedes ver dos ejemplos de este tipo aquí, escrito bajo el contrato:
                                             @code[#:multi-line ""]{; gt : Number -> Image
                                                                    (EXAMPLE (gt   50) (triangle   50 "solid" "green"))
                                                                    (EXAMPLE (gt  100) (triangle  100 "solid" "green"))}
                                             Estos ejemplos le dicen a la computadora que escribir @code{(gt 50)} debería producir el mismo resultado que @code{(triangle 50 "solid" "green")}, y que @code{(gt 100)} es equivalente a
                                              @code{(triangle 100 "solid" "green")}. El ejercicio de aplicación especifica que los ejemplos @italic{deben} usar el nombre 'gt', y todos deben producir triángulos verdes sólidos.
                                             @activity[#:forevidence (list "BS-PL.3&1&2" "BS-DR.2&1&1" "F-BF.1-2&1&1" "F-IF.1-3&1&2" "F-IF.1-3&1&4")]{
                                                       En tu libro, escribe dos ejemplos propios para esta función.}}
                                    @teacher{@bold{Be sure to point out that EXAMPLE is capitalized, and that all examples are written in the definitions area.} Many students will follow along here without really understanding, simply by pattern-matching. Be sure to ask them lots of questions, to have them justify each step:
                                             @itemlist[@item{Why does the example have to start with gt? (Because it's the Name of the function, specified in the contract)}
                                                        @item{How do we know @code{gt} requires only one number? (Because it's the Domain of the function, specified in the contract)}
                                                        @item{How do we know to use @code{triangle}? (Because the word problem tells us what shape it has to produce)}
                                                        @item{How do we know the triangle has to be solid and green? (Because the word problem tells us what shape it has to produce)}
                                                        @item{How do we know the correct order for the inputs to @code{triangle}? (The contract for @code{triangle} tells us)}] 

                               One of the big ideas here is that each step informs the subsequent step. Make sure to explicitly connect them for students, pointing out that the Contract gives strong hints about how to write each part of the examples.}
                                    }
                            @point{@student{Los programadores a menudo escriben varios ejemplos para cada función. Ejemplos como éstos son una manera para que un programador piense a través de su trabajo. Los ejemplos también hacen que sea fácil ver qué partes de la expresión pueden cambiar, o @italic{variar}, dependiendo de las entradas.
@activity[#:forevidence (list "BS-DR.2&1&3" "F-IF.1-3&1&2" "F-IF.1-3&1&4" "F-IF.4-6&1&1")]{Escribe los siguientes ejemplos en Papel y rodea las partes de los ejemplos que son diferentes:
@code[#:multi-line ""]{(EXAMPLE (gt   50) (triangle   50 "solid" "green"))
(EXAMPLE (gt  100) (triangle  100 "solid" "green"))}} 
Una vez que sepas qué partes de la expresión cambian, etiqueta los círculos con un nombre que describa su contenido.
Por ejemplo, en nuestros dos ejemplos @code{gt}, hemos rodeado el @italic{size} del triángulo. Las expresiones marcadas y etiquetadas deben tener el siguiente diagrama:
 
                                    @bannerline{@bitmap{images/circled-examples.png}}}
                                    @teacher{Pay close attention to what students circle: they should circle something in each part of the Example 
                                             (the function use on the left and the expression on the right); they should also use the same name for 
                                             the same concept across the expressions.  Their circles will correspond to the variables in their functions, 
                                             so the variables should appear in both the left and the right sides of the Example.}
                                    }
                            @point{@student{@bannerline{Paso 3: Definir la función}
                                              Después de escribir el Contrato, dos Ejemplos y los círculos etiquetados, definir la función en sí es relativamente simple.
                                              @itemlist[@item{Copia todo lo que permanece igual (todo lo que no estaba en un círculo) en una de tus líneas EJEMPLO (en papel o en tu editor)}
                                                        @item{En lugar de cada círculo, escribe la etiqueta que le dio a ese círculo}
                                                        @item{Cambia @code{EJEMPLO} a @code{define}}]
                                             @code[#:multi-line ""]{; gt : Number -> Image
(EXAMPLE (gt   50) (triangle   50 "solid" "green"))
(EXAMPLE (gt  100) (triangle  100 "solid" "green"))
(define  (gt size) (triangle size "solid" "green"))}}
                                    @teacher{This can be a good opportunity to point out that the parts of the examples that were changeable 
                                             (or @italic{vary-able}) are what determines when we need to use the @italic{variable}.}
                                    }
                            @point{@student{@activity[#:forevidence (list "BS-PL.3&1&3" "BS-DR.3&1&1" "F-IF.1-3&1&2")]{
                                               @itemlist[@item{En tu papel, define la función @code{gt}, luego escribe el @vocab{contrato}, @vocab{ejemplos}
                                                                Y @code{denificion} en el área de Definiciones.}
                                                          @item{Haz clic en "Run", para que el equipo lea esta definición.}
                                                          @item{Utiliza la función que has definido, tecleando @code{(gt 100)} en el área de Interacciones.}
                                                          @item{Prueba a utilizar la función con diferentes números}]}
                                    @editor-link[#:definitions-text "; gt : Number -> Image
(EXAMPLE (gt 50) (triangle 50 \"solid\" \"green\"))
(EXAMPLE (gt 95) (triangle 95 \"solid\" \"green\"))
(define (gt size) (triangle size \"solid\" \"green\"))"
                                                 "Tu respuesta debe ser algo como esto."]
                                    }
                                    @teacher{}
                                    }
                            @point{@student{Estos pasos son conocidos como @vocab{receta de diseño}, que es una poderosa herramienta para definir funciones basadas en problemas de palabras.
                                            @bannerline{Práctica: escribe una función @code{bc}, que toma un número y produce un círculo azul sólido del tamaño dado.}
                                            @activity[#:forevidence (list "BS-DR.1&1&1" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1" "F-IF.1-3&1&2" "F-IF.1-3&1&4" "F-IF.4-6&1&1")]{
                                                      En tu libro (Todavía en @worksheet-link[#:name "Fast-Functions"]), rellena el @vocab{contrato}
                                                      Para esta función.
                                                      @itemlist[@item{¿Cuál es el nombre de la función?}
                                                                 @item{¿Cuál es el dominio de la función?}
                                                                 @item{¿Cuál es el rango de la función?}]
                                                      Utilizando el Contrato que has escrito, escribe dos @vocab{ejemplos} para la función.
                                                      @itemlist[@item{¿Qué parte del contrato te ayuda a llenar el lado izquierdo de un ejemplo?}
                                                                 @item{¿Qué parte del contrato te indica lo que la función necesita como entrada?}
                                                                 @item{¿Cómo puede el rango de una función ayudarte a escribir el ejemplo?}]
                                                      Mirando esos dos ejemplos, circula las partes que son @italic{change-able}, y luego etiqueta con un buen @vocab{nombre de variable}.
                                                      @itemlist[@item{¿Es el nombre de la variable que elegiste igual que el que elegiste para @code{gt}? ¿Por qué o por qué no?}
                                                                 @item{¿Por qué es útil elegir un nombre de variable antes de definir la función?}]
                                                      Ahora escribe @vocab{definición de función}, usando los Ejemplos que has escrito.}
                                            }
                                    @teacher{You will want to explicitly connect each step in the Design Recipe to every other step. Ask students to justify 
                                             each part of their @bold{Contract} by referring back to the Word Problem, to justify each step of their 
                                             @bold{Examples} by referring back to the Word Problem @italic{and} Contract, and finally to justify each 
                                             step of the @bold{definition} by referring to the Examples. The same variable name can be used in multiple
                                             functions, just as in math (where many functions use @code{x} as the variable name, for example)}
                                    }
                            @point{@student{Pensando en el ejercicio de aplicación paso a paso, llegamos a:
                                             @code[#:multi-line ""]{; bc : Number -> Image
(EXAMPLE (bc     16) (circle     16 "solid" "blue"))
(EXAMPLE (bc    421) (circle    421 "solid" "blue"))
(define  (bc radius) (circle radius "solid" "blue"))}
                                            }
                                    @teacher{}
                                    }
                             @point{@student{@bannerline{Práctica: Escriba una función @code{dot}, que tome un color y produzca un círculo sólido del color dado, con un radio de 15.}
                                            @activity[#:forevidence (list  "BS-DR.1&1&1" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1" "F-IF.1-3&1&2" "F-IF.1-3&1&4" "F-IF.4-6&1&1")]{
                                                    En tu libro (Todavía en @worksheet-link[#:name "Fast-Functions"]), llena el @vocab{contrato} para esta función.
                                                      @itemlist[@item{¿Cuál es el nombre de la función?}
                                                                 @item{¿Cuál es el dominio de la función?}
                                                                 @item{¿Cuál es el rango de la función?}]
                                                      Utilizando el Contrato que has escrito, escribe dos @vocab{ejemplos} para la función, luego circula y etiqueta las variables.
                                                      @itemlist[@item{¿Qué parte del contrato te ayuda a llenar el lado izquierdo de un ejemplo?}
                                                                 @item{¿Qué parte del contrato te indica lo que la función necesita como entrada?}
                                                                 @item{¿Cómo puede el rango de una función ayudarte a escribir el ejemplo?}
                                                                 @item{Cuál es un buen nombre de variable para el cambio entre estos ejemplos.}]
                                                      Ahora escribe la @vocab{definición de función}, usando los ejemplos que has escrito.}
                                            }
                                    @teacher{}
                                    }
                             @point{
                                    @student{Pensando en el ejercicio de aplicación paso a paso, llegamos a: @code[#:multi-line ""]{; dot : String -> Image
                                                                    (EXAMPLE (dot  "red") (circle 15 "solid"  "red"))
                                                                    (EXAMPLE (dot "blue") (circle 15 "solid" "blue"))
                                                                    (define  (dot  color) (circle 15 "solid"  color))}}
                                     @teacher{}}]
                    }


@lesson/studteach[
     #:title "Definiendo Funciones (Álgebra)"
     #:duration "20 mins"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "A-SSE.1-2" "F-IF.1-3" "F-IF.4-6")
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:prerequisites (list "Defining Functions" "Defining Variables (Algebra)")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{@points[@point{@student{Has visto muchas funciones definidas en Racket, por ejemplo:
                                @code{(define (f x) (+ x 1))}
                        @activity[#:forevidence (list  "F-IF.1-3&1&2" "F-IF.1-3&1&4" "F-IF.4-6&1&1")]{@itemlist[@item{¿Cuál es el nombre de esta función?}
                                             @item{¿Cuántas variables toma?}
                                              @item{¿Cuál es el nombre de la (s) variable (s)?}
                                              @item{¿Qué hace esta función a la variable @code{x}?}
                                              @item{Define una función @code{g}, que tome una variable @code{q} y la multiplique por 20.}]}}
                        @teacher{Make sure students understand that the function is named @italic{f}, and not "fx" or "f of x". Have students practice other function definitions, to make sure they're comfortable translating a verbal description into Racket syntax.}
                        }
                 @point{@student{Para traducir estas funciones en álgebra, hacemos algo similar a lo que hicimos con los valores. Esta es la misma función @code{f}, escrita en la sintaxis de álgebra: @math{f(x) = x + 1} @activity{Traduce la función @code{g} en álgebra, usando la traducción de @code{f} como modelo. Una vez que se haya completado, intenta definir una función @math{h}, que toma una variable @code{x} y la divida entre 2.}}
                         @teacher{Have students practice this translation with a few other functions, again translating from a verbal description (rather than Racket syntax).}}
                 @point{@student{@activity{Traduce el resto de las funciones, listadas en @worksheet-link[#:name "Translating-to-Algebra"] de tu libro.}}
                         @teacher{}
                         }]
         }
                 
                 
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
        @points[@point{@student{En esta unidad, aprendiste a nombrar valores y definir funciones. Utilizar valores con nombre para proporcionar imágenes para los elementos del juego. Utilizar funciones para hacer que sus elementos de juego se muevan. Como pronto verás, las funciones son críticas para hacer juegos. Harás un poco más de práctica con ellos en la próxima unidad, incluyendo la escritura de tu primera función que hará que algo se mueva a través de la pantalla.}
                        @teacher{@itemlist[@item{Have students volunteer what they learned in this lesson}
                                            @item{Reward behaviors that you value: teamwork, note-taking, engagement, etc}
                                            @item{Pass out exit slips, dismiss, clean up.}]}
                        }
                        ]}
}

