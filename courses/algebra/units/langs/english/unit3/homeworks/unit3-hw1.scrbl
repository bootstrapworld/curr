#lang curr/lib

@title{Unit Three Homework}

@lesson[#:title "Question One:"]{@itemlist/splicing[@item{Eager to demonstrate your programming knowledge, you have decided to use Racket to create a flyer or poster to distribute.}
                                                   
                                                    @item{Are you running for class president? President of the United States? Maybe you're advertising your services as a dog-walker in your neighborhood.}
                                                    
                                                    @item{We've given you sample HEADER and BACKGROUND images.}
                                                    @item{@bold{A)} Create two more images representing the personal slogan and logo you would like on the poster. (Hint: The @bold{text} function will create an image out of any string you give it.) Your logo can be a simple shape, or any image taken from the web.}
                                                    @item{@bold{B)} Next, take the images you just created and define them with the variable names SLOGAN and LOGO for your poster.}]
@embedded-wescheme[#:id "campaign"
                   #:public-id "sH5iEU3zPn"
                   #:height 900]}

@lesson[#:title "Question Two:"]{@itemlist/splicing[@item{Below is the contract for @bold{put-image}, which places an image at a specific x and y coordinate on top of another image. We've started your poster by putting the header towards the bottom left of the background.}
                                                     
                                                     @item{@code{;put-image : image number number image -> image}}
                                                     
                                                     @item{Change the position of HEADER in the given expression to move it to the top center of the background.}] 
                                                           }

@lesson[#:title "Question Three:"]{Use the @bold{put-image} function and the images you defined above to place your SLOGAN and LOGO on your poster, so they appear below the HEADER.}

@lesson[#:title "Question Four:"]{The following is the contract and two examples for a function called @bold{pt}, which takes in a string and creates an image of that string in purple text of size 40.
                                   
                                   What's wrong with these examples? 
                                   
                                   @code{; pt : String -> Image}
                                   
                                   @code{; creates an image from the given string in purple text of size 40.}
                                   
                                   @bitmap{images/purple.png}
                                   
                                 @itemlist/splicing[@item[@code{(EXAMPLE (pt "Bootstrap") (text "Bootstrap" 40 "green"))}]
                                                    @item[@code{(EXAMPLE (pt "Purple") (image "Purple" 40 "purple"))}]]
                                 @free-response[#:id "example"]}

@lesson[#:title "Question Five:"]{Your friend is making a video game about a scuba diver. When she shows you her progress, you notice that the image of her player is much too small, and pointed in the wrong direction. 
                                  
                                  Change the definition of PLAYER to increase the size of the image, and rotate the image so that the scuba diver is swimming to the right.
                                  
                                  @embedded-wescheme[#:id "Scuba"
                                                     #:public-id "Xexl4Npt9x"
                                                     #:height 600]
                                  
                                  @itemlist/splicing[@item{@bold{Before:} 
                                                            @bitmap{images/diversmall.gif}}
                                                      
                                                      @item{@bold{After:} 
                                                                @bitmap{images/diversmallr.gif}}]}
