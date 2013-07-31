#lang curr/lib

@main-contents{
@(elem #:style "BSCourseName" "Bootstrap:1")

Would you like to attend a Bootstrap Workshop? Check our
@(hyperlink "http://www.BootstrapWorld.org/workshops" "workshops page") to stay up-to-date on our workshop schedule. Don't see a workshop in your area? Let us know, and we'll work with you to bring one to your school or district.

@; workbook link names and targets

We provide all of the our materials @italic{free of charge}, to anyone who is interested in using our lesson plans or student workbooks.
@(apply itemlist
        (append
         (list 
          @summary-item/links["Student Workbook" "resources/workbook/StudentWorkbook" #:label1 "PDF" #:ext1 "pdf" #:label2 "OpenOffice" #:ext2 "odt"]{
           The lesson plans linked below are tightly integrated into the Student Workbook, 
           which should be used with the curriculum. A @bold{Teacher's Edition} is also available upon request. 
           Please fill out a request using our @hyperlink["https://docs.google.com/a/bootstrapworld.org/spreadsheet/viewform?formkey=dHpQc0VHV2dBU2tSN1ptMktBUmtoZWc6MQ#gid=0"]{online form}, and we'll get back to you right away.})
         (for/list ([n (in-range 1 (add1 10))])
           (unit-summary/links n))
         (list 
          @summary-item/unit-link["Supplemental Lessons" "units/Supplemental/the-unit"]{
           For teachers looking for additional exercises, we have compiled many activities for students 
           to go deeper into the material. Have students use composition and coordinates to create flags for 
           their countries of origin, or for a country they want to make up! 
           Have them use @emph{randomness} and @emph{trigonometric functions} for more sophisticated motion, 
           or introduce @emph{data structures} for more sophisticated games!}
          )
         ))

Of course, there's more to a curriculum than software and lesson plans! We also provide a number of resources to educators, including standards alignment, an answer key for the programming exercises and forums where they can ask questions and share ideas. 
@(apply itemlist
        (append
         (list 
           @item{@(hyperlink "resources/teachers/" "Teacher-Only Resources" ) - We also offer several teachers-only materials, including an answer key to the student workbook, a quick-start guide to making the final project, and pre- and post-tests for teachers who are paticipating in our research study. For access to these materials, please fill out the @(hyperlink "https://docs.google.com/a/bootstrapworld.org/spreadsheet/viewform?formkey=dHpQc0VHV2dBU2tSN1ptMktBUmtoZWc6MQ#gid=0" "password request form"). We’ll get back to you soon with the necessary login information.}
          @item{@(hyperlink "../../Standards.shtml" "Standards Alignment") - Find out how Bootstrap aligns with Common Core Standards for Mathematics, as well as the standards for Mathematical Practice. }
          @summary-item/custom["Support Forums" @(list (hyperlink "https://groups.google.com/d/forum/bootstrap-announce" "Announcements")
                                                       (hyperlink "https://groups.google.com/d/forum/bootstrap-discuss" "Discussion"))]{
            Want to be kept up-to-date about Bootstrap events, workshops, and curricular changes? 
            Want to ask a question or pose a lesson idea for other Bootstrap teachers? 
            These forums are the place to do it.}
          )
         ))
            
@(copyright)
}
