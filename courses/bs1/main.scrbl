#lang curr/lib
@(elem #:style "BSCourseName" "BS1 Course Materials")

Curious about how Bootstrap aligns with the math standards in your area? 
Our @(hyperlink "https://spreadsheets.google.com/a/brown.edu/pub?key=0Ak3Voejjnf0ldHlQcXRVWTZDbVprWHlBLTJWRlQ2dkE&hl=en&gid=0" "Standards Matrix") 
compares each lesson to a variety of state standards, as well as the new Common Core Standards.


We also offer several @bold{@(hyperlink "http://www.bootstrapworld.org/preview/materials/resources/teachers/" "teachers-only materials")}, including an answer key to the student workbook, a quick-start guide to making the final project, and pre- and post-tests for teachers who are paticipating in our research study. For access to these materials, please fill out the @(hyperlink "https://docs.google.com/a/bootstrapworld.org/spreadsheet/viewform?formkey=dHpQc0VHV2dBU2tSN1ptMktBUmtoZWc6MQ#gid=0" "password request form"). We’ll get back to you soon with the necessary login information.

@; workbook link names and targets

@(apply itemlist
        (append
         (list 
          @summary-item/links["Student Workbook" "resources/workbook/StudentWorkbook" #:label1 "PDF" #:ext1 "pdf" #:label2 "OpenOffice" #:ext2 "odt"]{
           The lesson plans linked below are tightly integrated into the Student Workbook, 
           which should be used with the curriculum. A @bold{Teacher's Edition} is also available upon request. 
           Please fill out a request using our 
           @hyperlink["https://docs.google.com/a/bootstrapworld.org/spreadsheet/viewform?formkey=dHpQc0VHV2dBU2tSN1ptMktBUmtoZWc6MQ#gid=0"]{online form}, and we'll get back to you right away.})
         (for/list ([n (in-range 1 (add1 10))])
           (unit-summary/links n))
         (list 
          @summary-item/links["Supplemental Lessons" "units/Supplemental/the-unit"]{
           for teachers looking for additional exercises, we have compiled many activities for students 
           to go deeper into the material. Have students use composition and coordinates to create flags for 
           their countries of origin, or for a country they want to make up! 
           Have them use @emph{randomness} and @emph{trigonometric functions} for more sophisticated motion, 
           or introduce @emph{data structures} for more sophisticated games!}
          @summary-item/links["Teacher's Guide" "resources/teachers-guide/teachers-guide"]{
                are also available for teachers who'd like a "quick start" reference to
                all the various functionality in the @hyperlink["http://www.wescheme.org/openEditor?publicId=champ-venue-piggy-stuck-taffy"]{Game Template}.})
          ))
            
@(copyright)
