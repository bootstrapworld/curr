#lang curr/lib

@main-contents{
@(elem #:style bs-coursename-style "Bootstrap: Physics")

@boxed-text{@animated-gif{splash.png}Our Physics module helps students understand basic physics concepts by 
             incorporating computer programming as one of the key tools for building models of the physical 
             world. Targeted to ninth grade, during which every student is expected to take science, this 
             course is designed to spark students’ interest in subjects related to science, technology, 
             engineering, and math (STEM) for the rest of their academic careers. This initiative also 
             combats a root cause of inequality of opportunity in pursuing STEM careers: disparate access 
             to quality teaching in middle and high school. The module is aligned to the Physics First course, 
             allowing teachers to easily embed computational modeling in their physics classes.}

@bold{@(hyperlink "http://www.BootstrapWorld.org/workshops" "Click here for our upcoming trainings")}

@; workbook link names and targets
We provide all of the our materials @italic{free of charge}, to anyone who is interested in using our lesson plans or student workbooks.

Of course, there's more to a curriculum than software and lesson plans! We also provide a number of resources to educators, including standards alignment, an answer key for the programming exercises and forums where they can ask questions and share ideas. 
@itemlist[#:style "BSResourceList"
        @item{@(hyperlink "resources/teachers/index.shtml" "Teacher-Only Resources" ) - We also offer several teachers-only materials, including an answer key to the student workbook, a quick-start guide to making the final project, and pre- and post-tests for teachers who are paticipating in our research study. For access to these materials, please fill out the @(hyperlink "https://docs.google.com/a/bootstrapworld.org/spreadsheet/viewform?formkey=dHpQc0VHV2dBU2tSN1ptMktBUmtoZWc6MQ#gid=0" "password request form"). We’ll get back to you soon with the necessary login information.}

          @summary-item/custom["Support Forums" @(list (hyperlink "https://groups.google.com/d/forum/bootstrap-announce" "Announcements")
                                                       (hyperlink "https://groups.google.com/d/forum/bootstrap-discuss" "Discussion"))]{
            Want to be kept up-to-date about Bootstrap events, workshops, and curricular changes? 
            Want to ask a question or pose a lesson idea for other Bootstrap teachers? 
            These forums are the place to do it.}
]
            
@(copyright)
}
