#lang curr/lib


@lesson/studteach[
     #:title "Haciendo Banderas"
     #:duration "30 minutos"
     #:overview "Los estudiantes aplican sus conocimientos de Contratos, Sintaxis y composición de funciones para construir banderas usando funciones de imagen incorporadas."
     #:learning-objectives @itemlist[@item{Learn how to use advanced image operations} 
                                      @item{Practice function composition} 
                                      @item{Practice using contracts to help with composing operations} 
                                      @item{Practice writing and evaluating nested expressions}]
     #:product-outcomes @itemlist[@item{Students create images for various nations' flags}]
     #:standards (list "A-SSE.1-2" "MP.1" "MP.7")
     #:materials @itemlist[@item{Editing environment (WeScheme or DrRacket with the bootstrap-teachpack installed)}]
     #:preparation @itemlist[@item{Computer for each student (or pair), running WeScheme or DrRacket (If using DrRacket, make sure the Images.rkt file is loaded)} @item{Student Workbooks, and something to write with}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{Spend more time reviewing the simpler image functions, making sure students have a chance to type them in and try them out.} 
                                                @item{Have them convert each expression to a Circle of Evaluation, before typing it in.} 
                                                @item{If a student isn't sure about the order of the inputs, or what type of input they'll need -- don't give them the answer! This is a great time to remind them why contracts come in handy, so have them look up the answer in their own notes.}]}
                @pacing[#:type "misconception"]{@itemlist[@item{Even students who are good at nested expressions of numbers can get stuck when it comes to images. Make sure you have students practice the Circle of Evaluation the first time they use a new function, reminding them to start simple and build out:
                @code[#:multi-line ""]{; start with a shape they already know
                                       (triangle 50 "solid" "red")
                                       ; then add the extra function around it
                                       (rotate 45 (triangle 40 "solid" "red"))}}]}
                @pacing[#:type "challenge"]{@itemlist[@item{A good challenge, if your students have seen <tt>string-length</tt>, is to use the text function to make an image, using the string <tt>"purple"</tt> for all three inputs:
                @code[#:multi-line ""]{; with a sub-expression
                                       (text "purple"
                                       (string-length "purple")
                                       "purple")}]}]}
                )
      ]{
        @points[
          @point{@student{@activity{Abre este archivo y lee el código: [@resource-link[#:path "source-files/Flags.rkt" #:label "DrRacket"] | @(hyperlink "https://www.wescheme.org/openEditor?publicId=5eyoC2lS47" "WeScheme")]  El código también se muestra aquí:
                                     @code[#:multi-line ""]{; a blank flag is a 300x200 rectangle, which is outlined in black
                                                            ; 1) start with a red dot, of radius 50
                                                            (define dot (circle 50 "solid" "red"))
                                                            ; 2) define a variable called "blank", which is a 300x200, outlined black rectangle
                                                            (define blank (rectangle 300 200 "outline" "black"))
                                                            ; 3) define "japan" to be the flag of japan (a red dot, centered on a blank rectangle)
                                                            (define japan (put-image dot
                                                                                     150 100
                                                                                     blank))}
                                     @itemlist[@item{Aquí se definen tres valores. ¿Cuáles son?}
                                                @item{Haga clic en "Run" y evalúe cada uno de esos valores en la ventana Interacciones.}
                                                @item{Cambie el tamaño del punto y haga clic en "Run". ¿Esperas que Japón se vea diferente de lo que era antes? ¿Por qué si o por qué no?}]}
                           }
                  @teacher{}}
           @point{@student{Para hacer la bandera de Japón, queremos poner un sólido círculo rojo justo en medio de nuestra bandera (@code{flag}). De acuerdo con la definición de espacio en blanco (@code{blank}), una bandera es 300 de ancho por 200 de alto. Para colocar el punto (@code{dot}) en el centro, usamos las coordenadas (150, 100).
                          @activity{La función que nos permite poner una imagen encima de otra se llama @code{put-image}:
                                    @code[#:multi-line #t]{; put-image: Image Number Number Image -> Image
                                                           ; places an image, at position (x, y), on an Image}
                                    @itemlist[@item{¿Cuántas cosas hay en el @vocab{Dominio} de esta función? }
                                               @item{What is the @vocab{Rango} of this function?}
                                               @item{En la definición para @code{japan}, ¿qué imagen se está utilizando como primer argumento? ¿Qué se utiliza como el segundo?}]
                                    }}
                   @teacher{This is a good time to remind students about @bold{indenting}. Notice that all of the inputs to @code{put-image} line up with one another!}
          }
           @point{@student{Has visto funciones aritméticas anidadas antes, como @code{(+ 4 (+ 99 12))} @sexp{(+ 4 (+ 99 12))} (También se muestra como un Círculo de Evaluación a la derecha). La segunda entrada a  @code{+} es @italic{una subexpresión productora de números}, en este caso  @code{(+ 99 12)}. @code{put-image} puede anidarse de la misma manera. 
                   @activity{Este Círculo de Evaluación dibujará una estrella encima de otra imagen, que en sí misma es un círculo dibujado dentro de un cuadrado. @sexp{(put-image (star 50 "solid" "black") 75 75 (put-image (circle 50 "solid" "red") 75 75 (square 150 "solid" "black")))} Convierte este Círculo de Evaluación en código y trata de escribirlo en la computadora. ¿Qué imagen recibes? ¿Se puede modificar el código para que se agregue otra imagen en la parte superior?}}
                   @teacher{Have students practice this once or twice, and point out the natural indenting pattern.}
                   }
           @point{@student{¡Mediante la combinación de formas simples, puede hacer imágenes muy sofisticadas!
                           @activity{@bitmap{images/somalia.jpg} Mira esta imagen de la bandera somalí. 
                                      @itemlist[@item{¿Qué formas necesitarás para hacer esta bandera?}
                                                 @item{¿Qué colores necesitarás?}
                                                 @item{Defina un nuevo valor llamado @code{somalia}, que se evalúa a esta imagen.}]}}
                   @teacher{}}
           @point{@student{@activity{Trate de definir tantos de los siguientes indicadores como sea posible:
                                     @itemlist[@item{Indonesia @bitmap{images/indonesia.jpg}}
                                                @item{Nigeria @bitmap{images/nigeria.png}}
                                                @item{Francia @bitmap{images/france.jpg}}
                                                @item{Suiza @bitmap{images/switzerland.jpg}}
                                                @item{Emiratos Arabes Unidos @bitmap{images/UAE.jpg}}
                                                @item{Chile @bitmap{images/chile.jpg}}
                                                @item{Panama @bitmap{images/panama.jpg}}
                                                @item{¡Intenta hacer la bandera de tu país preferido, o incluso haz una bandera para tu propio país!}]}}
                   @teacher{}}]
    }