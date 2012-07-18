#lang curr/lib

@title{Unit 1: Videogames and Coordinate Planes}

@declare-tags[group pedagogy selftaught]



@overview{
Students discuss the components of their favorite videogames, and discover that they can be reduced to a series of coordinates. They then explore coordinates in Cartesian space, and identify the coordinates for the characters in a game at various points in time. Once they are comfortable with coordinates, they brainstorm their own games and create sample coordinate lists for different points in time in their own game.

@objectives[@item{Learn to work as a team}
          @item{Learn the basic expectations and goals of the class}
          @item{Learn the Cartesian coordinate system}
          ]

@product-outcomes[
          @item{Students - in teams - will successfully reverse-engineer a simple side-scrolling game.}
          @item{Teams will brainstorm their own games and generate the geometry for their games at different points in time.}
          ]
                
@state-standards
                
@length-of-lesson[90]

@resource-link[#:path "images/ninjacat.png" #:label "NinjaCat"]

@pedagogy{                
@materials[@item{Student  @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "workbook"] folders - in pairs! - with names on covers.}
           @item{Computer, connected to a projector, with "NinjaCat" preloaded [ @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/downloads/NinjaCat.zip" "DrRacket") | @(hyperlink "http://www.wescheme.org/view?publicId=gaffe-tinge-swipe-oscar-diver" "WeScheme")]}
           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
           @item{Cutouts of  @resource-link[#:path "images/ninjacat.png" #:label "NinjaCat"] and the  @resource-link[#:path "images/ruby.png" #:label "Ruby"]}
           @item{Class posters (List of rules, language table, course calendar) }
           @item{Language Table (see below)}
           ]

@preparation[
          @item{Distribute workbooks, pens, arrange chairs so students are in pairs}
          @item{Set up student machines and projector, and check to make sure it all works!}
          @item{Post the agenda, rules, calendar, basic skills, language table, etc}
          ]
}

@language-table[(list "  ...   " "    ...  ")]
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
                   @item{For more instructions on setting up the game files, read the @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/TeachersGuide.html#addingimages" "Coding Instructions") document.}
              ]
    }
  ]
          }
  

 @tag[selftaught]{Great job! Write one thing you learned today. 
                        
                        @free-response[#:id "response"]
}
 }

@copyright[]