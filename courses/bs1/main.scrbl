#lang curr/lib
@(elem #:style "BSCourseName" "BS1 Course Materials")

Start teaching Bootstrap today, and 
@(hyperlink "https://docs.google.com/a/brown.edu/spreadsheet/viewform?formkey=dEJSZzNIdk5TekthRVJ6N2oyTlItZHc6MQ#gid=0" "be counted!") 
We'll make sure to keep you updated on curricular changes, Bootstrap events, and workshops in your area!

Curious about how Bootstrap aligns with the math standards in your area? 
Our @(hyperlink "https://spreadsheets.google.com/a/brown.edu/pub?key=0Ak3Voejjnf0ldHlQcXRVWTZDbVprWHlBLTJWRlQ2dkE&hl=en&gid=0" "Standards Matrix") 
compares each lesson to a variety of state standards, as well as the new Common Core Standards.

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
           For teachers looking for additional exercises, we have compiled many activities for students 
           to go deeper into the material. Have students use composition and coordinates to create flags for 
           their countries of origin, or for a country they want to make up! 
           Have them use @emph{randomness} and @emph{trigonometric functions} for more sophisticated motion, 
           or introduce @emph{data structures} for more sophisticated games!}
          @summary-item/links["Teacher's Guide" "resources/teachers-guide/teachers-guide"]{
                are also available for teachers who'd like a "quick start" reference to
                all the various functionality in the @hyperlink["http://www.wescheme.org/openEditor?publicId=champ-venue-piggy-stuck-taffy"]{Game Template}.}
          @summary-item/custom["Support Forums" @(list (hyperlink "https://groups.google.com/d/forum/bootstrap-announce" "Announcements")
                                                       (hyperlink "https://groups.google.com/d/forum/bootstrap-discuss" "Discussion"))]{
            Want to be kept up-to-date about Bootstrap events, workshops, and curricular changes? 
            Want to ask a question or pose a lesson idea for other Bootstrap teachers? 
            These forums are the place to do it.}
          )
         ))
            
@(copyright)
