#lang curr/lib

@title{Unit 5: Building your World}

@declare-tags[group pedagogy selftaught]


@overview{
    
@unit-descr{After thinking about their World, students practice building, drawing and animating it.}

@objectives[@item{Learn algebraic, World-style programming}
            @item{Understand the concept of "events", such as on-draw and on-tick}
          ]

@product-outcomes[
          @item{Students will define draw-world, and hook it up to an event handler}
          @item{Students will define a simple update-world function, and hook it up to on-tick}
          ]
                
@state-standards
                
@length-of-lesson[90]

@pedagogy{                
@materials[@item{Blank Game Template from @resource-link[#:path "source-files.zip" #:label "source-files.zip"], with student images included. Hint: name image DANGER instead of dog, etc., for ease of reference while writing draw-world}
           @item{Student workbooks}
           @item{Clear plastic sheet protectors: put pages 20 & 21 at the front of the workbook for ease of reference}
           @item{Design Recipe Sign}
           @item{The Ninja World 3 file [NW3.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=XfXGclYj1F" "WeScheme")] preloaded on students' machines}
           ]

@preparation[
          @item{Language Table Posted}
          @item{Seating arrangements: ideally clusters of desks/tables}
          ]
}


}

@(include-lesson (lib "curr/lessons/Intro-Unit5-NW/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Drawing-the-World/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Updating-the-World/lesson/lesson.scrbl"))


@lesson[#:title "Closing"
        #:duration "5 minutes"
        ]{ 
 @pedagogy{
 @itemlist[
  @item{Have students show each other their their animated games!}]
          }
  

 @tag[selftaught]{Great job! Write one thing you learned today. 
                        
                        @free-response[#:id "response"]
}
 }

@copyright[]
