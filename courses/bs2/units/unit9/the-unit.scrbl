#lang curr/lib

@title{Unit 9: Completing Games}

@declare-tags[group pedagogy selftaught]

@overview{
    
@unit-descr{This unit includes instructions for adding frequently-requested elements to students' games, such as extra levels and a scoring system. Students comfortable with structures are encouraged to use nested structures in their games for more complexity.}
            
@objectives[@item{Reinforce understanding of structures as they are used in their games}
          ]

@product-outcomes[
          @item{Students will use the random function to make their game characters appear at different loations on the screen}
          @item{Students will add a scoring system to their games}
          @item{Students will add levels to their games}
          @item{Students will use nested structures to add complexity to their games}
          ] 
                
@state-standards
                
@length-of-lesson[90]

@pedagogy{                
@materials[@item{Computers w/DrRacket or WeScheme}
           @item{Student workbooks}
           @item{Language Table}
           @item{The Completed Ninja World file [NWComplete.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=SSJ5S3gDRD" "WeScheme")] preloaded on students' machines}
           @item{New background image for Ninja World level two [bg2.jpg from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] or your own 640 x 480 image}
           ]

@preparation[
          @item{Language Table Posted}
          @item{Seating arrangements: ideally clusters of desks/tables}
          ]
}
}
@(include-lesson (lib "curr/lessons/Intro-Unit9/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Randomizing-Ninja-World/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Scoring-and-Levels/lesson/lesson.scrbl"))
@(include-lesson (lib "curr/lessons/Nested-Structures/lesson/lesson.scrbl"))


@lesson[#:title "Closing"
        #:duration "5 minutes"
        ]{ 
 @pedagogy{
 @itemlist[
  @item{Congratulations! You've completed every lesson, and your games look fantastic! You’ve all been really impressive, and it’s a pleasure working with you. We hope you’ll take these games home and keep hacking! Keep learning!}
  @item{Have students show each other their completed games!} 
   ]
          }

 @tag[selftaught]{Congratulations! You finished everything in the lessons! Now it's up to you to make your game even better. Can you think of anything else you want to add?
                        
                        @free-response[#:id "response"]}
}


@copyright[]
