#lang curr/lib

@title{Unidad 4: La Receta de Diseño}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sqr sqrt expt} "1 ,4 ,44.6") 
                                       (list "String" @code{string-append string-length} " \"hello\" ")                          
                                       (list "Image" @code{rectangle circle triangle ellipse star scale rotate put-image} "(circle 25 \"solid\" \"red\")"))]{
@unit-descr{Los estudiantes continúan practicando la Receta de Diseño aplicándolas a problemas simples.}
 }
@unit-lessons{
@lesson/studteach[
     #:title "La Receta de Diseño"
     #:duration "25 mins"
     #:overview "Students are formally introduced to the steps of the Design Recipe."
     #:learning-objectives @itemlist[@item{Students practice using Contracts to create examples of functions}
                                     @item{Students learn to abstract over examples to create functions}]
     #:evidence-statements @itemlist[@item{Given a definition, students will be able to identify the Name, Type and Value that is defined.}
                                     @item{Given a contract and purpose statement for a simple, one-variable function, students will be able to write two Examples}
                                      @item{Given two examples for a simple function, students will be able to identify the variable}
                                      @item{Given two examples for a simple function, students will be able to write the definition}]
     #:product-outcomes @itemlist[@item{Los estudiantes usarán la receta del diseño para definir una función, que se utiliza para hacer una mosca del cohete.}]
     #:standards (list "A-SSE.1-2" "F-IF.1-3" "F-IF.4-6" "BS-DR.1" "BS-DR.2" "BS-DR.3" "8.F.1-3")
     #:materials @itemlist[@item{Lapiceros/lápices para los estudiantes, marcadores de pizarra para profesores}
                            @item{Cartel de clase (Lista de reglas, tabla de lenguaje, calendario del curso)}
                            @item{Tabla de Lenguaje (Vea abajo)}
                            @item{El @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "Libro de Trabajo"] del estudiante, carpetas con nombres en las cubiertas y algo con que escribir.}]
     #:preparation @itemlist[@item{Agenda para escribir disponible.}
                              @item{Mostrar carteles de la clase, Tabla de Lenguaje, receta de diseño.}
                              @item{Entorno de edición (WeScheme o DrRacket con el bootstrap-teachpack instalado).}
                              @item{"Rocket" [Rocket.rkt de @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/openEditor?publicId=EHgrsZlYNX" "WeScheme")] precargado en las máquinas de los estudiantes.}
                              @item{Disposición de asientos: idealmente grupos de escritorios/mesas}
                              @item{OPCIONAL: Reparta la @(hyperlink "https://docs.google.com/document/d/134VD2NShK_VxDog4VG4lMm4jTbpxm2H2cSXqZbHwwSg/edit?usp=sharing" "Hoja de Actividades de Calentamiento").}]
     #:prerequisites (list "Defining Functions")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{Watch out for students confusing the rocket's height and time - many students will assume that the @code{rocket-height} function produces the time the rocket has been flying, rather than how high it is.}]}
                @pacing[#:type "challenge"]{@itemlist[@item{Can students make the rocket fly faster?}
                                                       @item{Can students make the rocket sink, instead of fly?}
                                                       @item{Can students make the rocket fly faster over time?}]}
                )
      ]{
        @points[ @point{@student{Las funciones son una parte clave de la animación en los programas informáticos. Una función que dibuja una imagen estática de un gato,
                                 por ejemplo, puede colocar el gato en una ubicación diferente en función de la entrada. Cuando esa entrada cambia ligeramente
                                 basada en el tiempo o la interacción del usuario, el gato parecerá moverse. Esto es similar a la forma en que la animación flip-book
                                 funciona, en la que cada página dibuja una imagen estática que ha cambiado por una pequeña cantidad. Cuando las páginas
                                 se muestran rápidamente, las imágenes parecen cambiar 
                                 @bannerline{@bitmap{images/flipbookSlides.png}}
                                 }
                        @teacher{Review the importance of definitions for students (defining values helps cut down on redundancy 
                                             and makes future changes easier, defining functions allows for simplicity and testability. 
                                             Be sure to use vocabulary regularly and carefully, pushing students to use the proper terms 
                                             throughout.)
                                  }
                        }
                 @point{@student{@animated-gif{images/flipbook.gif}Juntando estas imágenes, llegamos a una animación del cohete que sube por la pantalla.
                                   Vamos a ver un ejemplo de este tipo de animación, utilizando una función para hacer un lanzamiento de cohetes, Ve a la 
                                  @worksheet-link[#:name "rocket-height"] de tu libro, y lee el problema de palabras cuidadosamente.
                         }
                         @teacher{Check student understanding carefully, to make sure students read the problem carefully. It may be helpful to draw a diagram or table showing the change of rocket position on the board, and to have students verbally walk through a few examples.}
                         }
                 @point{@student{@bannerline{Un cohete se lanza, viajando a 7 metros por segundo. Escribe una función llamada @code{rocket-height} que toma el
                                      número de segundos que han pasado desde que el cohete despegó, y que produce la altura del cohete en ese momento.}
                         @activity[#:forevidence (list "BS-M&1&1" "BS-DR.1&1&1" "F-IF.1-3&1&1" "F-IF.4-6&1&1")]{
                                    @itemlist[@item{¿Qué toma como entrada la función @code{rocket-height} ?¿Qué tipo de dato es?}
                                              @item{¿Qué produce como salida la función? ¿Qué tipo de dato es?}
                                              @item{¿Cuáles son las tres partes de un @vocab{Contrato}?}
                                              @item{¿Cuál es el  @vocab{Nombre} de la función que se te pide definir?}
                                              @item{¿Cuál es el @vocab{Dominio} de la función?}
                                              @item{¿Cuál es el @vocab{Rango} de la función?}]}}
                         @teacher{}
                        }
                 @point{@student{El Contrato es una manera de pensar sobre la función de una manera general, sin tener que preocuparse por exactamente cómo funcionará o cómo se utilizará. Comenzar con preguntas sencillas como estas hará que los pasos posteriores sean mucho más fáciles de pensar. Sin embargo, ¡el contrato no siempre tiene suficiente información! El dominio de @code{star}, por ejemplo, especifica que la función necesita un número y dos cadenas, pero no menciona el hecho de que la primera cadena debe ser @code{"solid"} o @code{"outline"}. Para agregar esta información, los programadores escriben @vocab{declaración de propósito}, que son oraciones simples que explican lo que hace una función.
                                 @activity[#:forevidence (list "BS-DR.1&1&2" "F-IF.1-3&1&5")]{Debajo del Contrato, escribe la siguiente Declaración de Propósito para @code{rocket-height}.}
                                 @code[#:multi-line #t]{; rocket-height : Number -> Number
                                                        ; Multiplica el número de segundos por 7 para encontrar la altura}}
                         @teacher{This is an opportunity to talk about the importance of writing, clarity, and brevity. What information is essential for a purpose statement? What information is irrelevant?  A good purpose statement describes what is computed and how its inputs are used; it should go beyond the information given in the contract and implicit in the name of the function.}
                         }
                 @point{@student{Construyendo la Declaración de contrato y propósito, se hace fácil escribir un @code{EXAMPLE}. Cada ejemplo comienza con el nombre de la función y una entrada de muestra, ambas de las cuales están escritas en el Contrato. En este caso, tú sabes que la función se llama @code{rocket-height} y que espera un solo número como entrada. La declaración de propósito va más allá, diciéndote que la entrada se multiplica por 7. Podemos usar esto para escribir dos ejemplos, con diferentes números de segundos como entradas.
                                @code[#:multi-line #t]{; rocket-height : Number -> Number
                                                       ; Multiplica el número de segundos por 7 para encontrar la altura
                                                       (EXAMPLE (rocket-height 11) 
                                                                (* 11 7))
                                                       (EXAMPLE (rocket-height 72) 
                                                                (* 72 7))}
                                @bold{Nota:} ¡El ejemplo mostrado arriba se divide en dos líneas! A medida que las funciones y los ejemplos se vuelven más complejos, será difícil comprimirlos en una sola línea. En los libros, cada ejemplo y definición a partir de este punto utilizará el formato de dos líneas.
                                }
                         @teacher{The main idea for students in this activity is to realize that the Contract and Purpose Statement can be relied upon to write examples. Ask students to justify  every part of each example, using only the Contract and Purpose Statement.  Students are often tripped up by the switch from one-line examples to two-line ones. Be @italic{very} careful to point this out to students, and to check their workbooks to see where they are writing their examples. At the end of the activity, make sure that students circle ONLY what has changed.})
                 }
                 @point{@student{@activity[#:forevidence (list "BS-DR.2&1&1" "8.F.1-3&1&3" "F-IF.1-3&1&4")]{En tu libro, escribe dos nuevos ejemplos de @code{rocket-height} usando diferentes valores para el número de segundos. Ambos ejemplos tendrán mucho en común (todos usan @code{rocket-height} como el nombre de la función, todos ellos multiplican su entrada por 7, etc.). Una vez que haya terminado de escribirlos, encierre en un círculo solamente las partes de los ejemplos que sean @italic{changeable}.}}
                         @teacher{}
                        }
                 @point{@student{Al comparar dos ejemplos diferentes, es fácil decir qué cambia. De acuerdo con la Declaración de Propósito, es el número de segundos que el cohete ha estado volando.
                                 @activity[#:forevidence (list "BS-DR.2&1&3" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2" "7.EE.3-4&1&4")]{En tu papel, etiqueta con "segundos" los elementos que rodeaste.}}
                         @teacher{Have a discussion with students about why "seconds" is a better name than "time". Talk about specificity, relevance, and readability.}}
                 @point{@student{Etiquetar lo que es @italic{cambiable} da a los programadores un sentido para los nombres de las @vocab{variables} de una función. Las variables son como marcadores de posición para valores que pueden ser diferentes en diferentes momentos. Una función que calcula cuánto pagas por mensajes de texto cada mes, por ejemplo, puede tener una variable para el número de mensajes que enviaste en ese mes. El número de mensajes enviados puede cambiar de mes a mes, pero cada uno puede costar 20 centavos.  
                                                  @activity[#:forevidence (list "BS-DR.3&1&1" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2")]{¿Cuántas variables tiene @code{rocket-height}? ¿Cuál es el nombre de cada variable? Define la función, utilizando toda la información de tus Ejemplos, Contrato y Propósito.}
                                  
                                  }
                         @teacher{As with the Examples, ask students to justify each part of the definition. In this case, the function name can be derived from the Contract, and the variable name and function body from the Examples.}}
                 @point{@student{@code[#:multi-line #t]{; rocket-height : Number -> Number
                                                       ; Multiplica el número de segundos por 7 para encontrar la altura
                                                       (EXAMPLE (rocket-height 11) 
                                                                (* 11 7))
                                                       (EXAMPLE (rocket-height 72) 
                                                                (* 72 7))
                                                       (define (rocket-height seconds)
                                                                (* seconds 7))}}
                         @teacher{}
                        }
                 @point{@student{La Receta de Diseño permite al programador enfocarse en un paso del problema a la vez y usar los pasos anteriores para completar el siguiente.
                                 @activity{@itemlist[@item{¿Qué dice el @vocab{Contrato} a un programador acerca de una función?}
                                                       @item{¿Qué dice la @vocab{Declaración de Propósito} a un programador acerca de una función?}
                                                       @item{¿Cómo el Contrato y la Declaración de Propósito ayudan a un programador a escribir @vocab{Ejemplos}?}
                                                       @item{¿Por qué es útil circundar y etiquetar las partes de los ejemplos que cambian?}
                                                       @item{¿Cómo todos estos pasos ayudan a un programador a definir una función?}]}
                                 }
                         @teacher{}
                         }
                 @point{@student{Puedes haber notado que los ejemplos para @code{rocket-height} mostraron la multiplicación como @code{(* 11 7)},
                                  en lugar de la respuesta real (@code{77}). ¿Por qué molestarse en mostrar la forma en que se realiza un cálculo? Al hacer esto,
                                  los ejemplos pueden proporcionar indicios sobre qué proceso está teniendo lugar. En el código proporcionado (Rocket.rkt de
                                 @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | o @editor-link[#:public-id "EHgrsZlYNX" "online file"]),
                                 Verás por qué es tan importante mostrar tu trabajo al escribir ejemplos.
                                 @activity{Haz clic en "Run", y espera hasta que aparezca una ventana con un cohete en la parte inferior de la pantalla y los números de "tiempo" y "altura" en la parte superior. Esta animación está configurada para actualizar el cohete cada vez que se presiona la barra de espacio, para simular el paso del tiempo. Pulsa la barra espaciadora varias veces y observa que aumenta el tiempo en la parte superior de la ventana. ¿Se mueve el cohete? ¡El tiempo está pasando, pero la altura de nuestro cohete no ha cambiado! Cierra la ventana del cohete, para que puedas ver el código.}}
                         @teacher{}
                         }
                 @point{@student{El contrato para esta función es correcto: el nombre, el dominio y el rango de la función se escriben aquí con precisión. Sin embargo, el siguiente paso definitivamente tiene algunos problemas:
                                  @itemlist[#:style 'ordered
                                                    @item{Sólo hay un ejemplo. Esto hace que sea difícil darse cuenta de lo que está cambiando, lo que podría conducir a errores al identificar variables}
                                                     @item{El ejemplo no muestra cómo se calcula la altura, sino que este programador acaba de escribir la "respuesta", sin mostrar su trabajo.}]
                                  }
                         @teacher{}
                         }
                         
                 @point{@student{Al omitir estos pasos en los ejemplos, puede ser fácil cometer errores al definir la función. 
                                 @activity[#:forevidence (list "BS-DR.2&1&3" "8.F.1-3&1&3")]{¿Puedes ver el error que cometió el programador?}
                                 Sin ver múltiples ejemplos, este programador no se dio cuenta de que la altura del cohete debe calcularse para @italic{cada entrada}. En su lugar, sólo producen el mismo número cada vez (en este caso, cero). Como resultado, el cohete está siempre a cero, no importa cuántos segundos hayan pasado. 
                                 @activity{@itemlist[@item{Corrige el ejemplo de este programador para mostrar su trabajo.}
                                                       @item{Escribe un segundo Ejemplo, debajo del primero.}
                                                       @item{Corrige la definición de la función, de modo que multiplique el número de segundos por 7.}
                                                       @item{¡Haz clic en "Run", y luego usa la barra espaciadora para hacer que el cohete vuele!}]}
                                 }
                         @teacher{}
                         }
        ]}

       
@lesson/studteach[
     #:title "Practicando la Receta de Diseño"
     #:duration "40 minutos"
     #:overview "Students use the Design Recipe to define simple functions (of one and two variables), given various word problems"
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[@item{Given a contract and purpose statement for a simple function, students will be able to write two Examples.}
                                      @item{Given two examples for a simple function, students will be able to identify the variable}
                                      @item{Given two examples for a simple function, students will be able to write the definition}]
     #:product-outcomes @itemlist[@item{Los estudiantes escribirán funciones para resolver problemas sencillos usando la receta de diseño.}]
     #:exercises (list (make-exercise-locator "Practicing-the-Design-Recipe" "examples-same-contracts1")
                       (make-exercise-locator "Practicing-the-Design-Recipe" "examples-same-contracts2")
                       (make-exercise-locator "Practicing-the-Design-Recipe" "match-contracts-examples1")
                       (make-exercise-locator "Practicing-the-Design-Recipe" "match-contracts-examples2")
                       (make-exercise-locator/file "Practicing-the-Design-Recipe" "calc-pencils-assess-recipe" "Calculating Needed Pencils")
                       (make-exercise-locator/file "Check this Design Recipe: Practicing-the-Design-Recipe" "check-total-design-recipe-assess" "Totalling a Bill")
                       (make-exercise-locator/file "Check this Design Recipe: Practicing-the-Design-Recipe" "circle-area-design-recipe-assess" "Check this Design Recipe: Computing the Area of a Circle"))
     #:standards (list "A-SSE.1-2" "F-IF.1-3" "F-IF.4-6" "BS-DR.1" "BS-DR.2" "BS-DR.3")
     #:materials @itemlist[@item{Lapiceros/lápices para los estudiantes, marcadores de pizarra para profesores}
                            @item{Cartel de clase (Lista de reglas, tabla de lenguaje, calendario del curso)}
                            @item{}
                            @item{El @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "Libro de Trabajo"] del estudiante, carpetas con nombres en las cubiertas y algo con que escribir.}]
     #:preparation @itemlist[@item{Agenda para escribir disponible.}
                              @item{Mostrar carteles de la clase, Tabla de Lenguaje, receta de diseño.}
                              @item{Disposición de asientos: idealmente grupos de escritorios/mesas}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{This is the first time they've seen abstraction over image functions, and students are likely to think that @code{red-square} needs to take in other arguments, such as "solid" and "red".}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}
                                                       @item{}
                                                       @item{}]}
                )
      ]{
        @points[@point{@student{Las instrucciones del diseño son una hoja de ruta para definir las funciones, que los programadores utilizan para asegurarse de que el código que escriben hace lo que quieren que haga. Cada paso se basa en el último, por lo que cualquier error se puede detectar a principios del proceso. Esta hoja de ruta tiene una serie de pasos:
                                @itemlist[@item{Pasar de un problema de palabra a un contrato}
                                            @item{Escribir ejemplos basados en el contrato}
                                            @item{Definir una función que coincida con los ejemplos}]
                         Comienza por practicar cada uno de estos pasos, uno a la vez.
                        }
                        @teacher{}
                        }
                 @point{@student{@activity[#:forevidence (list "BS-DR.1&1&1" "F-IF.1-3&1&1" "F-IF.4-6&1&3" "A-SSE.1-2&1&1")]{
                                  Para cada uno de los siguientes problemas de palabra, anota el Contrato:
                                  @itemlist[@item{Define una función 'purple-star', que tome el tamaño de la estrella y produzca una estrella púrpura del tamaño dado.}
                                              @item{Define una función 'spot', que tome un color y produzca un círculo sólido de radio 50, relleno con ese color}
                                              @item{Para encontrar el promedio de dos números, deben ser agregados y divididos por dos. Definir una función 'average', que tome dos números y produzca su promedio}
                                              @item{Un logotipo de la compañía es una palabra dibujada en letras grandes, rojas, girada un cierto número de grados. Definir una función 'logo', que lleve un nombre de empresa y una rotación, y produzca un logotipo para esa empresa}]
                                  Asegúrate de incluir un buen @vocab{nombre} para cada función, y recuerda que @vocab{Dominio} y @vocab{Rango} sólo pueden incluir @vocab{tipos} como Numbers, Images, Strings, etc.}}
                         @teacher{[@(hyperlink "https://www.youtube.com/watch?v=SL2zLs2P-mU" "Video")] If students come up with different Domains or Ranges for their functions, have them explain their thinking for each one. These conversations are an important part of this step!}
                        }
                 @point{@student{Un contrato es la base de una función, que proporciona a los programadores la información suficiente para usarlos: el nombre de la función, los tipos de datos que espera y el tipo de datos que devuelve.
                                 @activity[#:forevidence (list "BS-DR.2&1&1" "8.F.1-3&1&3" "F-IF.1-3&1&4")]{
                                          Ahora que has completado los Contratos para los cuatro problemas de palabras, trata de generar dos Ejemplos para cada uno.}}
                         @teacher{Challenge students to defend their Examples (their function name, the number of inputs, their types and the type of the returned value). Make sure that the two Examples for each function have @italic{different input values}! For each of these questions, students must be able to point to the specific part of their Contract as the justification for their Example.}}
                 @point{@student{Una vez que tengas dos o más ejemplos, debe ser fácil identificar lo que ha cambiado entre ellos. De hecho, el número de cosas que cambian debe coincidir con el número de cosas en el dominio de la función: si el dominio tiene un número y una cadena en él, entonces esos dos valores deben ser las cosas que difieren entre los ejemplos.
                                 @activity[#:forevidence (list "BS-DR.2&1&3" "BS-DR.2&1&3" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2" "7.EE.3-4&1&4")]{
                                       Identificar lo que ha cambiado entre estos ejemplos, y utilizar esta información para definir las cuatro funciones.}}
                         @teacher{Make sure students have chosen good variable names for their function definitions, and ask students to justify every part of the function body. The only acceptable answers should be "I copied this because it's the same in both Examples", or "I used a variable name because it differs between Examples."}}
                @point{@student{@activity[#:forevidence (list "BS-DR.3&1&1" "F-IF.1-3&1&1" "F-IF.4-6&1&3" "A-SSE.1-2&1&1")]{
                                       Ve a la @worksheet-link[#:name "red-square"] En su libro de trabajo, y lee el problema de palabra cuidadosamente.
                                          @itemlist[@item{Encierra el @vocab{nombre} de la función, y subraya lo que toma y lo que produce.}
                                                        @item{Escribe el @vocab{Contrato} para esta función, utilizando lo que subrayaste para ayudarte a encontrar el @vocab{Dominio} y @vocab{Rango}.}
                                                        @item{Debajo del Contrato, escribe la @vocab{Declaración de Propósito} resumiendo lo que hace la función en una sola oración}]}
                                }
                        @teacher{Challenge students to explain why this function does not need to know the color of the square, or whether or not it is solid. They main idea here is that the function already "knows" these things, so the only thing that is changing is the size of the square.
                                 Note that there are actually two easy solutions here: using the @code{square} function, or using @code{rectangle} with the same variable for width and height.}
                        }
                 @point{@student{Recuerda que la Declaración de contrato y propósito se puede utilizar para escribir los ejemplos, incluso si un programador no está seguro de cómo comenzar.
                                 @activity[#:forevidence (list "BS-DR.1&1&1" "BS-DR.2&1&1" "8.F.1-3&1&3" "F-IF.1-3&1&4")]{
                                           Utilizando solo la Declaración de contrato y propósito, ve si puedes contestar las siguientes preguntas:
                                           @itemlist[@item{Cada ejemplo comienza con el nombre de la función. ¿Dónde puedes encontrar el nombre de la función?}
                                                       @item{Cada ejemplo tiene que incluir entradas de muestra. ¿Dónde podrías encontrar cuántos insumos necesita esta función, y qué tipos son?}
                                                       @item{Cada ejemplo tiene que incluir una expresión para lo que la función debe @italic{hacer} cuando se le da una entrada. ¿Dónde puedes buscar para saber qué hace esta función?}
                                                       @item{Escribe dos Ejemplos en tu papel, luego marca y etiqueta lo que está cambiando entre ellos.}]}}
                        @teacher{Make sure students realize that every answer can be found in the Contract or Purpose Statement. Suggestion: write these steps on the board, and draw arrows between them to highlight the process. The goal here is to get students into the habit of asking themselves these questions each time they write Examples, and then using their own work from the previous step to find the answers. NOTE: students can solve this using either @code{square} or @code{rectangle}. The latter requires them to use the same variable twice, which is a useful thought-exercise.}
                        }
                 @point{@student{Una vez que se escriben los dos Ejemplos y se etiquetan las variables (o variables), se hace fácil definir la función. 
                                 @activity[#:forevidence (list "BS-DR.3&1&1" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2" "7.EE.3-4&1&4")]{
                                           Usando el Contrato, la Declaración de Propósito y los Ejemplos, ve si puedes contestar las siguientes preguntas:
                                           @itemlist[@item{Cada definición de función comienza con el nombre. ¿Dónde escribiste esto?}
                                                     @item{Cada definición tiene que incluir nombres de variables para las entradas. ¿Dónde escribiste esto?}
                                                     @item{Toda definición debe funcionar exactamente como lo hicieron los Ejemplos. ¿Dónde puedes mirar para averiguar que debe @italic{hacer} la función?}
                                                     @item{Escribe la definición de función en tu papel.}]}}
                        @teacher{}
                        }
                 @point{@student{Cuando digitas en una definición de función, asegúrate de digitar las tres partes, El Contrato y Declaración de Propósito, los Ejemplos y la Definición.
                                 Cuando haces clic en "Run", la computadora leerá la definición, evaluará tus ejemplos para asegurarse que funciona correctamente y entonces agregará la definición  a tu lenguaje.
                                 Una vez agregado, puedes usar la función como si hubiera sido construida dentro de la computadora.
                                 @activity[#:forevidence (list "BS-IDE&1&1")]{
                                             @editor-link[#:definitions-text "; red-square : Number -> Image
; Dibuja un cuadrado rojo sólido usando el tamaño dado
(EXAMPLE (red-square 42) (square 42 \"solid\" \"red\"))
(EXAMPLE (red-square 73) (square 73 \"solid\" \"red\"))
(define (red-square size) (square size \"solid\" \"red\"))"
                                                          "Prueba la función usando varias entradas."]
                                             }
                                 }
                        @teacher{}
                        }
                 @point{@student{Algunas funciones toman más de una entrada. La función @code{red-square} siempre hace cuadrados rojos sólidos, siendo el tamaño lo único que varía. Supongamos, sin embargo, que queríamos que la función hiciera cuadrados rojos que pudieran ser sólidos @italic{o} solo el contorno. Esto significa que tanto el tamaño como el estilo pueden variar, por lo que un usuario puede escribir @code{(red-square 50 "solid")} o @code{(red-square 50 "outline")}
                                 @activity[#:forevidence (list "BS-DR.1&1&1" "F-IF.1-3&1&1" "F-IF.4-6&1&3" "A-SSE.1-2&1&1")]{
                                           @itemlist[@item{¿Cómo cambiaría el dominio de la función?}
                                                       @item{¿Cómo cambiarían los ejemplos?}
                                                       @item{¿Cómo cambiaría la definición?}]
                                             Cambie cada parte del código que escribió, para permitir que @code{red-square} acepte "solid" o "outline" como segundo argumento.}}
                        @teacher{}
                        }
                 @point{@student{La Receta de Diseño se puede utilizar para las funciones que toman cualquier número de entradas. Como un ejemplo simple, tome el siguiente problema de palabra:
                                 @activity[#:forevidence (list "8.F.1-3&1&3" "F-IF.1-3&1&4" "BS-DR.3&1&1" "A-SSE.1-2&1&1" "A-SSE.1-2&1&2" "7.EE.3-4&1&4")]{
                                           Ve a la @worksheet-link[#:name "lawn-area"] en el libro y lee la palabra problema cuidadosamente.
                                                   @itemlist[@item{Rodea el @vocab{Nombre} de la función, y subraya lo que toma y lo que produce.}
                                                              @item{¿Cuántas cosas toma esta función como entrada? ¿Son números? ¿Instrumentos de cuerda? ¿Imágenes?}
                                                              @item{Escribe el @vocab{Contrato} para esta función, utilizando lo que subrayaste para ayudarte a encontrar el @vocab{Dominio} y @vocab{Rango}.}
                                                              @item{Debajo del Contrato, escribe la @vocab{Declaración de Propósito} resumiendo lo que hace la función en una sola oración.}
                                                              @item{Escribe dos Ejemplos para esta función, luego rodea en circulo y etiqueta lo que varía entre ellos.}
                                                              @item{Escribe la Definición para esta función.}]}
                                 }
                         @teacher{If time allows, pass out extra Design Recipe worksheets [@resource-link[#:path "DesignRecipeWorksheet.pdf" #:label "PDF"]], and have students practice with other word problems. Practice variations on red-square, involving two inputs changing while other parameters stay fixed.}
                        }
                 ]
         }
         
@lesson/studteach[
     #:title "La Receta de Diseño (Algebra)"
     #:duration "40 minutos"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "A-SSE.1-2" "F-IF.1-3" "F-IF.4-6" "F-BF.3-4" "BS-DR.1" "BS-DR.2" "BS-DR.3")
     #:materials @itemlist[]
     #:preparation @itemlist[]
     #:prerequisites (list "Practicing the Design Recipe") 
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{@points[@point{@student{El verdadero poder de la programación no es lo bien que conoces el lenguaje. ¡Se trata de lo bien que se puede utilizar para resolver problemas!
                                 Has aprendido sobre una herramienta de gran alcance que te ayuda a tomar problemas en el papel y convertirlos en funciones en el equipo:
                                 ¡La @vocab{Receta de Diseño}! Resulta que la Receta de Diseño también se puede utilizar para ayudarte a resolver problemas de álgebra, ¡también!
                                @activity[#:forevidence (list "F-IF.1-3&1&1" "F-IF.4-6&1&3" "A-SSE.1-2&1&1" "BS-DR.1&1&1")]{
          Ve a la @worksheet-link[#:name "Math-Rocket-Distance"] de tu libro de ejercicios, lee atentamente el problema y anota el Contrato
                   para la función:
                   @italic{"Un cohete está volando de la Tierra a Marte a 80 millas por segundo. Escribe una función que describa la distancia @math{D} que el cohete
                            ha viajado, en función del tiempo}"
                  }}
                        @teacher{}
                        }
                 @point{@student{La distancia que recorre un cohete se mide en números de millas, y el tiempo se mide en números de segundos. Esto nos da
                                  el contrato:
                                  @bannerline{@math{distance: Number \rightarrow Number}}
                                  Al igual que antes, el Contrato nos da una fuerte pista sobre cómo escribir los Ejemplos. Aquí hay un ejemplo, escrito en
                                  Código Racket: @code{(EJEMPLO (distance 5) (* 5 80))} Aquí está el mismo ejemplo, escrito en álgebra:
                                  @math{distance (5) = 5 \times 80}
                                  @activity[#:forevidence (list "F-IF.1-3&1&2" "F-IF.1-3&1&4" "F-IF.1-3&1&5" "F-IF.4-6&1&3" "A-SSE.1-2&1&1" "BS-DR.2&1&1")]{
                                      Escribe dos ejemplos adicionales para esta función, usando la notación algebraica.}
                                 }
                         @teacher{Point out that the Contract hasn't changed @italic{at all} between Racket and Algebra. 
                                  If students are struggling with the change in syntax, let them first write the Examples in Racket, and 
                                  then convert them to Algebra by following the model shown here.}
                         }
                 @point{@student{Como antes, las variables de una función pueden ser identificadas escribiendo dos Ejemplos, y mirando qué cambia entre ellos.
                                 @activity[#:forevidence (list "A-SSE.1-2&1&1" "A-SSE.1-2&1&2" "7.EE.3-4&1&4" "BS-DR.2&1&3" "BS-DR.3&1&1")]{
	                                           Utilizando los Ejemplos que has escrito, identifica la(s) variable(s) para la función.
                                            A continuación, define la función @italic{usando sintaxis algebraica}.}
                                 La Receta de Diseño ayuda a la transición de una descripción escrita de una función en una definición formal, 
                                 @bannerline{@math{distance(4) = 4 \times 80}
                                              @math{distance(7) = 7 \times 80}
                                              @math{distance(t) = t \times 80}}}
                         @teacher{}}
                 @point{@student{@activity[#:forevidence (list "F-IF.1-3&1&1" "F-IF.4-6&1&3" "A-SSE.1-2&1&1" "BS-DR.1&1&1")]{
                                           Ve a la @worksheet-link[#:name "Math-Rocket-Time"] en tus libros, lee cuidadosamente el problema y escribe
                                            abajo del contrato para la función: @italic{"Un cohete está viajando de la tierra a Marte
                                            a 80 millas por segundo. Escribe una función que describa el tiempo que el cohete ha estado viajando en
                                            función de la distancia."}
                                          }
                                  }
                         @teacher{Point out that this is the same relationship between distance and time as before, 
                                  @bold{only now we want be able to see the relationship from the opposite direction}: time in terms of 
                                  distance, rather than distance in terms of time.}
                         }
            @point{@student{Una vez que tengamos el Contrato, es fácil escribir Ejemplos:
                             @math{time : Number \rightarrow Number}
                            @activity[#:forevidence (list "F-BF.3-4&1&4" "F-IF.1-3&1&2" "F-IF.1-3&1&4" "F-IF.1-3&1&5" "F-IF.4-6&1&3" "A-SSE.1-2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1")]{
                                       Utiliza el Contrato para escribir dos Ejemplos para esta función, luego identifica la(s) variable(s) para la función.
                                       @itemlist[@item{¿Cuántas variables tiene esta función?}
                                                  @item{Nombre de la(s) variable(s).}
                                                  @item{Define esta función, usando la sintaxis algebraica.}]}}
                    @teacher{}
                    }
            @point{@student{Una vez que tu función está configurada, es fácil simplemente conectar valores y obtener respuestas. @italic{Con la mayoría de los problemas, lo difícil es establecer la función en primer lugar.} ¡Por suerte, la receta de diseño hace que la configuración de esta función sea mucho más fácil! Lo hemos utilizado para configurar dos funciones diferentes, que podrían usarse para darnos respuestas en términos de distancia o tiempo. Definir funciones es como herramientas de construcción, que puedes utilizar para resolver problemas simples o combinar para resolver problemas más complejos.
                    @activity{Supongamos que querías saber hasta dónde viajó el cohete en 6 segundos: ¿cuál de las dos funciones usarías? ¿Y si querías saber cuánto tiempo tarda el cohete en recorrer mil millas?}}
            @teacher{Ask students to identify which function they would use to answer a variety of different questions.}
            }
            @point{@student{@activity{Ve a la @worksheet-link[#:name "Math-Rocket-Collision"] en tus libros, lee cuidadosamente el problema:
                                               @italic{"Un cohete sale de la Tierra, se dirige a Marte a 80 millas por segundo." Al mismo tiempo, un asteroide
                                                       deja a Marte viajando hacia la Tierra, moviéndose a 70 millas por segundo. Si la distancia desde la Tierra
                                                       a Marte es de 50.000.000 millas, ¿cuánto tiempo les llevará a reunirse?}
                                                    @itemlist[@item{¿Cuáles son los hechos que el problema @bold{te proporciona}?}
                                                                @item{¿@bold{Que se te pide} del problema?}
                                                                @item{Utiliza tus respuestas para completar la siguiente oración: "Dado ____, escriba una función que produzca ____."}
                                                                @item{Si tal función existiera, ¿cuál sería un buen nombre para ella?}]}}
                                   @teacher{Ultimately, the problem is asking students about a functional relationship between distance and collision-time.}
                                   }
                            @point{@student{Si tuviéramos una función que computara el tiempo de colisión, sería fácil responder a esta pregunta simplemente tapando la distancia entre la Tierra y Marte. En lugar de empezar a preocuparte por la creación de una ecuación, ¡puedes utilizar la receta de diseño para construir la función en sí!
                                            @activity[#:forevidence (list "F-IF.1-3&1&1" "F-IF.4-6&1&3" "A-SSE.1-2&1&1" "BS-DR.2&1&1")]{
                                                   Anota el contrato para esta función, luego escribe dos Ejemplos usando distancias diferentes.}}
                                    @teacher{}
                                    }
                            @point{@student{Por ahora, tienes el contrato para esta función y una buena declaración de propósito:
                                            @bannerline{@math{collide : Number \rightarrow  Number}
                                                         @math{collide(0) = ...}}}
                                    @teacher{}
                                    }
                             @point{@student{Así que ahora tenemos que averiguar qué cálculos van después del signo igual. Por suerte, tenemos una pista: sabemos que sea lo que sea, debe resultar cero, ya que sabemos que ya han colisionado cuando están a una distancia de cero millas. 
                                             @activity{Si el cohete va a 80 millas por segundo, y el asteroide va a 70 millas por segundo, @italic{¿qué tan rápido se están acercando?}}}
                                     @teacher{}
                                     }
                             @point{@student{@math{80 + 70 = 150}, Por lo que sabemos que se están acercando cada vez más a una velocidad de 150 millas por segundo. Esto no es tan diferente de nuestra función @code{time}: tenemos cierta velocidad, y queremos saber cuánto tiempo tomará recorrer una distancia determinada. Entonces, ¿qué escribimos para nuestro ejemplo?
                                              @bannerline{@math{collide(0) = 0/150}}
                                              @activity{Escribe dos ejemplos usando diferentes distancias, a continuación, define la función para que funcione con cualquier distancia.}}
                                     @teacher{}
                                     }
                             @point{@student{A estas alturas, es posible que ya veas el cuadro general: la distancia dada en este problema puede ser conectada a la ecuación
                                              sin tener que definir la función en sí. ¡A veces la Receta de Diseño te guiará a la respuesta sin
                                              incluso tener que terminar! Otras veces, sin embargo, es posible que no veas el panorama hasta que hayas roto el problema
                                              hacia abajo en partes más pequeñas, cada uno con su propia función.}
                                     @teacher{You can add as many Design Recipe pages as you like to the workbooks, using any algebra problem you like. 
                                              We recommend using word problems from your students' algebra textbook, or even from your state's standardized test!}
                                     }]
         }
       
       
@lesson/studteach[
     #:title "Concluyendo"
     #:duration "5 minutos"
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
        @points[@point{@student{En esta unidad, comenzaste a ver cómo las funciones son útiles en la escritura de animaciones: las funciones ayudan a producir información (como la altura de un cohete) que se utilizan para crear escenas en un juego. Con las funciones adicionales de escritura de la práctica y usando la receta de diseño, ya estás listo para comenzar a escribir funciones que moverán los elementos dentro de tu propio juego.}
                        @teacher{@itemlist[@item{Have students volunteer what they learned in this lesson}
                                            @item{Reward behaviors that you value: teamwork, note-taking, engagement, etc}
                                            @item{Pass out exit slips, dismiss, clean up.}]}
                        }
                        ]}
}
