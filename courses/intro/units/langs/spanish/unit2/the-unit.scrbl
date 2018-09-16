#lang curr/lib

@title{Unidad 2: Contratos, Cadenas de Texto e Imágenes }
@unit-overview/auto[#:lang-table (list "Number" @code{+ - * / sqr sqrt expt} "1 ,4 ,44.6")]{
@unit-descr{Los estudiantes son introducidos a una representación de asignación de mapeo para funciones, en la que el objeto de función existe como un medio de traducir puntos
Desde un dominio a un rango. Junto con su comprensión de Círculos de Evaluación, los estudiantes generalizan su comprensión de las funciones para
Incluyen otros tipos de datos, incluyendo cadenas e imágenes.}
}
@unit-lessons{
@lesson/studteach[
     #:title "Repaso de los Círculos de Evaluación"
     #:duration "30 mins"
     #:overview "Students practice converting arithmetic expressions into Circles of Evaluation, and then converting those into Code."
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list "A-SSE.1-2" "BS-CE")
     #:materials @itemlist[]
     #:preparation @itemlist[@item{OPCIONAL: Reparta la @(new-tab "https://docs.google.com/document/d/1Qn59Fol2tspqOx6XQV88xm-IYsRGY769cb7MQeknSMA/edit?usp=sharing" "Hoja de Actividades de Calentamiento").}
                              @item{Los libros de trabajo de los estudiantes y algo con que escribir.}]
     #:prerequisites (list "Order of Operations")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@activity[#:forevidence (list "BS-CE&1&2" "BS-CE&1&4" "A-SSE.1-2&1&3")]{
                       Practicar los Círculos de Evaluación, usando la hoja de actividades @worksheet-link[#:name "Circle-of-Evaluation-Practice-2"] 
                       en tu libro de trabajo.
                       @itemlist[#:style 'compact
	                         @item{En cada fila, hay una expresión matemática escrita en la columna de la izquierda.}
                                 @item{Examina cada una de estas expresiones y dibuja el Círculo de Evaluación para cada uno en la segunda columna.}
                                 @item{Una vez que has convertido cada uno de ellos, ve a la tercera columna y convierte cada uno en un programa que se puede introducir en el equipo. No olvides revisar tus paréntesis y ten cuidado al dejar un espacio entre cada entrada.}]}}
                        @teacher{Make sure students have the opportunity to practice drawing Circles from the outside-in (beginning with a large Circle and filling it in), and from the inside-out (starting with the innermost expression, and building out).
                                 This can be done as a team competition, with each round requiring teams of students to fill in each square of the activity sheet. Make sure you review after @bold{every} round, to catch mistakes in understanding early.}
                        }
                 ]
         }
