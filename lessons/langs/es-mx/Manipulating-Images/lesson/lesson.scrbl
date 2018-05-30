#lang curr/lib


@lesson/studteach[
     #:title "Manimpulando Imagenes"
     #:duration "20 minutos"
     #:overview "Se presentan operaciones adicionales de imágenes (images). A medida que los estudiantes usan estas operaciones para crear imágenes más interesantes, pueden practicar la composición de funciones, unir contratos y escribir expresiones anidadas."
     #:learning-objectives @itemlist[@item{Aprender a utilizar operaciones avanzadas de imagen (image)} 
                                      @item{Practicar funciones de composición} 
                                      @item{Practicar usando contracts para ayudar con la composición de operaciones} 
                                      @item{Practicar escribiendo y evaluando expresiones anidadas} 
                                      @item{Aprender como importar un gif, png, y otras imagenes desde archivos}]
     #:product-outcomes @itemlist[@item{Los estudiantes crean imágenes escaladas, giradas, invertidas y en capas}]
     #:standards (list "A-SSE.1-2" "MP.1" "MP.7")
     #:materials @itemlist[@item{Entorno de edición (WeScheme o DrRacket con el bootstrap-teachpack instalado)}]
     #:preparation @itemlist[@item{Computadora para cada estudiante (o pareja), corriendo WeScheme o DrRacket (Si usa DrRacket, asegurese que el archivo Images.rkt esta cargado)} @item{Los libros de trabajo del estudiante y algo con que escribir}]
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
          @point{@student{Anteriormente, aprendimos a crear imágenes simples utilizando operadores como @code{circle}, @code{rectangle} y @code{triangle}.   Podemos combinar o manipular estas formas básicas para hacer más interesantes, de la misma manera que podemos combinar y manipular números. En esta lección, aprenderermos a usar las funciones de Racket para manipular y combinar imágenes.}
                 @teacher{Use of the board is critical in this activity - you'll want to have lots of room to write, and lots of visuals for students to see. Have students review some of the Image-producing functions they already know (@code{triangle}, @code{circle}, etc.). Quiz them on the contracts for these functions.}
                 }
           @point{@student{@bitmap{images/simple-spaceship.png}Imagina que queremos crear la imagen de un simple satelite que se parezca al que se muestra aca. Esta imagen contiene un círculo azul y un rectángulo rojo, con el círculo en la parte superior del rectángulo.  Racket tiene una función llamada  @code{overlay}, que permite poner una imagen encima de otra. Aquí esta un contrato y una declaración de propósito que explica lo que hace:
                            @code[#:multi-line ""]{; overlay : Image Image -> Image
                                                   ; Draws the first image on top of the second image}}
                   @teacher{Start out by reminding students why contracts matter: they specify @italic{types} instead of @italic{values}, which makes them really flexible! You can demonstrate this by showing them the code for a simple  image, and then replacing the size of the triangle with a sub-expression:
                            @code[#:multi-line ""]{; simple image expression
                                  (star 50
                                  "solid"
                                  "red")
                                  ; with a sub-expression
                                  (star (* 10 10)
                                  "solid"
                                  "red")}
                            This sets students up to see @code{overlay} as a logical extension - instead of image-producing Circles of Evaluation with number-producing subexpressions, there can be image-producing Circles with @italic{image-producing} subexpressions.}
                   }
           @point{@student{Usando @code{overlay}, podríamos hacer una imagen de un satélite. Echa un vistazo al código de abajo, luego pulsa "enter" y ver qué forma hace! ¿Puedes cambiar el color del círculo o el tamaño del rectángulo? ¿Puedes usar @code{overlay} para colocar una estrella encima de la estrella y el rectángulo?
                           @editor-link[#:interactions-text "(overlay (circle 10 \"solid\" \"blue\") (rectangle 30 8 \"solid\" \"red\"))"
                                                            "See an example."]}
                   @teacher{Before students type in the code and try it out, ask the class what they think will happen - what will the size be? The color? The text?}}
                              
           @point{@student{@bitmap{images/rotated-spaceship.png}Este satélite está volando en el cielo. ¿Qué pasaría si sopla un viento fuerte, haciendo que el satélite volara ligeramente sobre su costado, como la imagen que se ve aquí? Entonces, usaremos la función @code{rotate} de Racket:
@code[#:multi-line #t]{
(rotate 30
        (overlay (circle 10 "solid" "blue")
                 (rectangle 30 8 "solid" "red")))
}
            Trata de copiar y pegar este código en el editor, y observa qué forma se obtiene. ¿Qué sucede si cambias el número @code{30}?}
                   @teacher{Have the class convert this code into a Circle of Evaluation.}}
                              
           @point{@student{@bitmap{images/circles-with-images.png}Veamos este código, como un Círculo de Evaluación. Nuestra función @code{rotate} se muestra aquí, en el círculo azul. @code{30} es el número de grados que estaremos girando, y la segunda entrada es la imagen que queremos rotar. Esa imagen es @italic{es el resultado de superponer el círculo y el rectángulo}, que se muestra aquí en rojo. Mirando este Círculo de Evaluación, ¿puedes adivinar el contrato para la función @code{rotate}?}
                   @teacher{Can students write the code or draw the Circle of Evaluation for rotating a difference shape by a different amount? Try using a subexpression like @code{(* 2 75)} for the rotation, instead of a simple number.}}
                              
           @point{@student{Aquí está el contrato y el propósito para rotate:
                           @code[#:multi-line ""]{; rotate : Number Image -> Image
                                                  ; Rotates the image by the given number of degrees}}
                   @teacher{When it's time to introduce the new functions, start out by showing them the contract and then an example, as it does in the student guide. Make sure to ask lots of "how do you know?" questions during the code, to remind them that the contract has all the necessary information.}}
                              
           @point{@student{Supongamos que queríamos hacer el satélite más grande, escalándolo hasta 2 veces o 3 veces su tamaño original. Racket tiene una función que hará exactamente eso, llamada @code{scale}. Aquí está el contrato y la declaración del propósito para scale:
                           @code[#:multi-line ""]{; scale : Number Image -> Image
                                                  ; Reproduce the given image with both dimensions multiplied
                                                  ;     by the given number}
          A continuación se muestra un código que escalará una estrella para que sea la mitad del tamaño original. ¿Qué cambiarías para hacerlo más grande en lugar de más pequeño? ¿Qué necesitaría cambiar para escalar una estrella de diferente color? ¿Y si quisieras escalar un círculo? ¿Puedes averiguar cómo escalar toda la nave espacial?
          
           @editor-link[#:interactions-text "(scale 0.5 (star 50 \"solid\" \"purple\"))"
                                                            "Veamos un ejemplo."]}
                   @teacher{}}
                              
           @point{@student{También hay funciones para mover una imagen horizontalmente o verticalmente, y para escalar las imágenes para que se vuelvan más grandes o más pequeñas. Aquí hay contratos y declaraciones de propósito para esas funciones:
                           @code[#:multi-line ""]{; flip-horizontal : Image -> Image
                                                  ; Flip the given image on the horizontal (x) axis
                                                  
                                                  ; flip-vertical : Image -> Image
                                                  ; Flip the given image on the vertical (y) axis
                                                  
                                                  ; scale/xy : Number Number Image -> Image
                                                  ; Reproduce the given image with the horizontal (x)
                                                  ; dimension multiplied by the first number and the vertical
                                                  ; (y) dimension multiplied by the second number}}
                   @teacher{After a few of these, try mixing it up! Show students the Racket code or Circle of Evaluation for some of the new functions @italic{first}, and have them guess the contract based on how they is used.}}
                   
  ]}

