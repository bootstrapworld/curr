#lang racket

(provide translations)
;;
;;The section headers refer to the sections of the output webpages generated. Note that
; there are comments for translators to indicate what each phrase is and where exactly it
; is located, and there are separate comments for developers to see where the statements
; are generated in the back end.
;Translator; Capitalization, punctuation, and spacing should be maintained to the best of your ability
;Developer; Developer comments begin with a function name. If not otherwise indicated, these methods
          ; can be found within form-elements.rkt. Alternative racket source files will be indicated next
          ; to the function name.
(define translations
  '(





    ;;;;;;;;;;;;;;;;miscellanious;;;;;;;;;;;;;;;;;

    ;Translator; this is a label to a button that flips things. Should be brief command
    ;                TODO: UNSURE OF LOCATION               ;
    ;Developer; insert-student-buttons
    (btn-flip "flip")


    

    ;Translator; IGNORE THE FOLLOWING WORDS UNTIL "copyright section"
    ;Developer; The following are links to websites to buy the workbook. If there are versions
              ; of this website in the language being translated to, place it here.
    (lulu-link "http://www.lulu.com/commerce/index.php?fBuyContent=14790241")





    ;;;;;;;;;;;;;;;;copyright section;;;;;;;;;;;;;;;;;;;;;
    ;Translator; Found at the bottom of most pages; includes all copyright information.
    ;there differing statements depending on who worked on which curriculum

        ;Translator; Names listed at bottom of most pages in the algebra curriculum, included in the copyright statement
    ;Developler; copyright for algebra
    (copyright-names-alg "Bootstrap:Algebra by Emmanuel Schanzer, Emma Youndtsmith, Kathi Fisler, and Shriram Krishnamurthi is licensed under a ")
     ;Translator; Names listed at bottom of most pages in the reactive curriculum, included in the copyright statement
    ;Developler; copyright for reactive
    (copyright-names-reac "Bootstrap:Reactive by Emmanuel Schanzer, Emma Youndtsmith, Kathi Fisler, Shriram Krishnamurthi, and Joe Politz is licensed under a ")
    ;Translator; Names listed at bottom of most pages in the physics curriculum, included in the copyright statement
    ;Developler; copyright for physics
    (copyright-names-phys "Bootstrap:Physics by Emmanuel Schanzer, Shriram Krishnamurthi, and Sam Dooman is licensed under a ")
     ;Translator; Names listed at bottom of most pages in the data-science curriculum, included in the copyright statement
    ;Developler; copyright for data-science
    (copyright-names-data "Bootstrap:Data Science by Shriram Krishnamurthi, Joe Politz and Ben Lerner is licensed under a ")

    
    ;Translator; This is the hyperlink listed within the copyright statement at the bottom of most pages.
    ;Developler; copyright
    (copyright-license "Creative Commons 4.0 Unported License")
    ;Translator; This phrase follows the hyperlink "Creatice Commons 4.0 Unported License",
               ; and is right before the "www.BootstrapWorld.org" link.
    ;Developler; copyright
    (copyright-based "Based on a work at")
    ;Translator; This statement is the last sentence in the copyright statement at the bottom of most pages
               ; Note that this does not include the hyperlink at the end of the sentence
    ;Developler; copyright
    (copyright-permissions "Permissions beyond the scope of this license may be available by contacting")
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


    ;;;;;;;;;;;;;;;;;;EXERCISE HANDOUTS;;;;;;;;;;;;;;;;;;;;;;;;;;;;


                  ;;;Design Recipe;;
    ;Translator; These exercises are title "Check This Design Recipe
    ;Developer; In design-recipe-generator.rkt

    ;Translator; This is found in the page header of every worksheet of this type.
    ;Developer; assess-design-recipe
    (design-title "Check for Mistakes in this Word Problem")

    ;Translator; It is Unclear where this appears in handouts, but is indicated to be the page-header
    ;                       TODO: LOCATE                        ;
    ;Developer; design-recipe-exercise
    (design-title2 "Word Problem")

    

    ;;
    ;Translator; This is a section header found within design recipe exercise pages
    ;Developer; design-recipe-exercise
    (design-section-contract "Contract and Purpose Statement")

    ;Translator; This is a subsection header found immediately below the section head directly above in this file^^^^
    ;Developer; design-recipe-exercise
    (design-subheader-contract "Every contract has three parts")
    ;;



    ;;
    ;Translator; This is a section header found within design recipe exercise pages
    ;Developer; design-recipe-exercise
    (design-section-examples "Examples")

    ;Translator; This is a subsection header found immediately below the section head directly above in this file^^^^
    ;Developer; design-recipe-exercise
    (design-subheader-examples "Write some examples, then circle and label what changes")
    ;;



    ;;
    ;Translator; This is a section header found within design recipe exercise pages
    ;Developer; design-recipe-exercise
    (design-section-def "Definition")

    ;Translator; This is a subsection header found immediately below the section head directly above in this file^^^^
    ;Developer; design-recipe-exercise
    (design-subheader-def "Write the definition, given variable names to all your input values")
    ;;


    ;Translator; This is found within the body of the Examples section of Design Recipe pages; It is the all-caps beginning (following
               ; an open paren) to examples of function calls
    ;Developer; design-recipe-exercise
    (design-example-caps "EXAMPLE")





                 ;;Contract;;

    ;Translator; These labels DO NOT currently appear, but would provide labels to the three parts of "Contract" structure, in this order, found in Unit 3. Examples
               ; of this can be found in pages 9 and 10 and the student workbook
    ;Developer; This is printed only when generating a pdf or tex version of the exercise worksheets; HTML ignores it.
    (contract-name "Name")
    (contract-domain "Domain")
    (contract-range "Range")




                 ;;Matching;;

    ;Translator; This currently DOES NOT appear in any worksheets or solutions.
               ; This would appear in the solution key to a matching exercise. This indicates the correct answer is the statement
               ; following this key, rather than a command for a student to provide an answer
    ;Developer; attach-exercise-answer
    (exercise-answer "Answer")

    ;Translator; This appears in the solution document to matching exercises in the right column when nothing in
               ; the left column matches with it. This can be seen in the teacher solutions to matching exercises in Unit 1
    ;Developer; matching-exercise-answers (exercise-generator.rkt)
    (exercise-noAnswer "No matching answer")

    ;Translator; This is essetially the same as above, but is used when asserting a specific item has no answer; that item would
               ; follow this statement. Example: "No match for (message-cost 15)"
    (exercise-noMatch "No match for")

    

    ;Translator; This is going in the title of example handouts (either prepended to a title or standing alone as the title)
    ;Developer; exercise-handout
    (exercise "Exercise")

    ;Translator; This goes before the directions provided to students on exercise handouts
    ;Developer; exercise-handout & design-recipe-exercise (in design-recipe-generator.rkt)
    ;                           TODO: Why is this called twice?                       ;
    (directions "Directions")
    

                  ;;;Special Keywords;;;
    ;Translator; These words are searched for within the instructions of exercise handouts so they can
               ; be specially italicized. Therefore, the translations given below should match the translations used
               ; when entering the instructions to generate an exercise handout
    ;Developer; exercise-terms-to-italicize
    (c-eval "Circle of Evaluation")
    (low-a-exp "arithmetic Expression")
    (cap-a-exp "Arithmetic Expression")
    (exp "Expression")
    (example "Example")
    (contract "Contract")
    (code "code")

    





    



    ;;;;;;;;;;;;;;;;UNIT;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




                ;;;Title;;;
    ;Translator; This is the word that goes at the very top of the page, indicating what unit it is. IT will
               ; followed by the number of what unit it is. Example: "Unit 3"
    ;Developer; unit-summary-links
    (unit "Unit")



    ;;;;;;;;;;;;;;;Button Box;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;Translator; This is the box that floats on the top right corner of the page, with the
               ; buttons "[Show/Hide] Teacher Notes", "Discussion Group", and "Slides".
    ;Developer; insert-teacher-toggle-button

    ;Translator;
    (btn-show "Show Teacher Notes")
    (btn-hide "Hide Teacher Notes")
    (btn-group "Discussion Group")
    (btn-slide "Slides")




    ;;;;;;;;;;;;;;;Intro Section;;;;;;;;;;;;;;
    ;Translator; This is the gray box at the beginning of each unit page that contains overview information
    ;Developer; agenda


             ;;;Length Marker;;;
    ;Translator; This is found directly above the Glossary in the intro section. This indicates the total
               ; the total time of the unit lesson
    ;Developer; length-of-lesson
    (length "Length")
    (minutes "Minutes")

    
             ;;;Bootstrap Language Table;;;
    ;Translator; Found at the bottom of the intro/overview section at the beginning of unit pages

    ;Translator; Headers of the Bootstrap Language Table
    ;Developer; language-table
    (lang-table-types "Types")
    (lang-table-func "Functions")



             ;;;Standards Subtitle

    ;Translator; IGNORE THE FOLLOWING 2 LINES. This is a link that developers will alter
    ;Developer; This link will need to be changed based on what language you're in
    (s-link "http://www.bootstrapworld.org/materials/Standards.shtml")

    
    ;Translator; The subtitle/description found beneath Standards and Evidence Statements.
               ; NOTE that these three phrases appear together in the order listed- they should
               ; be translated to be read clearly in succession, together.
    ;Developer; learn-evid-from-standards
    (standards-stitle "Standards with prefix BS are specific to Bootstrap; others are from the Common Core. Mouse over each standard to see its corresponding evidence statements. Our")
    ;Translator; This is the Standards Document hyperlink text found within
               ; the subtitle of the Standards and Evidence Statements section
    (standards-link "Standards Document")
    (standards-rest "shows which units cover each standard")




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
    (iHeader-glossary "Glossary")

     ;Translator; This is the overview header, which is repressed by css
    ;Developer; lesson/studteach
    (iHeader-overview "Overview")




    ;Translator; All of these are headers found within the intro/overview section at the
               ; beginning of unit pages
    ;Developer; all functions are found underneath "Section of Units"
    ;                    WARNING: REPRESSED STRING                         ;
    ; -repressed by unit-overview/auto
    ;
    ; These are also used within lesson/studteach because they are the same phrases
    (iHeader-materials "Materials and Equipment")
    ;Developer; lesson/studteach
    (iHeader-mat "Materials")
    (iHeader-learning "Learning Objectives")
    (iHeader-evidence "Evidence Statementes")
    (iHeader-product "Product Outcomes")
    (iHeader-exercises "Exercises")
    (iHeader-preparation "Preparation")
    ;Developer; learn-evid-from-standards
    (iHeader-standards "Standards and Evidence Statements")





                            ;;;Lesson Sections;;;

               ;;;Additional Exercises;;;
    ;Translator; This is the label for the additional exercises found at the bottom of the page
    ;Developer; gen-exercises
    (add-exer "Additional Exercises")

    ;Translator; This is the label for the additional Teacher Contributions found at the bottom of
               ; the page. NOTE: As of 5/7/17, this is not yet live on the website but would function
               ; the same as Additional Exercises above
    ;Developer; gen-exercises
    (add-teacher-contr "Additional Exercises from Bootstrap Teachers")
    
    ;Translator; This is something added to certain exercise link titles (See Unit 4 for examples)
               ; This is a directive.
    (checkDR "Check This Design Recipe")

               ;;; teacher submissions ;;;
    ;Translator; These form the structure of the sentence describing a teacher sumbission, found (only if they occur) at the bottom of unit page
    ;an example: TITLE: submitted by TEACHER, a teacher at SCHOOL. designed for students in grade GRADE

    ;Developer; gen-exercises
    (submitted-by "submitted by")
    (teach-at "a teacher at")
    (grade-for "designed for students in grade")

    
               ;;; Section headers ;;;
    ;Translator; this is the time listed on the righ of every purple block of the
               ;lesson sections. simply change the word for time or duration
    ;Developer; lesson/studteach
    (sHeader-duration "Time")

               ;;; Section Bodies ;;;
    ;Translator; This is the text associated with a link that sends the student to the student workbook.
               ; This is meant to say "Page" which will be followed by a page number
    ;Developer; worksheet-link
    (page "Page")
    



    ))
