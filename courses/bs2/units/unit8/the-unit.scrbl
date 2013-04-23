#lang curr/lib

@title{Unit 8: Collision Detection}

@declare-tags[group pedagogy selftaught]


@overview{
    
@unit-descr{Students return to the Pythagorean Theorem and distance formula they used in Bootstrap 1, this time with data structures and the full update-world function.}

@objectives[@item{Reinforce their understanding of the distance formula}
            @item{Identify collision as yet another sub-domain which require different behavior of the update-world function}
          ]

@product-outcomes[
          @item{Students will write the distance function}
          @item{Students will write the collide? function}
          @item{Students will use different Cond branches to identify collisions in their games}
          ]
                
@state-standards
                
@length-of-lesson[90]

@pedagogy{                
@materials[@item{Computers w/DrRacket or WeScheme}
           @item{Student workbooks}
           @item{Design Recipe Sign}
           @item{Language Table}
	   @item{Cutouts of Cat and Dog images}
           @item{The Ninja World 6 file [NW6.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=CxLm7aj7PW" "WeScheme")] preloaded on students' machines}
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
  

 @tag[selftaught]{Congratulations! You finished everything in the lessons! Now it's up to you to make your game even better. Can you think of anything else you want to add?
                        
                        @free-response[#:id "response"]}
}

@copyright[]
