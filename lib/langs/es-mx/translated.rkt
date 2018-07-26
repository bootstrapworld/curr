;(provide translations)
;;SPANISH
;;The section headers refer to the sections of the output webpages generated. Note that
; there are comments for translators to indicate what each phrase is and where exactly it
; is located, and there are separate comments for developers to see where the statements
; are generated in the back end.
;Translator; Capitalization, punctuation, and spacing should be maintained to the best of your ability
;Developer; Developer comments begin with a function name. If not otherwise indicated, these methods
          ; can be found within form-elements.rkt. Alternative racket source files will be indicated next
          ; to the function name.
;(define translations
  (





    ;;;;;;;;;;;;;;;;miscellanious;;;;;;;;;;;;;;;;;

    ;Translator; this is a label to a button that flips things. Should be brief command
    ;                TODO: UNSURE OF LOCATION               ;
    ;Developer; insert-student-buttons
    (btn-flip "Voltear")


    

    ;Translator; IGNORE THE FOLLOWING WORDS UNTIL "copyright section"
    ;Developer; The following are links to websites to buy the workbook. If there are versions
              ; of this website in the language being translated to, place it here.
    (lulu-link "http://www.lulu.com/commerce/index.php?fBuyContent=14790241")

    ;;;;;;;;;;;;;;;;;languages;;;;;;;;;;;;;;;;;;;;
    ;Translator; these are the labels for links to bootstrap pages in other languages.
               ; These should be the titles of languages as spoken in this language (right now, English)
    (en-us "Ingles")  ;; Mario team should check
    (es-mx "Espanol")

    

    ;;;;;;;;;;;;;;;;copyright section;;;;;;;;;;;;;;;;;;;;;
    ;Translator; Found at the bottom of most pages; includes all copyright information

    ;Translator; Names listed at bottom of most pages, included in the copyright statement
    ;Developler; copyright
    (copyright-names-alg "Bootstrap:Algebra por Emmanuel Schanzer, Emma Youndtsmith, Kathi Fisler, and Shriram Krishnamurthi está licenciado bajo ")
     ;Translator; Names listed at bottom of most pages in the reactive curriculum, included in the copyright statement
    ;Developler; copyright for reactive
    (copyright-names-reac "Bootstrap:Reactive por Emmanuel Schanzer, Emma Youndtsmith, Kathi Fisler, Shriram Krishnamurthi, and Joe Politz está licenciado bajo ")
    ;Translator; Names listed at bottom of most pages in the physics curriculum, included in the copyright statement
    ;Developler; copyright for physics
    (copyright-names-phys "Bootstrap:Physics por Shriram Krishnamurthi, Joe Politz and Ben Lerner está licenciado bajo ")
     ;Translator; Names listed at bottom of most pages in the data-science curriculum, included in the copyright statement
    ;Developler; copyright for data-science
    (copyright-names-data "Bootstrap:Data Science por Emmanuel Schanzer, Shriram Krishnamurthi, and Sam Dooman está licenciado bajo ")

    ;Translator; This is the hyperlink listed within the copyright statement at the bottom of most pages.
    ;Developler; copyright
    (copyright-license "Creative Commons 4.0 Unported License")
    ;Translator; This phrase follows the hyperlink "Creatice Commons 4.0 Unported License",
               ; and is right before the "www.BootstrapWorld.org" link.
    ;Developler; copyright
    (copyright-based " Basado en un trabajo en")
    ;Translator; This statement is the last sentence in the copyright statement at the bottom of most pages
               ; Note that this does not include the hyperlink at the end of the sentence
    ;Developler; copyright
    (copyright-permissions "Los permisos que excedan el alcance de esta licencia pueden estar disponibles poniéndose en contacto con")
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


    ;;;;;;;;;;;;;;;;;;EXERCISE HANDOUTS;;;;;;;;;;;;;;;;;;;;;;;;;;;;


                  ;;;Design Recipe;;
    ;Translator; These exercises are title "Check This Design Recipe
    ;Developer; In design-recipe-generator.rkt

    ;Translator; This is found in the page header of every worksheet of this type.
    ;Developer; assess-design-recipe
    (design-title "Comprueba si hay errores en este problema de palabras")

    ;Translator; It is Unclear where this appears in handouts, but is indicated to be the page-header
    ;                       TODO: LOCATE                        ;
    ;Developer; design-recipe-exercise
    (design-title2 "Problema de palabras")

    

    ;;
    ;Translator; This is a section header found within design recipe exercise pages
    ;Developer; design-recipe-exercise
    (design-section-contract "Declaración de contrato y propósito")

    ;Translator; This is a subsection header found immediately below the section head directly above in this file^^^^
    ;Developer; design-recipe-exercise
    (design-subheader-contract "Todo contrato tiene 3 partes")
    ;;



    ;;
    ;Translator; This is a section header found within design recipe exercise pages
    ;Developer; design-recipe-exercise
    (design-section-examples "Ejemplos")

    ;Translator; This is a subsection header found immediately below the section head directly above in this file^^^^
    ;Developer; design-recipe-exercise
    (design-subheader-examples "Escribe algunos ejemplos, luego circula y marca los cambios")
    ;;



    ;;
    ;Translator; This is a section header found within design recipe exercise pages
    ;Developer; design-recipe-exercise
    (design-section-def "Definición")

    ;Translator; This is a subsection header found immediately below the section head directly above in this file^^^^
    ;Developer; design-recipe-exercise
    (design-subheader-def "Escribe la definición, nombres de variables a todos sus valores de entrada")
    ;;


    ;Translator; This is found within the body of the Examples section of Design Recipe pages; It is the all-caps beginning (following
               ; an open paren) to examples of function calls
    ;Developer; design-recipe-exercise
    (design-example-caps "EXAMPLE")





                 ;;Contract;;

    ;Translator; These labels DO NOT currently appear, but would provide labels to the three parts of "Contract" structure, in this order, found in Unit 3. Examples
               ; of this can be found in pages 9 and 10 and the student workbook
    ;Developer; This is printed only when generating a pdf or tex version of the exercise worksheets; HTML ignores it.
    (contract-name "Nombre")
    (contract-domain "Dominio")
    (contract-range "Rango")




                 ;;Matching;;

    ;Translator; This currently DOES NOT appear in any worksheets or solutions.
               ; This would appear in the solution key to a matching exercise. This indicates the correct answer is the statement
               ; following this key, rather than a command for a student to provide an answer
    ;Developer; attach-exercise-answer
    (exercise-answer "Respuesta")

    ;Translator; This appears in the solution document to matching exercises in the right column when nothing in
               ; the left column matches with it. This can be seen in the teacher solutions to matching exercises in Unit 1
    ;Developer; matching-exercise-answers (exercise-generator.rkt)
    (exercise-noAnswer "Ninguna respuesta coincide")

    ;Translator; This is essetially the same as above, but is used when asserting a specific item has no answer; that item would
               ; follow this statement. Example: "No match for (message-cost 15)"
    (exercise-noMatch "No hay coincidencia para")

    

    ;Translator; This is going in the title of example handouts (either prepended to a title or standing alone as the title)
    ;Developer; exercise-handout
    (exercise "Ejercicio")

    ;Translator; This goes before the directions provided to students on exercise handouts
    ;Developer; exercise-handout & design-recipe-exercise (in design-recipe-generator.rkt)
    ;                           TODO: Why is this called twice?                       ;
    (directions "Direcciones")
    

                  ;;;Special Keywords;;;
    ;Translator; These words are searched for within the instructions of exercise handouts so they can
               ; be specially italicized. Therefore, the translations given below should match the translations used
               ; when entering the instructions to generate an exercise handout
    ;Developer; exercise-terms-to-italicize
    (c-eval "Círculo de evaluación")
    (low-a-exp "Expresión aritmética")
    (cap-a-exp "Expresión aritmética")
    (exp "Expresión")
    (example "EXAMPLE")
    (contract "Contrato")
    (code "Código")

    





    



    ;;;;;;;;;;;;;;;;UNIT;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




                ;;;Title;;;
    ;Translator; This is the word that goes at the very top of the page, indicating what unit it is. IT will
               ; followed by the number of what unit it is. Example: "Unit 3"
    ;Developer; unit-summary-links
    (unit "Unidad")



    ;;;;;;;;;;;;;;;Button Box;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;Translator; This is the box that floats on the top right corner of the page, with the
               ; buttons "[Show/Hide] Teacher Notes", "Discussion Group", and "Slides".
    ;Developer; insert-teacher-toggle-button

    ;Translator;
    (btn-show "Mostrar Notas")
    (btn-hide "Ocultar notas del profesor")
    (btn-group "Grupo de discusión")
    (btn-slide "Diapositivas")




    ;;;;;;;;;;;;;;;Intro Section;;;;;;;;;;;;;;
    ;Translator; This is the gray box at the beginning of each unit page that contains overview information
    ;Developer; agenda


             ;;;Length Marker;;;
    ;Translator; This is found directly above the Glossary in the intro section. This indicates the total
               ; the total time of the unit lesson
    ;Developer; length-of-lesson
    (length "Duración")
    (minutes "Minutos")

    
             ;;;Bootstrap Language Table;;;
    ;Translator; Found at the bottom of the intro/overview section at the beginning of unit pages

    ;Translator; Headers of the Bootstrap Language Table
    ;Developer; language-table
    (lang-table-types "Tipos")
    (lang-table-func "Funciones")
    (lang-table-vals "Values")   ; NEEDS SPANISH



             ;;;Standards Subtitle

    ;Translator; IGNORE THE FOLLOWING 2 LINES. This is a link that developers will alter
    ;Developer; This link will need to be changed based on what language you're in
    (s-link "http://www.bootstrapworld.org/materials/Standards.shtml")

    
    ;Translator; The subtitle/description found beneath Standards and Evidence Statements.
               ; NOTE that these three phrases appear together in the order listed- they should
               ; be translated to be read clearly in succession, together.
    ;Developer; learn-evid-from-standards
    (standards-stitle "
Los estándares con el prefijo BS son específicos de Bootstrap; Otros son del Common Core. Pase el mouse sobre cada estándar para ver sus correspondientes declaraciones de evidencia. Nuestra")
    ;Translator; This is the Standards Document hyperlink text found within
               ; the subtitle of the Standards and Evidence Statements section
    (standards-link "Documento de estándares")
    (standards-rest "Muestra qué unidades cubren cada estándar")




             ;;;Agenda;;;
    ;Translator; This is the White Agenda box in the top right that provides a listing of what sections are in that unit

    ;Translator; Title of Agenda box
    (agenda-title "Agenda")
    ;Translator; Note that in English this is the word "minutes" abbreviated to "min". This is what is listed next to the
               ; timing of each section. Example: "Section 1   10 min"
    (agenda-min "min")




             ;;;Headers;;;

    ;Translator; This is the Glossary header
    ;Developer; gen-glossary
    (iHeader-glossary "Glosario")

     ;Translator; This is the overview header, which is repressed by css
    ;Developer; lesson/studteach
    (iHeader-overview "Repaso")




    ;Translator; All of these are headers found within the intro/overview section at the
               ; beginning of unit pages
    ;Developer; all functions are found underneath "Section of Units"
    ;                    WARNING: REPRESSED STRING                         ;
    ; -repressed by unit-overview/auto
    ;
    ; These are also used within lesson/studteach because they are the same phrases
    (iHeader-materials "Materiales y equipamiento")
    ;Developer; lesson/studteach
    (iHeader-mat "Materiales")
    (iHeader-learning "Objetivos de aprendizaje")
    (iHeader-evidence "Declaraciones de evidencia")
    (iHeader-product "Resultados del Producto")
    (iHeader-exercises "Exercises")
    (iHeader-preparation "Preparación")
    ;Developer; learn-evid-from-standards
    (iHeader-standards "Normas y declaraciones de evidencia")





                            ;;;Lesson Sections;;;

               ;;;Additional Exercises;;;
    ;Translator; This is the label for the additional exercises found at the bottom of the page
    ;Developer; gen-exercises
    (add-exer "Ejercicios adicionales")
    ;Translator; This is something added to certain exercise link titles (See Unit 4 for examples)
               ; This is a directive.
    (checkDR "Compruebe esta receta del diseño")
    
               ;;; Section headers ;;;
    ;Translator; this is the time listed on the righ of every purple block of the
               ;lesson sections. simply change the word for time or duration
    ;Developer; lesson/studteach
    (sHeader-duration "Tiempo")

               ;;; Section Bodies ;;;
    ;Translator; This is the text associated with a link that sends the student to the student workbook.
               ; This is meant to say "Page" which will be followed by a page number
    ;Developer; worksheet-link
    (page "Página")
    



    ))

