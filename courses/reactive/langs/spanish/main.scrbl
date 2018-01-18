#lang curr/lib


@main-contents{
@(elem #:style bs-coursename-style "Bootstrap:Reactive")

@(logosplash "../../splash.png" "ReactiveLogo.png")

@; workbook link names and targets
We provide all of our materials @italic{free of charge}, to anyone who is interested in using our lesson plans or student workbooks.
@(apply itemlist
        (append         
         (for/list ([n (in-range 1 6)])
           (unit-summary/links n))
         (list
 	  @summary-item/unit-link["Build Your Own Animation" "units/BuildOwn/index"]{Students create their own animation from scratch (requires Units 1-5)}
 	  @summary-item/unit-link["Detecting Collisions" "units/Collisions/index"]{Students use the Pythagorean Theorem to detect collisions in their games (requires Units 1-5)}
 	  @summary-item/unit-link["Adding Scores" "units/Scoring/index"]{Students add a score to their games, based on the number of collisions (requires the Collisions unit)}
 	  @summary-item/unit-link["Adding Levels" "units/Levels/index"]{Students add levels of play to their games, with levels changing based on scores (requires the Scores unit)}
 	  @summary-item/unit-link["Writing Pong" "units/Pong/index"]{Students implement a one-player version of the classic Pong video game (requires Units 1-5)}
          )
         (list 
          @summary-item/no-link["Student Workbook"]{
           The lesson plans linked are tightly integrated into the @hyperlink["resources/workbook/StudentWorkbook.pdf" "Student Workbook"], 
           which should be used with the curriculum. A @bold{Teacher's Edition} is also available upon request. 
           Please fill out a request using our @hyperlink["https://docs.google.com/a/bootstrapworld.org/spreadsheet/viewform?formkey=dHpQc0VHV2dBU2tSN1ptMktBUmtoZWc6MQ#gid=0"]{online form}, 
           and we'll get back to you right away.})         
         )
         #:style "BSUnitList"
        )

Of course, there's more to a curriculum than software and lesson plans! We also provide a number of resources to educators, including standards alignment, an answer key for the programming exercises and forums where they can ask questions and share ideas. 


@itemlist[
  @item{@(hyperlink "resources/teachers/index.shtml" "Teacher-Only Resources" ) -
We also offer several teachers-only materials, including an answer key
to the student workbook, a quick-start guide to making the final
project, and pre- and post-tests for teachers who are paticipating in
our research study. For access to these materials, please fill out the
@(hyperlink "https://docs.google.com/a/bootstrapworld.org/spreadsheet/viewform?formkey=dHpQc0VHV2dBU2tSN1ptMktBUmtoZWc6MQ#gid=0" "password
request form"). We’ll get back to you soon with the necessary login
information.}

  @summary-item/custom["Support Forums"
       @list[@hyperlink["https://groups.google.com/d/forum/bootstrap-announce" "Announcements"]
             @hyperlink["https://groups.google.com/d/forum/bootstrap-discuss" "Discussion"]]]{
       Want to be kept up to date about Bootstrap events, workshops, and curricular changes? 
       Want to ask a question or pose a lesson idea for other Bootstrap teachers? 
       These forums are the place to do it.}
  ]
            
@(copyright)
}