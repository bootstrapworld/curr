#lang curr/lib

@main-contents{
@(elem #:style bs-coursename-style "Bootstrap:Algebra")

@boxed-text{@animated-gif{../../splash.png}Bootstrap: Algebra (o "Bootstrap: 1") aplica conceptos matemáticos y principios de programación rigurosos a la creación de un videojuego simple, y está alineado con los
                         @(hyperlink "../../../../Standards.shtml" "Estándares Nacionales y Estatales") para Matemáticas, así como los estándares CSTA y K12CS. Los estudiantes crean un juego simple de 3 caracteres que involucra a un jugador, un objetivo y un peligro. Diseñan el aspecto de cada personaje y utilizan conceptos algebraicos para detectar colisiones, manejar las pulsaciones de teclas y determinar cómo se mueven e interactúan.}

@bold{@(hyperlink "http://www.BootstrapWorld.org/workshops" "Haz clic aquí para nuestros próximos entrenamientos")}

@; workbook link names and targets
Proporcionamos todos nuestros materiales @italic{de forma gratuita}, a cualquier persona que esté interesada en usar nuestros planes de lección o libros de ejercicios para estudiantes. 
@(apply itemlist
        (append
         (for/list ([n (in-range 1 (add1 9))])
           (unit-summary/links n))
         (list 
          @summary-item/unit-link["Lecciones suplementarias" "units/Supplemental/index"]{
            Para los maestros que buscan ejercicios adicionales, hemos compilado muchas actividades para que los estudiantes profundicen en el material. Pida a los estudiantes que usen la composición
                 y las coordenadas para crear banderas para sus países de origen, o para un país que quieren compensar. Pídales que utilicen @emph{funciones aleatorias}
                 y @emph{trigonométricas} para movimientos más sofisticados o introduzcan @emph{estructuras de datos} para juegos más sofisticados.
           }
          )
         (list 
          @summary-item/no-link["Libro de Trabajo del Estudiante"]{
           @lulu-button[]
            Puedes comprar hermosas copias encuadernadas del libro en @hyperlink["http://www.lulu.com/commerce/index.php?fBuyContent=14790241" "Lulu.com"], 
               or @hyperlink["resources/workbook/StudentWorkbook.pdf" "o puedes imprimir tus propias copias"].
               Los planes de lecciones están estrechamente integrados con el Libro de Trabajo del Estudiante, el cual debe ser usado con el plan de estudios. Una
               @bold{Edición del Maestro} también está disponible
           @hyperlink["https://docs.google.com/a/bootstrapworld.org/spreadsheet/viewform?formkey=dHpQc0VHV2dBU2tSN1ptMktBUmtoZWc6MQ#gid=0"]{bajo petición}. }
           
          @item{@italic{Importantes descuentos en libros impresos están disponibles para los maestros que asisten a nuestros talleres de desarrollo profesional.} 
           @hyperlink["mailto:contact@bootstrapworld.org" "Contáctenos"] para obtener más información.}
          )
         )
         #:style "BSUnitList"
)

Por supuesto, hay más a un plan de estudios que el software y planes de lecciones! También proporcionamos una serie de recursos a los educadores, incluyendo las normas del estándar, las respuestas para los ejercicios de programación y foros donde pueden hacer preguntas y compartir ideas. 
@itemlist[#:style "BSResourceList"
        @item{@(hyperlink "resources/teachers/index.shtml" "Recursos para maestros" ) - También ofrecemos varios materiales para los maestros, incluyendo una clave de respuestas para el libro del estudiante, una guía de inicio rápido para hacer el proyecto final, exámenes previos y posteriores para los maestros que están participando en nuestra investigación. Para acceder a estos materiales, rellene el @(hyperlink "https://docs.google.com/a/bootstrapworld.org/spreadsheet/viewform?formkey=dHpQc0VHV2dBU2tSN1ptMktBUmtoZWc6MQ#gid=0" "formulario de solicitud de contraseña"). Pronto nos pondremos en contacto con usted con la información de inicio de sesión necesaria para acceder.}

          @summary-item/custom["Foros de Soporte" @(list (hyperlink "https://groups.google.com/d/forum/bootstrap-announce" "Anuncios")
                                                       (hyperlink "https://groups.google.com/d/forum/bootstrap-discuss" "Discusión"))]{
            ¿Quiere mantenerse al día sobre los eventos Bootstrap, talleres y cambios en el plan de estudios? ¿Quieres hacer una pregunta o plantear una idea de lección para otros maestros de Bootstrap? Estos foros son el lugar para hacerlo.}
]
            
@(copyright)
}
