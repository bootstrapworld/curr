#lang curr/lib

@title{A Coding-Only Guide to Making the Game}

@lesson[#:title "Creating the Files"]{
@itemlist/splicing[
                   @item{If using DrRacket:
                         @itemlist[#:style 'ordered
                                           @item{Make a new folder for each team, naming them after the students.}
                                           @item{Into each folder, download the DrRacket file and the [unzipped] teachpacks}]}
                   @item{If using WeScheme:
                         @itemlist[#:style 'ordered
                                           @item{Start a new program for each team, and click "save". Name the projects after the students.}
                                           @item{Into each file, copy and paste the code from the online template, then click "save". Note: for this and all other curriculum files, please make sure you are copying the WeScheme code and NOT the DrRacket code. They are very similar, but not interchangable.}]}
                   @item{We suggest using student names (e.g. - "janelle+chris") for the file/WeScheme name, but anything will do. If you're in WeScheme, we assume you've logged in using a class-wide username and password, so that every student can access their games.}]}

@lesson[#:title "Running the Game"]{
@itemlist/splicing[@item{Near the end of the game file, you'll see an expression that defines a level, @code{(define game_level ...)}, passing in animation functions and images. You can define other levels if you wish, with different images or animation functions.}
                    @item{The last line, @code{(play game_level)} will run the game using the level created above. By default, this line will be executed every time the student clicks "Run". You can stop this by adding a semicolon at the beginning of the line: @code{; (play game_level)}. This can make it easier for student to experiment with their code and test cases while they're developing, and they can always run the program manually by typing @code{(play game_level)} in the Interactions window.}]}


@lesson[#:title "Making Characters Move"]{
@itemlist/splicing[@item{Every Bootstrap game includes at least three "characters": the @code{Player}, the @code{Target} and the @code{Danger}.}
                   @item{Each is controlled by an @code{update-} function (e.g. @code{update-player}, @code{update-target}, etc.), named for the character it updates. These updates are like the pages of a flip-book: given a page, the update function generates the next logical page in the book.}
                   @item{These functions take the current coordinate as input, and return the next coordinate. If the @code{Target} moves to the left by 20 pixels each frame, then the body of the function should return @code{(- x 20)}.}
                   @item{You'll note that there is also a function called @code{update-mystery}. This function is actually for animating projectiles, if students insist on having them! (In the curriculum, this is kept a secret early on in order to encourage students to think beyond violent games.}
                   @item{The @code{update-player} function is slightly different from the rest:
                         @itemlist[@item{It takes two inputs: the y-coordinate of the player (a number) and the key that was pressed (a string, such as "h", "left" or "q").}
                                   @item{It is called only when a key is pressed, instead of each time the screen is redrawn.}]}
                   @item{If you'd like the player to move differently depending on which key is pressed, you'll need to use @code{cond}. For example:
                                                    
                        @code[#:multi-line #t]{; update-player : Number String -> Number
                                               ; given the y-coordinate and a direction, output the NEXT y
                                               (define (update-player y key)
                                                       (cond
                                                         [(string=? key "up")   (+ y 10)]
                                                         [(string=? key "down") (- y 10)]
                                                         [else y]))}}
                   @item{Notice the @code{else} clause at the bottom! Without it, pressing a key that is @italic{not} "up" or "down" will end the program with an error!}]}

@lesson[#:title "Changing Your Game Images"]{
@itemlist/splicing[
                   @item{@(video-link (hyperlink "http://www.youtube.com/watch?v=99plAjsjx78" "Video: A screencast of this section - follow along."))}
                   @item{Open the Game Template (either the WeScheme or DrRacket file). Towards the top of the program, you'll see some values defined for the @code{BACKGROUND}, @code{PLAYER}, @code{DANGER} and @code{TARGET}.}
                   @item{At the moment, they are defined to be simple images. For example: @linebreak[]
                         @code{(define BACKGROUND (rectangle 640 480 "solid" "black"))}}
                   @item{To find new images, use your favorite search engine, such as @(hyperlink "http://images.google.com" "images.google.com").}
                   @item{Try adding "filetype:gif" or "filetype:png" to your searches. If it has a transparent background to begin with, you don't have to edit one in later.}
                   @item{Make sure that PLAYER, TARGET, and DANGER images are at least 100x100, and BACKGROUND images are at least 640x480. A background that is too small will look stretched out.}
                   @item{If you are using @bold{DrRacket}, you can download the images and open them your favorite image editor (e.g. - Photoshop, Paint, GIMP or Acorn).}
                   @item{If you are using @bold{WeScheme}, you can edit the files without ever leaving your browser! Instead, open the file in an online editor like @(hyperlink "http://pixlr.com" "Pixlr").}
                   @item{Make sure that character images have transparent backgrounds. You may want to resize them to ensure that the background is at least 640x480, and that the characters are at least 100x100.}
                   @item{When you are done editing the images, you'll want to save and add them to your games. If you are using a program on your computer to the files, save them into the same folder as your student games. If you are using an online editor like pixlr.com, you can save the file directly to an image-sharing site like @(hyperlink "http://imgur.com" "imgur.com"), or upload it to other sites like Flickr, Dropbox, etc. Wherever you choose to save it on the web, be sure to remember the address for your new image!}
                   @item{In the student game file, replace the definition for each image with code that will load the image from your computer or the internet.: @linebreak[]
@code[#:multi-line #t]{; for loading files from your computer (DrRacket only)
                       (define BACKGROUND (bitmap "SamsGame/water.png")) 
                       ; for loading files from the web
                       (define TARGET (bitmap/url "http://imgur.com/images/water.png")) 
                       }}
                   @item{Time to test it out! Click "Run", and then evaluate those variables in the Interactions window. Typing @code{BACKGROUND}, for example, should show you the image you used for the Background. Once you see all images loading successfully, click "save".}
                   @item{You can rotate, scale, or flip the images using Racket functions:
                         
                         @code[#:multi-line #t]{; rotate : Number Image -> Image
                                                ; scale : Number Image -> Image
                                                ; scale/xy : Image Number -> Image
                                                ; flip-horizontal : Image -> Image
                                                ; flip-vertical : Image -> Image}}]}

@lesson[#:title "Making the Target and Danger Come Back"]{
@itemlist/splicing[@item{The teachpack will automatically regenerate the characters if the @code{onscreen} function returns @code{false} when given the character's x- and y-coordinates.}
                   @item{By default, the function returns true - meaning that the characters are always considered onscreen. Once they get moving, they fly off the screen, never to return!}
                   @item{The "onscreen" logic should also take into account that the characters have width and height! For example, a 200px-wide character will still be partially onscreen even when it's x-coordinate is -50. For this reason, we recommend a "buffer" of roughly 50 pixels on all sides.}
                   @item{In the lesson plans, students write functions that check the left and right sides of the screen separately:
                         
@code[#:multi-line #t]{; safe-left? : Number -> Boolean
                       ; Determines if the x-coordinate is greater than -50
                       (define (safe-left? x)
                         (> x -50))}      
@code[#:multi-line #t]{; safe-right? : Number -> Boolean
                       ; Determines if the x-coordinate is less than 690
                       (define (safe-right? x)
                         (> x 690))}}
                    @item{Then they write a single function, called @code{onscreen?}, which is only true if their characters are protected on the left AND the right: 
                                                                    
@code[#:multi-line #t]{; onscreen? : Number Number -> Boolean
                       ; Determines if the coordinates are within 100 pixels of the screen
                       (define (onscreen? x)
                         (and (safe-left? x)
                              (safe-right? x)))}}
                    @item{If you have an unusually wide or tall character image, you may wish to use larger buffer values.}
                   ]}

@lesson[#:title "Detecting Collisions"]{
@itemlist/splicing[@item{To detect whether or not two characters have collided, the game code needs to know two things: how close they are, and how close they are allowed to be before a "collision" occurs.}
                   @item{You can illustrate this by using the *@code{distances-color}* variable. Setting it to any color will draw triangles to show the distance between the @code{player}, @code{target} and @code{danger}. Setting the value to the empty string @code{""} will hide them again.}
                   @item{The lengths of each the legs is calculated by the @code{line-length} function. Modify the body so that it correctly calculates the distance between @code{a} and @code{b}. You can do this using @code{abs} or @code{cond}:
                                                                           
                    @code[#:multi-line #t]{; line-length : Number Number -> Number
                                           ; the distance between two points on a number line
                                           (define (line-length a b)
                                             (abs (- a b)))}}
                   @item{The hypoteneuse length is calculated by the @code{distance} function. Students will code the distance formula here, using the @code{line-length} function:
                                                                     
                    @code[#:multi-line #t]{ ; distance : Number Number Number Number -> Number
                                            ; the distance between two points on a screen
                                            ; We have the player's x and y, and a character's x and y.
                                            ; How far apart are they?
                                            (define (distance px py cx cy)
                                              (sqrt (+ (sq (line-length px cx))
                                                       (sq (line-length py cy)))))}}
                   @item{Finally, collide? starts out always returning false, so nothing collides even when you have the distances all working. Use the distance formula, with some threshold:
                    @code[#:multi-line ""]{(define (collide? px py cx cy)
                                             (< (distance px py cx cy) 50))}}]}

@lesson[#:title "Exploring the Teachpack"]{
The bootstrap-teachpack lets you do more -- try the Supplemental Lessons for some ideas and challenges: play with 2d motion, random numbers, a different collide? function, or harder play based on @code{*score*}.}

@copyright[]

