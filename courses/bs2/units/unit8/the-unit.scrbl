#lang curr/lib

@title{Unit 8: Collision Detection}

@declare-tags[group pedagogy selftaught]


@overview{
    
@unit-descr{Students discover the need for data structures, and practice defining them, making examples, and writing functions that produce them.}

@objectives[@item{Students will deepen their understanding of function definitions and the Design Recipe}
            @item{Students will understand the limitations of atomic datatypes}
            @item{Students will write complex functions that consume, modify and produce structures}
          ]

@product-outcomes[
          @item{Students identify real-world behaviors that require data structures}
          @item{Students make use of a complex data structure: auto}
          @item{Students define variables bound to autos}
          @item{Students write code that extracts each field from those autos}
          @item{Students define functions that produce an auto}
          ]
                
@state-standards
                
@length-of-lesson[90]

@pedagogy{                
@materials[@item{Computers w/DrRacket or WeScheme}
           @item{Student workbooks}
           @item{Design Recipe Sign}
           @item{Language Table}
           @item{Structs bags: plastic bags containing eight cards (2 labeled "number", 2 "string", 2 "image", and 2 "boolean")}
           @item{The "Autos" file [DrRacket file | WeScheme]}
           ]

@preparation[
          @item{Language Table Posted}
          @item{Seating arrangements: ideally clusters of desks/tables}
          ]
}


}

@(include-lesson (lib "curr/lessons/Intro-Unit8/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/1D-Distance-2/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Distance-Formula-2/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Collide/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Update-World-Collide/lesson/lesson.scrbl"))


@lesson[#:title "Closing"
        #:duration "5 minutes"
        ]{ 
 @pedagogy{
 @itemlist[
  @item{Congratulations guys! You've finished every lesson, and now it's time to get to the fun stuff. I want you to go home and brainstorm...what else do you want your game to do? Next time we're going to add more things, so that your games are even cooler.}
  @item{Have students show each other their games!} 
   ]
          }
  

 @tag[selftaught]{Congratulations! You finished everything in the lessons! Now it's up to you to make your game even better. Can you think of anything else you want to add?} 
                        
                        @free-response[#:id "response"]
}
 }

@copyright[]