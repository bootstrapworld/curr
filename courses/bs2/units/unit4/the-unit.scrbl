#lang curr/lib

@title{Unit 4: Welcome to the World}

@declare-tags[group pedagogy selftaught]


@overview{
    
@unit-descr{Making minimal changes to these functions, they are able to modify the dog's speed, add static clouds, etc. They then modify the world to include the ruby's x-coordinate, and systematically update each function in the source code to accommodate this new world. Additional iterations are possible if time allows, by adding more sets of coordinates to the World.
Students brainstorm their videogames, and derive the structure for their game world.}

@objectives[@item{Deepen their understanding of structures, constructors and accessors by being introduced to a third data structure.}
            @item{Discover the event-based microworld implementation of Racket, which uses events to modify the world.}
          ]

@product-outcomes[
          @item{Students will modify draw-world to add clouds and a ruby}
          @item{Students will modify a simple update-world function to change the dog's speed}
          @item{Students will iteratively expand the World structure, and trace these changes throughout their program}
          @item{Student will define their World structures}
          ]
                
@state-standards
                
@length-of-lesson[90]

@pedagogy{                
@materials[@item{Computers w/DrRacket or WeScheme}
           @item{Student workbooks}
           @item{Design Recipe Sign}
           @item{Language Table}
           ;@item{Ninja World v2 [WeScheme | DrRacket]}
           ]

@preparation[
          @item{Language Table Posted}
          @item{Seating arrangements: ideally clusters of desks/tables}
          ]
}


}

@(include-lesson (lib "curr/lessons/Review-Unit4/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Codewalking/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Extending-the-World/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Brainstorming/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Game-Design/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Defining-the-World/lesson/lesson.scrbl"))


@lesson[#:title "Closing"
        #:duration "5 minutes"
        ]{ 
 @pedagogy{
 @itemlist[
  @item{Let's go around the class and have you each talk about your game. Once you've explained it, tell the class what you have in your World structure.}]}
  

 @tag[selftaught]{Great job! Write one thing you learned today. 
                        
                        @free-response[#:id "response"]
}
 }

@copyright[]