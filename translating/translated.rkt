#lang racket

(provide glossary)
;;
;;The section headers refer to the sections of the output webpages generated. Note that
; there are comments for translators to indicate what each phrase is and where exactly it
; is located, and there are separate comments for developers to see where the statements
; are generated in the back end.
;Developer; Developer comments begin with a function name. If not otherwise indicated, these methods
          ; can be found within form-elements.rkt. Alternative racket source files will be indicated next
          ; to the function name.
(define glossary
  '(





    ;;;;;;;;;;;;;;;;miscellanious;;;;;;;;;;;;;;;;;

    ;Translator; this is a label to a button that flips things. Should be brief command
    ;                TODO: UNSURE OF LOCATION               ;
    ;Developer; insert-student-buttons
    (btn-flip "flip")


    ;;;;;;;;;;;;;;;;copyright section;;;;;;;;;;;;;;;;;;;;;
    ;Translator; Found at the bottom of most pages; includes all copyright information

    ;Translator; Names listed at bottom of most pages, included in the copyright statement
    ;Developler; copyright
    (copyright-names "Bootstrap by Emmanuel Schanzer, Emma Youndtsmith, Kathi Fisler, Shriram Krishnamurthi, Joe Politz and Ben Lerner is licensed under a ")
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
    (btn-group "Discussion Group")
    (btn-slide "Slides")




    ;;;;;;;;;;;;;;;Intro Section;;;;;;;;;;;;;;
    ;Translator; This is the gray box at the beginning of each unit page that contains overview information
    ;Developer; agenda


             ;;;Bootstrap Language Table;;;
    ;Translator; Found at the bottom of the intro/overview section at the beginning of unit pages

    ;Translator; Headers of the Bootstrap Language Table
    ;Developer; language-table
    (lang-table-types "Types")
    (lang-table-func "Functions")



             ;;;Standards Subtitle
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





    ;;;;;;;;;;;;;;;;;;;;;;Lesson Sections;;;;;;;;;;;;;;;;;;;;;;;;;
               ;;; Section headers ;;;
    ;Translator; this is the time listed on the righ of every purple block of the
               ;lesson sections. simply change the word for time or duration
    ;Developer; lesson/studteach
    (sHeader-duration "Time")



    ))
