#lang curr/lib

@declare-tags[pedagogy selftaught group]

@lesson[#:title "Defining Variables"]{
        @itemlist/splicing[
        @pedagogy{@item{@demo{Have students open their game files, and click Run. They should see a frozen screenshot of their game, using the images they requested. (By now, you should have students' graphics already created, and @(hyperlink "http://www.bootstrapworld.org/curriculum/BS1-sp2012/TeachersGuide.html#addingimages" "added to the file)")}}} 
          
        @item{So far, everything that you've been doing has been down in the Interactions window. What happens when you click Run at the top? All the work you did disappears!}
          @embedded-wescheme[#:id "Defining Variables"
                   #:interactions-text "Click Run above. What happens to this line of text?"]
          
        @item{That's because the Interactions window is meant just for trying things out. If you want to define something permanently, you need to use the Definitions window.}
        
        @item{@exercise{@(hyperlink "http://http://www.wescheme.org/openEditor?publicId=undue-rival-cream-plane-fluid" "this link")  Below is a bare-bones, totally broken game. It doesn't DO anything...YET!
        @item{Look below Step 0, near the top of the screen. What will happen if you type " @code{TITLE} " into the Interactions window down at the bottom?}}}
        @embedded-wescheme[#:id "Defining Variables"
                   #:definitions-text "http://http://www.wescheme.org/openEditor?publicId=undue-rival-cream-plane-fluid"]
                    
        @item{This code tells the computer that the name " @code{TITLE} " is a shortcut for the string " @code{"My Game"} ". When you click Run, the computer learns that name and that shortcut, along with any other definitions."}
        @item{When you click Run, you'll see the title @code{"My Game"} at the top left hand corner of your new game.}
        @item{This kind of name, which is just a shortcut for some value like a Number, String, or Image, is also called a variable. You've seen other names too, like @code{+} and @code{string-length} that are the names of functions. You'll name your own functions soon.}
        @item{Change the value of this variable from @code{"My Game"} to YOUR title. Then click Run, and see if the game is updated to reflect the change.}
        @item{@think-about[#:question "What is the name of the NEXT variable defined in this file? What is its value?" #:answer @code{TITLE-COLOR}]  Try changing this value and clicking Run, until your title looks the way you want it to.}
        @item{For practice, try defining a new variable called @code{author}, and set its value to be the string containing your names. Don't forget - all strings are in quotes! (This won't do anything in the game, but when you close the game window, you can type
@code{author} and see its value.) Then you can ask @code{(string-length author)}, etc.}
        @item{@think-about[#:question "What other variables do you see defined in this file? What is its name? What is its value?"] @pedagogy{Take a volunteer.}}
        @item{Variables can be more than just strings. They can be numbers, or images! The definitions below @code{TITLE} and @code{TITLE-COLOR} are where we define the images for your background, player, target, and danger.}]}
}
