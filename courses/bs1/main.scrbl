#lang curr/lib
@(elem #:style "BSCourseName" "Bootstrap:1")

Curious about how Bootstrap aligns with the math standards in your area? 
Our @(hyperlink "https://spreadsheets.google.com/a/brown.edu/pub?key=0Ak3Voejjnf0ldHlQcXRVWTZDbVprWHlBLTJWRlQ2dkE&hl=en&gid=0" "Standards Matrix") compares each lesson to a variety of state standards, as well as the new Common Core Standards.

We also offer several @bold{@(hyperlink "resources/teachers/" "teachers-only materials")}, including an answer key to the student workbook, a quick-start guide to making the final project, and pre- and post-tests for teachers who are paticipating in our research study. For access to these materials, please fill out the @(hyperlink "https://docs.google.com/a/bootstrapworld.org/spreadsheet/viewform?formkey=dHpQc0VHV2dBU2tSN1ptMktBUmtoZWc6MQ#gid=0" "password request form"). We'll get back to you soon with the necessary login information.

@; workbook link names and targets

@(apply itemlist
        (append
         (list 
          @summary-item/links["Student Workbook" "resources/workbook/StudentWorkbook" #:label1 "PDF" #:ext1 "pdf" #:label2 "OpenOffice" #:ext2 "odt"]{
           The lesson plans linked below are tightly integrated into the Student Workbook, 
           which should be used with the curriculum. Solutions to the problems in the workbook are also available as part of our teacher-only materials.})
         (for/list ([n (in-range 1 (add1 10))])
           (unit-summary/links n))
         (list 
          @summary-item/links["Supplemental Lessons" "units/Supplemental/the-unit"]{
           for teachers looking for additional exercises, we have compiled many activities for students 
           to go deeper into the material. Have students use composition and coordinates to create flags for 
           their countries of origin, or for a country they want to make up! 
           Have them use @emph{randomness} and @emph{trigonometric functions} for more sophisticated motion, 
           or introduce @emph{data structures} for more sophisticated games!})
          ))
            
@(copyright)
