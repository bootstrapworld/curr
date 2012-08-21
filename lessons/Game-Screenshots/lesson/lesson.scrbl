#lang curr/lib

@declare-tags[pedagogy selftaught group]

@lesson[#:title "Game Screenshots" #:duration "30 minutes"
                #:prerequisites "Defining-Variables" ]{

@itemlist/splicing[
    @item{Let's start changing these image definitions so that they use the images YOU want.}
    @item{You already know how to draw various shapes, but suppose you wanted to use an image that you found? (For example, this circular red-and-blue icon on the right?)}
    @item{Take a look at the contracts for these two functions: @bitmap{images/icon.png}
          @code[#:multi-line #t]{; bitmap : String -> Image
                                 ; bitmap/url : String -> Image}}
    @item{Both of these functions take a @code{String} as their domain, which tells them where the image file is located. If you're using WeScheme, that can be the address of any image file you find on the internet. In DrRacket, the String represents the path to the file.}
    @item{If you're using @bold{WeScheme}, you'll want to use @code{bitmap/url}. If you're using @bold{DrRacket}, you'll want @code{bitmap}}
    @item{Try replacing the definition of the @code{BACKGROUND} with an image file, and @bold{click Run.})}
    @item{Now try to find an image for your @code{PLAYER}. When you click Run, you should see your player appear on the game screen. Typing @code{PLAYER} into the Interactions window will show you just the player image, by itself}
    @item{Suppose you wanted your player to be larger or smaller? There's a function called @code{scale}:
                                                                                            @code[#:multi-line #t]{; scale : Number Image -> Image}}
    @item{@code{scale} resizes the @code{Image} based on the @code{Number}. For example, @code{(scale 3 PLAYER)} will make the PLAYER image three times as large, while @code{(scale 0.5 PLAYER)} will make it half the size. On the right, you can see what our icon looks like after being @code{scale}ed. @bitmap{images/icon-scaled.png}}
    @item{Once you've written the contract for @code{scale}, use it as part of the definition of @code{PLAYER} to make sure your player looks just right!}
    @item{Suppose you want your player to be flipped vertically or horizontally? Copy down the contracts for these two functions, then try using them to flip your @code{PLAYER}.
          @code[#:multi-line #t]{; flip-vertical : Image -> Image
                                 ; flip-horizontal : Image -> Image}}
    @item{You can also rotate any image, so that your player is facing any point on the screen:
          @code[#:multi-line #t]{;rotate : Number Image -> Number}}
    @item{Try rotating your player 45 degrees.}
    @item{You can combine these functions together, just like you can use @code{+, -, /, *, sqrt}, and @code{sqr} together when working with Numbers. Can you make your player twice as big, @italic{and} rotated 45 degrees, like our example on the right?? @bitmap{images/icon-composed.png}}
    @item{Now try using all of these functions - however you want - to make the definitions of @code{DANGER, TARGET} and @code{PLAYER} look exactly the way you want. You can even change their locations inside @code{SCREENSHOT}, so that you get a real-life screenshot of your game!}
    @item{Click "Run", and evaluate @code{SCREENSHOT}. Does it look the way you expected? On your own, mess with the coordinates until the @code{TARGET} is placed where you want it to be.}
    
]}