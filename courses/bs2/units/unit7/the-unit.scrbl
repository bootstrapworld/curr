#lang curr/lib

@title{Unit 7: Complex update-world}

@declare-tags[group pedagogy selftaught]


@overview{
    
@unit-descr{Students continue to combine their use of Cond and Data Structures, this time identifying ways in which the World structure might change without any user input.}

@objectives[@item{Add detail to their undertsanding of the update-world function}
            @item{Identify possible sub-domains which require different behavior of the function}
          ]

@product-outcomes[
          @item{Students will use Cond in their update-world functions}
          @item{Students will identify circumstances in which the functions should behave differently}
          @item{Students will define these circumstances - and the desired behavior - in code, as different Cond branches}
          ]
                
@state-standards
                
@length-of-lesson[90]

@pedagogy{                
@materials[@item{Computers w/DrRacket or WeScheme}
           @item{Student workbooks}
           @item{Design Recipe Sign}
           @item{Language Table}
           @item{The Ninja World 5 file [NW5.rkt from @resource-link[#:path "source-files.zip" #:label "source-files.zip"] | @(hyperlink "http://www.wescheme.org/view?publicId=hF6Ngq7TF6" "WeScheme")] preloaded on students' machines}
           ]

@preparation[
          @item{Language Table Posted}
          @item{Seating arrangements: ideally clusters of desks/tables}
	  @item{Write the Ninja World version of update-world towards the bottom of the board, with room to transform it into a cond branch under the function header.}
          ]
}


}

@(include-lesson (lib "curr/lessons/Intro-Unit7/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Protecting-Boundaries/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Tests-and-Results/lesson/lesson.scrbl"))

@(include-lesson (lib "curr/lessons/Branches/lesson/lesson.scrbl"))


@lesson[#:title "Closing"
        #:duration "5 minutes"
        ]{ 
 @pedagogy{
 @itemlist[
  @item{Have the students show each other their games!}
  @item{Cleanup, dismissal.}]
          }
  

 @tag[selftaught]{Great job! Write one thing you learned today. 
                        
                        @free-response[#:id "response"]
}
 }

@copyright[]
