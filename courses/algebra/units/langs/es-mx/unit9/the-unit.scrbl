#lang curr/lib

@title{Unidad 9: Preparación para el lanzamiento}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sqr sqrt expt} "1 ,4 ,44.6") 
                                       (list "String" @code{string-append string-length} " \"hello\" ")                          
                                       (list "Image" @code{rectangle circle triangle ellipse star scale rotate put-image} "(circle 25 \"solid\" \"red\")")
                                       (list "Boolean" @code{= > < string=? and or} "true false"))]{

@unit-descr{Los estudiantes editan los detalles del juego, practican hablando sobre su código y se preparan para su Lanzamiento.}
 }

@unit-lessons{
@lesson/studteach[
     #:title "Preparación de la presentación" 
     #:duration "60 min"
     #:overview "Students create posters and draft presentations for their videogames."
     #:learning-objectives @itemlist[@item{Students practice explaining programming artifacts and concepts to others}]
     #:evidence-statements @itemlist[@item{Students will be able to explain the Circles of Evaluation to others}
                                     @item{Students will be able to explain the purpose of a Contract}
                                     @item{Students will be able to walk an audience through a simple use of the Design Recipe}
                                     @item{Students will be able to explain how the Distance Formula is used in their game}
                                     @item{Students will be able to explain how Piecewise Functions are used in their game}]
     #:product-outcomes @itemlist[@item{Un cartel que ilustra un componente clave de un programa de juego}]
     #:standards (list)
     #:materials @itemlist[@item{Entorno de edición (WeScheme o DrRacket con el bootstrap-teachpack instalado)}
                           @item{El @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "Libro de Trabajo") del Estudiante.}
                           @item{Lapiceros/lápices para los estudiantes, marcadores de pizarra para profesores}
                           @item{Cartel de clase (Lista de reglas, tabla de lenguaje, calendario del curso)}
                           @item{Tabla de Lenguaje (Vea abajo)}
                           @item{Impresiones del código del juego para cada equipo.}
                           @item{Cámara: ¡Tomen fotos hoy!}
                          ]
     #:preparation @itemlist[@item{Ejemplo de póster para un juego ficticio, para usarlo como modelo para los estudiantes.}]
     #:prerequisites (list)
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
       @points[@point{@student{Una vez que tengas un juego de trabajo (¡todos tus Contratos y EJEMPLOS incluidos, por supuesto!), Es hora de pensar cómo presentar tu trabajo a otros. Los programadores pasan mucho tiempo diseñando y escribiendo su código, pero también pasan tiempo explicando su trabajo a otros. Estos podrían ser otros programadores en su equipo, otros ingenieros dentro de la empresa, o incluso personas no técnicas. ¿Crees que puedes explicar tu código a otra persona?}
                       @teacher{Got time for a challenge? Try introducing them to @lesson-link[#:name "Structs" #:label "Data Structures"], to allow for 2-dimensional motion and more player control.}
                       }
                @point{@student{@activity{¡Cree un póster de muestra para tu juego! Cada póster debe tener los siguientes elementos:
                                          @itemlist[@item{Su(s) nombre(s), y el título de su juego}
                                                     @item{Una foto para capturar la mirada de la gente}
                                                     @item{La historia detrás de tu juego}
                                                     @item{Una descripción escrita de una función de su código. Esta descripción debe incluir el nombre, el dominio y el rango de la función, con una explicación de lo que hace y cómo se utiliza en su juego. En vez de describir una función, podrías describir algún concepto que aprendiste (Círculos de Evaluación, Receta de Diseño, Funciones por Trozos, Teorema de Pitágoras) y cómo lo utilizaste para crear tu juego.}]}}
                       @teacher{Make sure that each group of students gets a different function to talk about, so that a classwide presentation will review the entire game. You may also want to have groups assigned to explain the Circles of Evaluation, Contracts, the purpose behind the Design Recipe, Piecewise Functions, and the Pythagorean Theorem.}
                       }
                @point{@student{Después de hacer el póster, piense en cómo lo usará durante su presentación. ¿Qué le dirás a la audiencia? ¿Cómo puede utilizar lo que ha escrito en el póster o en su código para ayudar con la presentación?}
                       @teacher{Demonstrate a terrible presentation, modeling bad posture, low volume, and mumbling. When it's time for the code-walk, stop. Ask kids to critique, pointing out what they liked and didn't like. What did they think of the speed of the presentation? Could they hear you? Then model a much better presentation! Demonstrate positive energy, clear speech, etc. }
                       }
                @point{@student{@activity{Escriba o practique una presentación de 5 minutos en la que se presente y explique su juego, luego pase por la audiencia a través de una explicación de la función o concepto que le asignaron.}}
                       @teacher{Have students walk through their presentations, and get feedback from their peers. You may also want to model the explanation of a few lines of code, so they see what you're looking for. Don't allow students to just recite the code! They should be able to explain each line in plain english - don't be afraid to push students to really explain what's going on.}
                       }]
        }
      
@lesson/studteach[
     #:title "Celebrando" 
     #:duration "15 min"
     #:overview "Students are awarded certificates for their presentation"
     #:learning-objectives @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[@item{Entorno de edición (WeScheme o DrRacket con el bootstrap-teachpack instalado)}
                           @item{El @(resource-link #:path "workbook/StudentWorkbook.pdf" #:label "Libro de Trabajo") del Estudiante.}
                           @item{Lapiceros/lápices para los estudiantes, marcadores de pizarra para profesores}
                           @item{Cartel de clase (Lista de reglas, tabla de lenguaje, calendario del curso)}
                           @item{Tabla de Lenguaje (Vea abajo)}
                           @item{Impresiones del código del juego para cada equipo.}
                           @item{Cámara: ¡Tomen fotos hoy!}
                          ]
     #:preparation @itemlist[@item{(Opcional) Diseñe Diplomas de Juego a:
                                   @itemlist[@item{La historia más creativa}
                                              @item{Los visuales más creativos}
                                              @item{Los mejores tomadores de notas}
                                              @item{Mejor enfoque}
                                              @item{Energía más positiva}
                                              @item{Maestros de la receta del diseño}]
                                   }]
     #:prerequisites (list)
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
     ]{
       @points[@point{@student{Felicidades: ¡Has hecho algo realmente increíble! Has aprendido un nuevo lenguaje de programación, aprendido sobre los Círculos de Evaluación, Números, Cadenas, Booleanos, Imágenes, Funciones, Valores, Ramificación Condicional, la Receta de Diseño, Contratos y más. Hiciste una mosca de cohete, aprendiste a generar gráficos por computadora, y ponías todo eso juntos para construir un videojuego!}  
                       @teacher{Have the class give each other a round of applause. Give out awards, talk about student achievement, etc.}
                       }]
        }

}