#lang curr/lib

@title{Unit Three Homework}

@lesson[#:title "Question One:"]{@itemlist/splicing[@item{Eager to demonstrate your programming knowledge, you have decided to use Racket to create a flyer or poster to distribute.}
                                                   
                                                    @item{Are you running for class president? President of the United States? Maybe you're advertising your services as a dog-walker in your neighborhood.}
                                                    
                                                    @item{We've given you sample HEADER and BACKGROUND images. Define two more images with the variable names SLOGAN and LOGO for your poster.}]
@embedded-wescheme[#:id "campaign"
                   #:public-id "W5ygza5XKq"]}

@lesson[#:title "Question Two:"]{@itemlist/splicing[@item{Below is the contract for @bold{put-image}, which places an image at a specific x and y coordinate on top of another image. We've started your poster by putting the header on the background.}
                                                     
                                                     @item{@code{;put-image : image number number image -> image}}
                                                     
                                                     @item{Change the position of HEADER in the given expression. Can you move it farther up on the background?}] 
                                                           }

@lesson[#:title "Question Three:"]{Use the @bold{put-image} function and the images you defined above to place your SLOGAN and LOGO on the poster.}

@lesson[#:title "Question Four:"]{The following is the contract and two examples for a function called @bold{pt}, which takes in a string and creates an image of that string in purple text of size 40.
                                   
                                   What's wrong with these examples? 
                                   
                                   @code{; pt : String -> Image}
                                   
                                   @code{; creates an image from the given string in purple text of size 40.}
                                   
                                 @itemlist/splicing[@item[@code{(EXAMPLE (pt "Bootstrap") (text "Bootstrap" 40 "green"))}]
                                                    @item[@code{(EXAMPLE (pt "Purple") (image "Purple" 40 "purple"))}]]
                                 @free-response[#:id "example"]}

@lesson[#:title "Question Five:"]{Your friend is making a video game about a scuba diver. When she shows you her progress, you notice that the image of her player is much too small, and pointed in the wrong direction. 
                                  
                                  Change the definition of PLAYER to increase the size of the image, and flip it horizontally so that the scuba diver is swimming to the right.
                                  
                                  @embedded-wescheme[#:id "Scuba"
                   #:public-id "neFJSoDomX"]}
