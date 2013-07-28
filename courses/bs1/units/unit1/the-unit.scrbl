#lang curr/lib

@title{Unit 1: Videogames and Coordinate Planes}

@declare-tags[group pedagogy selftaught]



@overview{
@unit-descr{Students discuss the components of their favorite videogames, and discover that they can be reduced to a series of coordinates. They then explore coordinates in Cartesian space, and identify the coordinates for the characters in a game at various points in time. Once they are comfortable with coordinates, they brainstorm their own games and create sample coordinate lists for different points in time in their own game.}

@objectives[@item{Learn to work as a team}
          @item{Learn the Cartesian coordinate system}
          @item{Make the jump from PEMDAS to function composition, when thinking about arithmetic}
          @item{Students identify the order of operations for complex arithmetic expressions through diagramming (circles) and solving (the numerical answer)}
          ]

@product-outcomes[
          @item{Reverse-engineer a simple, side-scrolling game}
          @item{Brainstorm a videogame}
          @item{Identify coordinates of various images in a screenshot}
          @item{Converting between multiple representations of arithmetic (Conventional, Circles of Evaluation, and Racket)}
          ]
                
@state-standards
                
@length-of-lesson[90]

@pedagogy{                
@materials[@item{Student  @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbook"] folders - in pairs! - with names on covers.}
           @item{Computer, connected to a projector, with "NinjaCat" preloaded [ NinjaCat.rk from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=iK7rkNlvcS" "WeScheme")]}
           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
           @item{Cutouts of  @resource-link[#:path "images/ninjacat.png" #:label "NinjaCat"],  @resource-link[#:path "images/dog.png" #:label "Dog"] and the  @resource-link[#:path "images/ruby.png" #:label "Ruby"]}
           @item{Class posters (List of rules, language table, course calendar) }
           @item{Language Table (see below)}
           ]

@preparation[
          @item{Distribute workbooks, pens, arrange chairs so students are in pairs}
          @item{Set up student machines and projector, and check to make sure it all works!}
          @item{Post the agenda, rules, calendar, basic skills, language table, etc}
          ]
}


}

@(include-lesson (lib "curr/lessons/Intro-and-Expectations/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Ninja-Cat-Demo/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Coordinate-Planes/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Ninja-Cat-Demo-Dissection/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Ninja-Cat-Demo-Brainstorming/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Intro-to-Racket-and-Numbers/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Circles-of-Evaluation/lesson/lesson.scrbl"))


@lesson[#:title "Review"
        #:duration "5 minutes"
        ]{ 
 @pedagogy{
 @itemlist[
  @item{Who can tell us one thing we learned today?}       
  @item{Who saw someone else in the class do something great?}
  @item{Cleanup, dismissal}
  @item{NOTE TO INSTRUCTORS: 
    @itemlist[
              @item{Make sure student names are on page 3}
                   @item{Take page 3 itself, or take photos of page 3, to prep game images for Unit 3.}
                   @item{Images should be in PNG or GIF format. Background images should be 640x480, and character images should generally be no larger than 200px in either dimension. Make sure that the character images have transparent backgrounds!}
                   @item{TIP: use animated GIFs for the characters - not only does the animation make the game look a lot better, but these images usually have transparent backgrounds to begin with.}
                   @item{For more instructions on setting up the game files, read the @(hyperlink "../../resources/teachers/teachers-guide/teachers-guide.html#addingimages" "Coding Instructions") document.}
              ]
    }
  ]
          }
  

 @tag[selftaught]{Great job! Write one thing you learned today. 
                        
                        @free-response[#:id "response"]
}
 }

@copyright[]