@lesson/studteach[
     #:title "Cadenas de Texto e Imágenes"
     #:duration "20 mins"
     #:overview "Students extend the Circle of Evaluation metaphor to include new functions and datatypes."
     #:learning-objectives @itemlist[@item{Students will be able to use functions that produce Images}
                                     @item{Students will understand the concept of datatype}
                                     @item{Students will understand that each value has a datatype}
				     @item{Students will understand that datatypes describe a function's inputs and outputs}
                                    ]
     #:evidence-statements @itemlist[@item{When given Circles of Evaluation for novel expression, functions and datatypes, students will be able to apply the rules for converting Circles of Evaluation into code}
                                     @item{Students will be able to identify what each argument to an image-producing function means}
                                     @item{Students will be able to write expressions that generate simple images (triangles, circle, stars, etc)}
                                     @item{Given a value, students will be able to identify its datatype}
                                     @item{Given an expression, students will be able to identify the datatype it will evaluate to}
                                     @item{Students will be able to distinguish between types and values}]
     #:product-outcomes @itemlist[@item{Los estudiantes ingresarán (evaluarán) expresiones para generar Cadenas de Texto e Imágenes}]
     #:exercises (list (make-exercise-locator "Strings-and-Images" "many-types-coe-to-code1")
                       (make-exercise-locator "Strings-and-Images" "many-types-coe-to-code2"))
     #:standards (list "N-Q" "BS-PL.1" "BS-PL.2")
     #:materials @itemlist[@item{Entorno de edición (WeScheme o DrRacket con el bootstrap-teachpack instalado)}]
     #:preparation @itemlist[@item{Los estudiantes están registrados en WeScheme.org, o han abierto DrRacket.}
                              @item{Los libros de trabajo de los estudiantes y algo con que escribir.}]
     #:prerequisites (list "Intro to Programming")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[          
            @point{@student{Los Círculos de evaluación son una poderosa herramienta, y pueden ser usados para mucho más que solo números. Considera el círculo de evaluación mostrado aquí. @sexp{(star 50 "solid" "red")}
                            @activity[#:forevidence "N-Q&1&2"]{@itemlist[@item{¿Cuál es el nombre de la función que está siendo usada?}
                                                 @item{¿Cuántos argumentos se le están dando a esa función?}
                                                 @item{¿Qué crees que hace esa función?}]}
                             
                             }
                    @teacher{Students are not expected to know all the answers here - the goal is for them to apply what they know about Circles to a novel expression, and discuss for themselves what they think it might mean. Ask them to justify their answers, and to explain why they think they are correct. Linking this back to earlier examples of Circles of Evaluation may be useful.}
                    }
             @point{@student{Las mismas reglas que aplicaste para convertir los Círculos de evaluación en código son aplicables. acá está el código para ese circulo: 
                             @sexp[#:form "code"]{(star 50 "solid" "red")}
                             @activity[#:forevidence "BS-PL.1&1&2"]{Digita este código en la ventana de interacciones, y presiona la tecla enter. ¿Qué obtuviste?
                                                                    @itemlist[@item{¿Qué hace la función @code{star}?}
                                                                               @item{Digita la expresión otra vez, pero esta vez utiliza un número más grande en vez de @code{50}. ¿Qué es lo que el primer argumento le dice a la computadora?}
                                                                               @item{Digita la expresión otra vez, esta vez usando el código @code{"outline"} en lugar de @code{"solid"}, teniendo cuidado de mantener las comillas. ¿Qué le dice el segundo argumento a la computadora?}
                                                                               @item{Ahora reemplaza el código @code{"red"} con otra cosa (otra vez, ¡Mantén las comillas!). ¿Qué le dice el tercer argumento a la computadora?}]
                                                                    @editor-link[#:interactions-text "(star 50 \"solid\" \"red\")" "¡Haz clic acá para probarlo!"]
                                                                    } 
                                                                     }
                     @teacher{This activity is designed to get students @italic{playing} with new terms and concepts, so they develop their own model for what's going on. At this point, it is NOT essential that students understand every last component of the code. If you need to give away lots of code snippets, that's ok - just get them playing!}
                     }
             @point{@student{Hay un @vocab{tipo} completamente nuevo de valor que está siendo usado en estas epresiones: x@code{"solid"} and @code{"red"} are examples of a completely new datatype, called a String.  
                             @bannerline{Una cadena de texto (String) es lo que está dentro de las comillas.} 
                             }
                     @teacher{Students should see Strings as an analog to Numbers: a different type of value, but one that is still a simple program that evaluates to itself and can be passed as an argument to a function.  Note that the Number 42 and the String "42" are different values!  You could add the Number 42 to another number, but you cannot add the String "42" to another number.}
                     }
             @point{@student{Cuando aprendimos sobre los valores (values), aprendimos que un programa puede ser más que un valor, como un número.  
                             Si escribes un número en la ventana de interacciones, por ejemplo, eso equivale a el mismo.  Para recordarte esto,
                             intenta evaluar @code{716} en la ventana de interacciones.
                                          @editor-link[#:interactions-text "716"
                                                    "¿Qué esperas que devuelva?"]
                                          Cómo las cadenas de texto (Strings) son valores también, el valor @code{"red"} ¡es también un programa válido! Así como los valores numéricos, las cadenas de texto (Strings) equivaldrán a ellos mismos.
                                          @activity[#:forevidence "BS-PL.1&1&1"]{Prueba introducir cadenas de texto (strings) en la ventana de interacciones. ¿Qué ocurre si se pone comillas alrededor de varias palabras?  ¿Alrededor de números?}
                                       }
                     @teacher{}
                    }
             @point{@student{Está expresión también incluyó una nueva @vocab{función} llamada @code{star}. Así como la función de suma @code{+} toma dos números, @code{star} usa en ella @italic{un Número (Number) y dos Strings}, y produce un nuevo tipo de dato llamado @vocab{Imagen}.
                            @activity[#:forevidence "BS-PL.1&1&1"]{Cuál es el tipo de dato en cada uno de los valores listados abajo: ¿Number, String o Image? -- Number, String or Image? 
                                      @itemlist[@item{@code{42}}
                                                 @item{@code{"¡Hola, mamá!"}}
                                                 @item{@code{9273482.42}}
                                                 @item{@bitmap{images/TriangleImage.png}}
                                                 @item{@code{"84729"}}
                                                 @item{@code{"Strings y Numbers son dos tipos de datos diferentes."}}
                                                 @item{@bitmap{images/coffee-cup.png}}]
                                                 }}
                     @teacher{Students have now seen three datatypes: Numbers, Strings and Images. You'll want to make sure students can correctly identify examples of each one.}
                     }
             @point{@student{Tú has visto expresiones que @vocab{producen} valores, como @code{(* 16 4)}, el cual produce un Number. Otras expresiones, por lo tanto, pueden producir Strings o Images. 
                             @activity[#:forevidence "BS-PL.1&1&2"]{¿A qué tipo de dato equivaldrán las siguientes expresiones?
                                      @itemlist[@item{@code{(/ (+ 7 2) 3)}}
                                                 @item{@code{(star 500 "solid" "purple")}}
                                                 @item{@code{(star (+ 1 3) "outline" "blue")}}
                                                 @item{@code{(- (* 4 2) (+ 1 0))}}
                                                 ]}}
                     @teacher{For added practice, have students identify the type of each argument in each of those expressions. Going Further - If time allows, you can go further into @lesson-link[#:name "Manipulating-Images" #:label "Manipulating Images"] or @lesson-link[#:name "Making-Flags" #:label "Making Flags"].}
                     }
             @point{@student{@activity[#:forevidence "BS-M&1&3"]{Algunos de los items mostrados abajo son @vocab{tipos}, mientras otros son @vocab{valores}. ¿Puedes distinguir la diferencia?
                                       @itemlist[@item{792.24} 
                                                 @item{String}
                                                 @item{"hi, mom!"}
                                                 @item{"91"}
                                                 @item{Number}
                                                 @item{Image}
                                                 @item{102}
                                                 ]}}
                     @teacher{}
                    }
             ]}
@lesson/studteach[
     #:title "Contratos"
     #:duration "35 mins"
     #:overview "Students learn to describe functions and their behavior, using formalisms including Contracts (Domain and Range) and Datatypes."
     #:learning-objectives @itemlist[@item{Students will start to write and use Contracts, which summarize the name, range, and domain of a function}
                                     @item{Students will learn how to use a function based on the information in its Contract}
                                    ]
     #:evidence-statements @itemlist[@item{Given an expression, students will be able to identify the name of the function being used}
                                      @item{Given an expression, students will be able to identify how many arguments are used}
                                      @item{Given a value, students will be able to identify its type}
                                      @item{Students will be able to identify the parts of a contract}
                                      @item{Students will be able to distinguish between contracts and function calls}
                                      @item{Given an example of a function being applied, students will be able to write a contract for that function}]
     #:product-outcomes @itemlist[@item{Los estudiantes escribirán Contratos para expresiones aritméticas, así como varias expresiones productoras de imágenes}]
     #:exercises (list (make-exercise-locator "Contracts" "id-expr-pieces1")
                       (make-exercise-locator "Contracts" "id-expr-pieces2")
                       (make-exercise-locator "Contracts" "match-contracts-exprs1"))
     #:standards (list "BS-PL.2" "BS-IDE" "N-Q" "F-IF.1-3")
     #:materials @itemlist[@item{Entorno de edición (WeScheme o DrRacket con el bootstrap-teachpack instalado)}]
     #:preparation @itemlist[@item{Computadora para cada estudiante (o pareja), corriendo WeScheme o DrRacket}
                              @item{Los libros de trabajo de los estudiantes y algo con que escribir.}]
     #:prerequisites (list "Intro to Programming")
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{Ya has visto varias funciones que toman dos números, como @code{+}, and @code{-}.
                                Mientras tanto, @code{star} toma un Number y dos Strings.   Las diferentes funciones toman diferentes entradas, y necesitamos una manera de conocer los requerimientos de cada función.
                        @bannerline{El dominio de una función son los datos que la función espera.}
                        @activity[#:forevidence (list "F-IF.1-3&1&1")]{¿Porque es importante conocer el @vocab{dominio} de una función?}}
                        @teacher{}
                        }
                 @point{@student{Al mantener una lista de todas las funciones en un idioma, y sus dominios, los programadores pueden buscar fácilmente cómo se utiliza cada función. ¡Sin embargo, también es importante realizar un seguimiento de lo que cada función produce! Por ejemplo, un programa no usaría  @code{star} si estuviera tratando de producir un número, porque 
                        @code{star} sólo produce Images.
                        @bannerline{El Rango de una función son los datos que una función produce.}}
                         @teacher{Domain and Range are critical concepts. They can be reinforced by modifying a simple expression 
                                  (such as @code{(+ 1 2)}), asking questions at every step. For example, we know that @code{+} 
                                  takes two Numbers, which is why 1 and 2 are used in the example. However, each of those values 
                                  could be replaced by @italic{another expression} -- as long as that expression evaluates to a 
                                  Number. Have students systematically replace each value with an expression, asking them to 
                                  justify their replacement using the Domain and Range of each function.}
                         }
                 @point{@student{Los Dominios y los Rangos ayudan a los programadores a escribir mejor código, evitando errores tontos y dándose consejos sobre qué hacer a continuación.
                                 Un programador que quiere usar el código @code{star} puedes mirar el dominio e inmediatamente saber que el primer dato ingresado fue un número (como@code{100}), sin tener que recordarlo cada vez.
                    En lugar de escribir un único valor acá, un programador puede escribir toda la expresión como por ejemplo, @code{(* 25 4)}. Sabemos que este código devolverá un valor número (Number) mirando el rango para @code{*}; por lo tanto, el resultado de @code{*} puede ser usado en lugar de cualquier valor número.}
                         @teacher{}
                         }
                 @point{@student{Cuando los programadores escriben los Dominios y Rangos de cada función, escriben lo que se llaman @vocab{contratos}, para realizar un seguimiento de lo que cada función necesita.
                                 @bannerline{Un contrato tiene tres partes: el nombre, el dominio y el rango de una función.}
                                 El contrato para @code{star} es:
                                 @code[#:multi-line ""]{; star: Number String String -> Image}
                                 Esto significa que el @vocab{nombre} de la función es @code{star},  que toma un número (Number) y dos cadenas de texto (Strings) como su dominio,
                                  y produce una imagen como el rango. Utilizamos tipos en vez de valores cuando escribimos un contrato, porque queremos ser más generales: un star podría ser de cualquier tamaño, por lo que el dominio para @code{star} especifica que el primer argumento podría ser cualquier número. Si pensamos en un lenguaje como una colección de piezas de Lego, los Contratos son como las pestañas y ranuras que nos dicen cómo cada pieza puede conectarse.}
                         @teacher{[@(new-tab "https://www.youtube.com/watch?v=88WhYoMxrGw" "Video")]}
                         }
             @point{@student{Los contratos son lo suficientemente importantes y útiles que debemos mantener una lista de ellos en alguna parte. Las páginas posteriores de su libro contienen una hoja denominada "Contratos". Escriba el contrato para  @code{star} en la primera fila de su tabla de contratos.
                             }
                    @teacher{Common mistakes when students first write down contracts include: writing values (such as @code{"red"}) 
                             instead of types (such as "String") and forgetting arguments.  Read your students' contracts carefully, 
                             as they often indicate misconceptions that will persist and affect them later on.}}
             @point{@student{Aquí está el contrato para una nueva función:
                 @code[#:multi-line ""]{; rectangle: Number Number String String -> Image}
                 @activity[#:forevidence (list "BS-PL.2&1&1")]{@itemlist[@item{¿Cuál es el @vocab{nombre} de esa función?}
                                      @item{¿Cuantas cosas hay en el @vocab{dominio} de esta función?}
                                      @item{¿Cuál es el tipo de cada cosa en el dominio?}
                                      @item{¿Cuál es el rango @vocab{rango} de esta función?}
                                      ]}
                 Un Contrato le dice exactamente cómo usar la función, escribiendo su Nombre y luego usando @vocab{valores}  para cada uno de los argumentos en el @vocab{dominio}. Aquí está un ejemplo de una expresión, escrita para usar  @code{rectangle}: 
                 @code[#:multi-line ""]{(rectangle 100 50 "solid" "blue")}
                 @editor-link[#:interactions-text "(rectangle 100 50 \"solid\" \"blue\")"
                                                  "¿Qué crees que producirá este código?"]}
                     @teacher{Have students experiment with changing the argument values, always drawing attention back to the Domain.}
                     }
             @point{@student{Al escribir los Contratos para nuestras funciones, podemos fácilmente mirar hacia atrás para ver cómo se utilizan.
                             @activity[#:forevidence (list "BS-PL.2&1&1" "F-IF.1-3&1&1")]{El contrato para @code{+} es mostrado abajo.
                                       @code[#:multi-line ""]{; +: Number Number -> Number}                
                                       ¿Puedes escribir el contrato para @code{*}, @code{-}, @code{/} y @code{sqrt}?}}
                     @teacher{}
                     }
             @point{@student{Ahora que sabes cómo usar un Contrato para escribir una expresión, aquí están los Contratos para varias nuevas funciones que producen Imágenes:
                             @code[#:multi-line ""]{; ellipse:  Number Number String String -> Image
                                                    ; triangle: Number String String        -> Image
                                                    ; circle:   Number String String        -> Image}
                             @activity[#:forevidence (list "BS-PL.2&1&1" "BS-PL.2&1&3")]{¡Mira si puedes imaginar cómo usar estas nuevas funciones para dibujar otras formas!
                                                                                         @editor-link[#:interactions-text "(ellipse 150 40 \"outline\" \"black\")"
                                                                                                                          "Aquí tienes un ejemplo para empezar"]}
                             }
                     @teacher{You should start pushing students to write more sophisticated expressions, 
                              replacing Number values with entire expressions (e.g. @code{(star (* 10 5) "solid" "purple")}). 
                              Students should be comfortable looking at an entire subexpression as a single
                              argument to the surrounding function. 
                              You may want to insist that students to write these Contracts into their notebooks 
                              BEFORE allowing them to play with them. Be careful about letting students rush to 
                              the keys without first taking notes!}
                     }
             @point{@student{Esta es una expresión que utiliza una función muy interesante: @code{(bitmap/url "http://bootstrapworld.org/images/icon.gif")}.  
                            está función recoge la URL de cualquier imagen que pueda encontrar en línea y producirá esa imagen para que pueda utilizarla en su programa.
                             @activity[#:forevidence (list "BS-PL.2&1&1")]{@itemlist[@item{¿Cuáles son las tres partes de un contrato?}
                                                  @item{¿Cuál es el nombre de esta nueva función?}
                                                  @item{¿Cuántas cosas hay en su dominio?}
                                                  @item{¿Cuál es el dominio de esta función?}
                                                  @item{¿A qué se evaluará está expresión?}]}                             
                             }
                     @teacher{If you want to have students practice using @code{bitmap/url}, it is recommended that you use an image search-engine, 
                              such as @(new-tab "https://images.google.com" "Google Images") or @(new-tab "http://www.bing.com/images" "Bing Images"). 
                              Make sure that students know how to get the URL for the image itself, @italic{not the URL of the web page that contains the image.}}
                     }
             @point{@student{Los contratos ayudan a los programadores a escribir código, por lo que siempre es una buena idea anotar contratos para cada función que vea. 
                             @activity[#:forevidence (list "BS-PL.2&1&2" "F-IF.1-3&1&1")]{
                                  ¿Puedes averiguar el contrato para una función, sólo por mirar un código de ejemplo? @editor-link[#:interactions-text "(text \"Bootstrap\" 30 \"purple\")"
                                                                                     "Mira la función que se está utilizando aquí"], 
                                   y ve si puedes escribir el @vocab{nombre}, @vocab{dominio} y @vocab{rango} para esa función.
                                         
                                  ¡Asegúrate de no confundir el @vocab{contrato} con una función con código! Algunos de los elementos enumerados a continuación son contratos, pero otros son sólo ejemplos de las funciones que se utilizan. ¿Puedes decir cuál es cuál?
                                         @itemlist[@item{@code{; triangle : Number String String -> Image}}
                                                    @item{@code{(triangle 100 "outline" "blue")}}
                                                    @item{@code{(square (+ 200 5) "solid" "red")}}
                                                    @item{@code{; square : Number String String -> Image}}]}
                                         }
                       @teacher{}
                       }
                @point{@student{A veces, cometemos errores al escribir código, y usamos un valor que viola el contrato. Afortunadamente, el equipo identifica estos casos y proporciona @vocab{Mensajes de Error} para ayudarnos a encontrar y corregir el problema. Un mensaje de error resalta el código que contiene el error y explica dónde la computadora encontró un problema.
  
                       @activity[#:forevidence (list "BS-IDE&1&2")]{Para cada una de las siguientes expresiones incorrectas, mira el código y ve si puedes averiguar qué está mal sobre él. A continuación, escribe el código en la ventana Interacciones y ve qué mensaje de error recibe. ¿El error identifica el mismo problema que tú cometiste? 
                                 @itemlist[@item{@code{(+ 4 "hi")}}
                                           @item{@code{("hi" + "mom")}}
                                           @item{@code{(* (+ 4 5) "pizza")}}
                                           @item{@code{(star "solid" "red" 40)}}
                                           @item{@code{(star "40" "solid" "red")}}
                                           @item{@code{(star 40 "red" "solid")}}
                                           @item{@code{(star 40 "solid" "yelow")}}
                                           @item{@code{(star (* 4 10) "blue")}}
                                           @item{@code{(cirle 25 "outline" "blue")}}
                                          ]}}
                       @teacher{Controlled practice with error messages helps students gain confidence in dealing with them later on.  
                                It is fine if students don't spot the errors for themselves at first, though having students explain 
                                the problems in their own words should reinforce correct use of these functions later 
                                in the course.}
                       }
                @point{@student{¡Ser un experto en la lectura de mensajes de error es una parte importante de ser un buen programador! Leer mensajes de error es como tener un maestro o un amigo que te ayude con algo en lo que estás trabajando, en lugar de simplemente decir "incorrecto". Cada vez que cometes un error.
                                Si te haces realmente bueno leyendo estos mensajes, puedes incluso utilizarlos para encontrar funciones que no sabías que existían.
                                @activity{Aquí están los nombres de algunas otras funciones productoras de imágenes, pero ¿cómo funcionan? Trate de averiguar cómo se utilizan en el equipo, mediante la experimentación y la lectura de los mensajes de error. ¿Puedes descubrir su dominio y rango?
                                @itemlist[@item{@code{rhombus}}
                                          @item{@code{right-triangle}}
                                          @item{@code{radial-star}}
                                          @item{@code{star-polygon}}]
                                }}
                        @teacher{}
                        }
                @point{@student{También hay una serie de funciones que toman las imágenes como su  @italic{entrada}. Por ejemplo, suponga que desea invertir una imagen de izquierda a derecha, de modo que apunte en la dirección opuesta. Puedes utilizar la función @code{flip-horizontal},  que tiene una imagen como su dominio y rango. Vea el Contrato (y un ejemplo de la función) a continuación:
                                @code[#:multi-line ""]{; flip-horizontal : Image -> Image
(flip-horizontal (right-triangle 50 20 "outline" "red"))
}
                                }
                       @teacher{Functions that take Images as their inputs are often very difficult for students at first, because they absolutely require
                                that students really understand function composition. If a student is struggling with this concept, have them draw out
                                the Circle of Evaluation for the example here, and @italic{then} convert it to code.}
                        }
                 @point{@student{@activity{Para cada una de las siguientes funciones, escribe el contrato en tu libro y prueba con el código de ejemplo. ¿Puedes averiguar qué hace cada función a su imagen?
                                           @code[#:multi-line ""]{; flip-vertical : Image -> Image
(flip-vertical (triangle 50 "outline" "orange"))

; scale : Number Image -> Image
(scale 2 (text "resize" 10 "purple"))

; rotate : Number Image -> Image
(rotate 45 (text "spin" 30 "green"))
}
                                           }}
                         @teacher{As before, urge struggling students to draw out the Circle of Evaluation for each of these.}
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
        @points[@point{@student{Está lección se amplió en lo que sabes acerca de Círculos de evaluación, expresiones y código para incluir cadenas e imágenes. Tú aprenderás que sabes acerca de las funciones de Números también de Cadenas de Texto e Imágenes (lo que hará que tus programas sean más interesantes). Puedes aprender a utilizar las funciones de Imagen para crear tus propias imágenes y cómo utilizar imágenes en tus programas(a través @code{bitmap/url}).}
                        @teacher{@itemlist[@item{Have students volunteer what they learned in this lesson}
                                            @item{Reward behaviors that you value: teamwork, note-taking, engagement, etc}
                                            @item{Pass out exit slips, dismiss, clean up.}]}
                        }
                @point{@student{En la siguiente unidad, aprenderás a crear tus propias funciones para ahorrar trabajo al escribir expresiones (esto resultará ser una parte esencial de escribir un juego). También empezarás a personalizar tu juego con imágenes para los elementos del diseño del juego.}
                       @teacher{}}
                        ]}
}

