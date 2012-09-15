#lang curr/lib

@title{Unit 6: Key Events}

@declare-tags[group pedagogy selftaught]


@overview{
    
@unit-descr{Students return to the subject of partial functions, this time defining a key-event handler that modifies their world on when certain keys are pressed.}

@objectives[@item{Extend their understanding of events to cover key-events}
            @item{Deepen their knowledge of conditionals, by combining them with struct accessor and constructor functions.}
          ]

@product-outcomes[
          @item{Students will define keypress, and hook it up to the event handler}
          ]
                
@state-standards
                
@length-of-lesson[90]

@pedagogy{                
@materials[@item{Computers w/DrRacket or WeScheme}
           @item{Student workbooks}
           @item{Design Recipe Sign}
           @item{Language Table}
           @item{Signs for kids, entitled "update-world", "draw-world" and "big-bang"}
           @item{Cutout images of the dog and ruby}
           ;@item{Ninja World v3 file [DrRacket|Wescheme]}
           ]

@preparation[
          @item{Language Table Posted}
          @item{Seating arrangements: ideally clusters of desks/tables}
          ]
}


}

@(include-lesson (lib "curr/lessons/Acting-It-Out-2/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Keypress/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Keys-in-Game/lesson/lesson.scrbl"))


@lesson[#:title "Closing"
        #:duration "5 minutes"
        ]{ 
 @pedagogy{
 @itemlist[
  @item{Have students show each other their controllable games!}]
          }
  

 @tag[selftaught]{Great job! Write one thing you learned today. 
                        
                        @free-response[#:id "response"]
}
 }

@copyright[]