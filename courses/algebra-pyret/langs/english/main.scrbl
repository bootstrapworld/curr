#lang curr/lib

@main-contents{
@(elem #:style bs-coursename-style "Bootstrap:Algebra (Pyret)")

@; workbook link names and targets

We provide all of the our materials @italic{free of charge}, to anyone who is interested in using our lesson plans or student workbooks.
@(apply itemlist
        (append
         (for/list ([n (in-range 1 (add1 9))])
           (unit-summary/links n))
         (list 
          @summary-item/unit-link["Supplemental Lessons" "units/Supplemental/index"]{
           For teachers looking for additional exercises, we have compiled many activities for students 
           to go deeper into the material. Have students use composition and coordinates to create flags for 
           their countries of origin, or for a country they want to make up! 
           Have them use @emph{randomness} and @emph{trigonometric functions} for more sophisticated motion, 
           or introduce @emph{data structures} for more sophisticated games!}
          )
         (list 
          @summary-item/no-link["Student Workbook"]{
               You can download your own copy of the
               @hyperlink["resources/workbook/StudentWorkbook.pdf" "student
               workbook"].  The lesson plans are tightly integrated with the Student Workbook, 
             which should be used with the curriculum.}
          )
         )
         #:style "BSUnitList"
)

Of course, there's more to a curriculum than software and lesson plans! We also
provide a number of resources to educators, including standards alignment, an
answer key for the programming exercises and forums where they can ask
questions and share ideas. 

@itemlist[#:style "BSResourceList"

        @item{@(hyperlink "resources/teachers/index.shtml" "Teacher-Only
        Resources" ) - We also offer several teachers-only materials, including
        a quick-start guide to making the final project, and lots of quiz and
        review materials.}

         @item{@(hyperlink "../../Standards.shtml" "Standards Alignment") - Find out how Bootstrap aligns with Common Core Standards for Mathematics, as well as the standards for Mathematical Practice. }

          @summary-item/custom["Support Forums" @(list (hyperlink "https://groups.google.com/d/forum/bootstrap-announce" "Announcements")
                                                       (hyperlink "https://groups.google.com/d/forum/bootstrap-discuss" "Discussion"))]{
            Want to be kept up-to-date about Bootstrap events, workshops, and curricular changes? 
            Want to ask a question or pose a lesson idea for other Bootstrap teachers? 
            These forums are the place to do it.}
]
            
@(copyright)
}
