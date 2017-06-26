#lang curr/lib

@main-contents{
@(elem #:style bs-coursename-style "Bootstrap:Data Science")

@boxed-text{@animated-gif{splash.png}What factors make some people live longer than others? Are the schools in one part of your neighborhood better than schools in another part? How would you measure that? Answering these questions involves collecting and manipulating data, from sports stats to record sales to census data. Our Data Science module teaches students to view programs as questions we ask of data. Students form their own questions about the world around them, and learn how to analyze data critically and carefully to find answers. Business, science, and social studies teachers can utilize this module to help students make inferences from data. Math teachers can use this module to introduce foundational concepts in statistics. It also works great as a module for AP CS Principles’ unit on data!}

@bold{@(hyperlink "http://www.BootstrapWorld.org/workshops" "Click here for our upcoming trainings")}


@; workbook link names and targets
We provide all of the our materials @italic{free of charge}, to anyone who is interested in using our lesson plans or student workbooks.
@(apply itemlist
        (append
         (for/list ([n (in-range 1 9)])
           (unit-summary/links n))
         (list 
          )
         (list 
          )
         )
         #:style "BSUnitList"
)

Of course, there's more to a curriculum than software and lesson plans! We also provide a number of resources to educators, including standards alignment, an answer key for the programming exercises and forums where they can ask questions and share ideas. 
@itemlist[#:style "BSResourceList"
        @item{@(hyperlink "resources/teachers/index.shtml" "Teacher-Only Resources" ) - We also offer several teachers-only materials, including an answer key to the student workbook, a quick-start guide to making the final project, and pre- and post-tests for teachers who are paticipating in our research study. For access to these materials, please fill out the @(hyperlink "https://docs.google.com/a/bootstrapworld.org/spreadsheet/viewform?formkey=dHpQc0VHV2dBU2tSN1ptMktBUmtoZWc6MQ#gid=0" "password request form"). We’ll get back to you soon with the necessary login information.}
         @item{@(hyperlink "../../Standards.shtml" "Standards Alignment") - Find out how Bootstrap aligns with Common Core Standards for Mathematics, as well as the standards for Mathematical Practice. }

          @summary-item/custom["Support Forums" @(list (hyperlink "https://groups.google.com/d/forum/bootstrap-announce" "Announcements")
                                                       (hyperlink "https://groups.google.com/d/forum/bootstrap-discuss" "Discussion"))]{
            Want to be kept up-to-date about Bootstrap events, workshops, and curricular changes? 
            Want to ask a question or pose a lesson idea for other Bootstrap teachers? 
            These forums are the place to do it.}
]
            
@(copyright)
}
