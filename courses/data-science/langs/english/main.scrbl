#lang curr/lib

@main-contents{
@(elem #:style bs-coursename-style "Bootstrap:Data Science")

@(logosplash "../../splash.png" "DataScienceLogo.png")

@; workbook link names and targets
We provide all of the our materials @italic{free of charge}, to anyone who is interested in using our lesson plans or student workbooks. (If you are an engineer or data scientist who would like to connect with a Bootstrap:DS classroom in your area, @(hyperlink "resources/CorporateInvolvement.pdf" "click here")!)
@(apply itemlist
        (append
         (for/list ([n (in-range 1 12)])
           (unit-summary/links n))
         #;(list 
          @summary-item/unit-link["Supplemental Lessons" "units/Supplemental/index"]{
           For teachers looking for additional exercises, we have compiled many activities for students 
           to go deeper into the material. Students can explore topics like Data Cleaning with @(hyperlink "https://www.pyret.org/docs/latest/tables.html#%28part._s~3atables~3aloading%29" "Pyret Sanitizers"), transforming columns to detect non-linear relationships, using @code{if}-statements to transform categorical data to quantitative data, splitting tables to create subgroups, and lots more!}
          )
         (list 
          )
         )
         #:style "BSUnitList"
)

Of course, there's more to a curriculum than software and lesson plans! We also provide a number of resources to educators, including standards alignment, a complete @(hyperlink "resources/workbook/StudentWorkbook.pdf" "Student Workbook"), an answer key for the programming exercises and forums where they can ask questions and share ideas. 
@itemlist[#:style "BSResourceList"
        @item{@(hyperlink "resources/teachers/index.shtml" "Teacher-Only Resources" ) - We also offer several teachers-only materials, including an answer key to the student workbook, a quick-start guide to making the final project, and pre- and post-tests for teachers who are paticipating in our research study. For access to these materials, please fill out the @(hyperlink "https://docs.google.com/a/bootstrapworld.org/spreadsheet/viewform?formkey=dHpQc0VHV2dBU2tSN1ptMktBUmtoZWc6MQ#gid=0" "password request form"). We’ll get back to you soon with the necessary login information.}
         @item{@(hyperlink "../../../Standards.shtml" "Standards Alignment") - Find out how Bootstrap aligns with Common Core Standards for Mathematics, as well as the standards for Mathematical Practice. }

          @summary-item/custom["Support Forums" @(list (hyperlink "https://groups.google.com/d/forum/bootstrap-announce" "Announcements")
                                                       (hyperlink "https://groups.google.com/d/forum/bootstrap-discuss" "Discussion"))]{
            Want to be kept up-to-date about Bootstrap events, workshops, and curricular changes? 
            Want to ask a question or pose a lesson idea for other Bootstrap teachers? 
            These forums are the place to do it.}
]            
@(copyright)
}
