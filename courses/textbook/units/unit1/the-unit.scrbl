#lang curr/lib

@title{Dissect a Video Game and Design Your Own}

@declare-tags[group pedagogy selftaught]

@overview{
Students discuss the components of their favorite videogames, and discover that they can be reduced to a series of coordinates. They then explore coordinates in Cartesian space, and identify the coordinates for the characters in a game at various points in time. Once they are comfortable with coordinates, they brainstorm their own games and create sample coordinate lists for different points in time in their own game.

@objectives[@item{Identify the elements of a videogame}
            @item{Learn the Cartesian coordinate system}
            @item{Outline the game you'll create during the course}
          ]

@product-outcomes[
          @item{Students will successfully reverse-engineer a simple side-scrolling game.}
          @item{Teams will brainstorm their own games and generate the geometry for their games at different points in time.}
          ]
                
@materials[@item{"NinjaCat"[ @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/downloads/NinjaCat.zip" "DrRacket") | @(hyperlink "http://www.wescheme.org/view?publicId=gaffe-tinge-swipe-oscar-diver" "WeScheme")]}
           ]
}

@(include-lesson (lib "curr/lessons/Ninja-Cat-Demo/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Ninja-Cat-Demo/lesson/lesson-long.scrbl"))

@(include-lesson (lib "curr/lessons/Coordinate-Planes/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Ninja-Cat-Demo-Dissection/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Ninja-Cat-Demo-Brainstorming/lesson/lesson.scrbl"))

@copyright[]