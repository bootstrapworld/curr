#lang curr/lib

@declare-tags[group pedagogy selftaught bootstrap]
@title{Unit 9: Prepping for Launch}

@overview{

Students will edit game details and prepare for their Launch Party!

@objectives[@item{Reflect on what's been learned and figure out how to teach back.}
            ]

@product-outcomes[
            @item{Students write and rehearse their presentations.}]

@state-standards

@length-of-lesson[90]
@pedagogy{
@materials[@item{Computers w/ DrRacket or WeScheme}
           @item{Student  @(hyperlink "https://spreadsheets.google.com/pub?key=0Ak3Voejjnf0ldHlQcXRVWTZDbVprWHlBLTJWRlQ2dkE&hl=en&gid=0" "workbooks")}
           @item{Pens/pencils for the students, fresh whiteboard markers for teachers}
           @item{Class posters (List of rules, basic skills, course calendar)}
           @item{Language Table (see below)}
           @item{Printouts of game code for each team.}
           @item{Camera - take pictures today!}
           ]}

@preparation[@item{Write agenda on board}
             @item{Game Design Certificates: 
                   @itemlist[@item{Most creative story}
                              @item{Most creative visuals}
                              @item{Best Note-Takers}
                              @item{Best Focus}
                              @item{Most Positive Energy}
                              @item{Design Recipe Masters}
                              ]}                      
             @item{Draw a sample poster for a fictional game.}]
            

@(language-table (list "Number" @code{+ - * / sq sqrt expt}) 
                 (list "String" @code{string-append string-length})
                 (list "Image" @code{rectangle circle triangle ellipse radial-star scale rotate put-image})
                 (list "Boolean" @code{= > < string=? and or}))
}
@(include-lesson (lib "curr/lessons/Prepare-Presentation/lesson/lesson.scrbl"))
@copyright[]