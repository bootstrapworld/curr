#lang curr/lib

@title{Unit 3: The Autobody Shop}

@declare-tags[group pedagogy selftaught]


@overview{
    
@unit-descr{tudents, having made pre-built data structures in the last lesson (autos), are introduced to the syntax for accessing the fields of those structures. They are then forced to generalize the understanding, by defining various data structures of their own and accessing the their fields. Students are introduced to Racket's purely-functional microworld implementation. This requires an understanding of functions, data structures, and an introduction to events-based programming. To accomplish this, students first work with a simple world (a number, representing a dog's x-coordinate). This world is consumed and produced by the update-world function, and drawn by draw-world. To understand events, they act out the World model, actually becoming event handlers and timers, to simulate a running program.}

@objectives[@item{Generalize their understanding of function constructors and accessors}
            @item{Write complex functions that consume, modify and produce structures}
            @item{Deepen their understanding of structures, constructors and accessors by being introduced to two new data structures.}
            @item{Discover the event-based microworld implementation of Racket, which uses events to modify the world.}
          ]

@product-outcomes[
          @item{Students define two new complex data structure: party and world}
          @item{Students will write functions that access fields of an auto, party, or world, and produce new autos, parties, and worlds.}
          ]
                
@state-standards
                
@length-of-lesson[90]

@pedagogy{                
@materials[@item{Computers w/DrRacket or WeScheme}
           @item{Student workbooks}
           @item{Design Recipe Sign}
           @item{Language Table}
           @item{Autos file [Racket | Wescheme]}
           @item{Party Planner file [Racket | Wescheme]}
           @item{Ninja World file [Racket | Wescheme]}
           @item{update-world, big-bang, and draw-world nametag}
           @item{cutout image of dog}
           ]

@preparation[
          @item{Language Table Posted}
          @item{Seating arrangements: ideally clusters of desks/tables}
          ]
}


}

@(include-lesson (lib "curr/lessons/Autobody-Review/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Define-Struct/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Party/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Ninja-World-Dissection/lesson/lesson.scrbl"))

@tag[pedagogy]{@(include-lesson (lib "curr/lessons/Acting-It-Out-1/lesson/lesson.scrbl"))}


@lesson[#:title "Closing"
        #:duration "5 minutes"
        ]{ 
 @pedagogy{
 @itemlist[
  @item{Who can tell us one thing we learned today?}       
  @item{Who saw someone else in the class do something great?}
  @item{Cleanup, dismissal}]
          }
  

 @tag[selftaught]{Great job! Write one thing you learned today. 
                        
                        @free-response[#:id "response"]
}
 }

@copyright[]