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


    ;;;;;;;;;;;;;;;Bootstrap Language Table;;;;;;;;;;;;;;
    ;Translator; Found at the bottom of the intro/overview section at the beginning of unit pages

    ;Translator; Headers of the Bootstrap Language Table
    ;Developer; language-table
    (lang-table-types "Types")
    (lang-table-func "Functions")


    ;;;;;;;;;;;;;;;Intro Section;;;;;;;;;;;;;;
    ;Translator; This is the gray box at the beginning of each unit page that contains overview information
    ;Developer; agenda

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
    (gloss-title "Glossary")
    
    
    
    ;Translator; All of these are headers found within the intro/overview section at the
               ; beginning of unit pages
    ;Developer; all functions are found underneath "Section of Units"
    ;                    WARNING: REPRESSED STRING                         ;
    ; -repressed by unit-overview/auto
    ;
    ; These are also used within lesson/studteach because they are the same phrases
    (iHeader-materials "Materials and Equipment")
    (iHeader-mat "Materials")
    (iHeader-learning "Learning Objectives")
    (iHeader-evidence "Evidence Statementes")
    (iHeader-product "Product Outcomes")
    (iHeader-exercises "Exercises")
    (iHeader-preparation "Preparation")
    

    


    ;;;;;;;;;;;;;;;;;;;;;;Lesson Sections;;;;;;;;;;;;;;;;;;;;;;;;;

    ;Translator; This does not appear in the output document. It is simpl

    

    
    )

