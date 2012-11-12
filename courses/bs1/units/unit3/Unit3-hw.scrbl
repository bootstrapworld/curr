#lang curr/lib

@title{Unit Three Homework}

@lesson[#:title "Question One:"]{@itemlist/splicing[@item{Eager to demonstrate your programming knowledge, you have decided to use Racket to create a flyer or poster to distribute.}
                                                          
                                                    @item{Are you running for class president? President of the United States? Maybe you're advertising your services as a dog-walker in your neighborhood.}
                                                    
                                                    @item{Define three images with the variable names HEADER, SLOGAN, and LOGO for your poster. (Hint: the @bold{text} function will make an image out of any string you give it!)}]
@embedded-wescheme[#:id "campaign"
                   #:public-id "bShSf23M2W"]}

@lesson[#:title "Question Two:"]{Below is the contract for @bold{place-image}, which places an image at a specific x and y coordinate on top of another image. Use this function and the images you defined above to place your header, slogan, and logo on the poster background we've started for you.
                                 @code{;place-image : image number number image -> image}}

@lesson[#:title "Question Three:"]{The following is the contract and two examples for a function called @bold{pt}, which takes in a string and creates an image of that string in purple text of size 40.
                                   
                                   What's wrong with these examples? 
                                   
                                   @code{; pt : String -> Image}
                                   
                                   @code{; creates an image from the given string in purple text of size 40.}
                                   
                                 @itemlist/splicing[@item[@code{(EXAMPLE (pt "Bootstrap") (text "Bootstrap" 40 "purple"))}]
                                                    @item[@code{(EXAMPLE (pt "Purple") (text "Purple" 40 "green"))}]]
                                 @free-response[#:id "example"]}

@lesson[#:title "Question Four:"]{Your friend is making a video game about a scuba diver. When she shows you her progress, you notice that the image of her player is much too small, and pointed in the wrong direction. 
                                  
                                  Change the definition of PLAYER to increase the size of the image, and rotate it so that the scuba diver is swimming to the right.
                                  
                                  @embedded-wescheme[#:id "Scuba"
                   #:public-id "neFJSoDomX"]}
