#lang curr/lib


@lesson[#:title "Defining Variables" #:duration "10 minutes"]{
        @itemlist/splicing[
        @pedagogy{@item{@demo{Have students open their game files, and click Run. They should see a frozen screenshot of their game, using the images they requested. (By now, you should have students' graphics already created, and @(hyperlink "http://www.bootstrapworld.org/materials/resources/teachers/teachers-guide/teachers-guide.html#addingimages" "added to the file)")}}} 
         
        @item{So far, everything that you've been doing has been down in the Interactions window. What happens when you click Run at the top? All the work you did disappears!
              @tag[student]{@editor-link[#:definitions-text "4"
                                             #:interactions-text "Click Run above. What happens to this line of text?"
                                             "See an example."]
                             }}
        @item{That's because the Interactions window is meant just for trying things out. If you want to define something permanently, you need to use the Definitions window.}
        
        @item{The game in front of you is a bare-bones, totally broken game. It doesn't DO anything...YET!}
        
        @tag[selftaught]{@item{The following is a bare-bones, totally broken game. It doesn't DO anything...YET!}
                         @item{@editor-link[#:public-id "q3fgrbasAi"
                                             "See an example."]
                                }}
        
        @item{Look below Step 0, near the top of the screen. @pedagogy{Raise your hand if you can read the line of code just below that (Have a volunteer read it aloud).} @think-about[#:question (list "What will happen if I type " @code{TITLE} " into the Interactions window down at the bottom?") #:hint "Try it out!"]}
        @item{@think-about[#:question (list "What will happen if you type " @code{TITLE} " into the Interactions window down at the bottom?") #:answer (list "This code tells the computer that the name " @code{TITLE} " is a shortcut for the string " @code{"My Game"} ". When you click Run, the computer learns that name and that shortcut, along with any other definitions.")]}
        @item{When you click Run, you'll see the title @code{"My Game"} at the top left hand corner of your new game.}
        @item{This kind of name, which is just a shortcut for some value like a Number, String, or Image, is also called a variable. You've seen other names too, like @code{+} and @code{string-length} that are the names of functions. You'll name your own functions soon.}
        @item{Change the value of this variable from @code{"My Game"} to YOUR title. Then click Run, and see if the game is updated to reflect the change.}
        @item{@think-about[#:question "What is the name of the NEXT variable defined in this file? What is its value?" #:answer @code{TITLE-COLOR}]  Try changing this value and clicking Run, until your title looks the way you want it to.}
        @item{For practice, try defining a new variable called @code{author}, and set its value to be the string containing your names. Don't forget - all strings are in quotes! (This won't do anything in the game, but when you close the game window, you can type
@code{author} and see its value.) Then you can ask @code{(string-length author)}, etc.}
        @item{@think-about[#:question "What other variables do you see defined in this file? What is its name? What is its value?"] @pedagogy{Take a volunteer.}}
        @item{Variables can be more than just strings. They can be numbers, or images! These definitions are where we define the images for your background, player, target, and danger.}
        @item{As you can see, there are variables that define the @code{BACKGROUND, PLAYER, TARGET} and @code{DANGER} images.}
        @item{@think-about[#:question (list "What will happen if you type " @code{DANGER} " into the Interactions window down at the bottom?") #:answer (list "This code tells the computer that the name " @code{DANGER} " is a shortcut for a solid, red triangle of size 30. When you click Run, the computer learns that name and that shortcut, along with any other definitions.")]}
        @item{You can even define long expressions to be a single value. Look closely at the definition of @code{SCREENSHOT}. This definition is a complication expression, which puts all of the game images on top of one another ar various coordinates. The @code{PLAYER} image, for example, is being displayed on top of the @code{BACKGROUND}, at the position @code{(320, 240)}. }
        @item{@think-about[#:question (list "According to the definition of " @code{SCREENSHOT}", where is the " @code{DANGER}"  located?") #:answer (list @code{(150, 200)} )]}
        @item{Try changing the various coordinates and clicking @bold{Run}, then evaluating @code{SCREENSHOT} in the Interactions window. Can you move the @code{TARGET} to the top-left corner of the screen by changing it's coordinates?}
        ]
}
