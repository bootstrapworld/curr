#lang curr/lib

@main-contents{
@(elem #:style bs-coursename-style "Bootstrap:Algebra")

@(logosplash "../../splash.png" "AlgebraLogo.png")

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
           @lulu-button[]
           You can purchase beautiful, bound copies of the workbook from @hyperlink["http://www.lulu.com/commerce/index.php?fBuyContent=14790241" "Lulu.com"], 
               or @hyperlink["resources/workbook/StudentWorkbook.pdf" "print your own"].  The lesson 
               plans are tightly integrated with the Student Workbook, 
           which should be used with the curriculum. A @bold{Teacher's Edition} is also available 
           @hyperlink["https://docs.google.com/a/bootstrapworld.org/spreadsheet/viewform?formkey=dHpQc0VHV2dBU2tSN1ptMktBUmtoZWc6MQ#gid=0"]{upon request}. }
           
          @item{@italic{Significant discounts on printed books are available to teachers who attend our professional development workshops.} 
           @hyperlink["mailto:contact@bootstrapworld.org" "Contact us"] to find out more.}
          )
         )
         #:style "BSUnitList"
)

Of course, there's more to a curriculum than software and lesson plans! We also provide a number of resources to educators, including standards alignment, an answer key for the programming exercises and forums where they can ask questions and share ideas. 
@itemlist[#:style "BSResourceList"
        @item{@(hyperlink "resources/teachers/index.shtml" "Teacher-Only Resources" ) - We also offer several teachers-only materials, including an answer key to the student workbook, a quick-start guide to making the final project, and pre- and post-tests for teachers who are paticipating in our research study. For access to these materials, please fill out the @(hyperlink "https://docs.google.com/a/bootstrapworld.org/spreadsheet/viewform?formkey=dHpQc0VHV2dBU2tSN1ptMktBUmtoZWc6MQ#gid=0" "password request form"). We’ll get back to you soon with the necessary login information.}

         @item{@(hyperlink "https://discourse.bootstrapworld.org" "Bootstrap Discussion Forum" ) - Want to be kept up-to-date about Bootstrap events, workshops, and curricular changes? Want to ask a question or pose a lesson idea for other Bootstrap teachers? These forums are the place to do it. }
]
            
@(copyright)
}
