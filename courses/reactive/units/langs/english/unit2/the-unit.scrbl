#lang curr/lib

@title{Unit 2: Introduction to Data Structures}



@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / num-sqr num-sqrt})
                                       (list "String" @code{string-append string-length})
                                       (list "Image"  @code{rectangle circle triangle ellipse star text}))
                                                                                                          ]{
@unit-descr{Students discover the need for compound date - data structures - using 2-dimentionsal
            animation. They learn the syntax for data blocks, constructors and dot-accessors, and
            practice each by creating a "digital bakery".}
}
@unit-lessons{
              
@lesson/studteach[
     #:title "Review"
     #:duration "15 minutes"
     #:overview ""
     #:learning-objectives @itemlist[@item{Students will deepen their understanding of function definitions and the Design Recipe}]
     #:evidence-statements @itemlist[@item{}]
     #:product-outcomes @itemlist[@item{}]
     #:standards (list "BS-M" "BS-PL.3" "BS-DR.1" "BS-DR.1" "BS-DR.2" "BS-DR.2" "BS-DR.3")
     #:materials @itemlist[@item{Pens/pencils for students, fresh whiteboard markers for teachers}
                            @item{Class poster (List of rules, language table, course calendar)}
                            @item{Language Table (see below)}
                            @item{Student @resource-link[#:path "workbook/StudentWorkbook.pdf" #:label "Workbook"] folders with names on covers, and something to write with}]
     #:preparation @itemlist[@item{Write Agenda on board}
                             @item{Display class posters, Language Table, Design Recipe}]
     
      #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
                @point{@student{In the previous unit, you reviewed almost everything from Bootstrap:Algebra including Datatypes, Contracts, and the Design Recipe. 
                                In this unit you will go above and beyond all that, and learn an entirely new construct that will be the basis for everything you'll do in Bootstrap:Reactive.}
                        @teacher{Ask a few introductory review questions to test students' understanding: 
                                 @itemlist[@item{What are the three parts of a Contract?}        
                                            @item{What is the Pyret code to draw a solid, green triangle of size 22?}
                                            @item{Why is it important to write at least 2 examples before defining a function?}]}} 
                 
                 @point{@student{To make sure the material from the previous unit is fresh in your mind, tackle the following activity: @activity{Turn to @worksheet-link[#:name "double-radius"] in your workbook. Write a function called @code{double-radius}, 
                                                   which takes in a radius and a color. It produces an outlined circle of whatever color was passed in, with radius 
                                                   twice as big as the input.}}
                        @teacher{If walking through this example as a class, use a projector so kids can see the function being written on the computer.}}
                 @point{@student{Remember how to use the design recipe to work through word problems? @bannerline{Step 1: Contract and Purpose Statement}
                                 @activity[#:forevidence (list "BS-M&1&2" "BS-DR.1&1&1" "BS-DR.1&1&2")]{ @itemlist[@item{What is the @vocab{Name} of this function? How do you know?}
                                                       @item{How many inputs does it have in its @vocab{Domain}?}
                                                       @item{What kind of data is the @vocab{Domain}?}
                                                       @item{What is the @vocab{Range} of this function?}
                                                       @item{What does this function do? Write a @vocab{Purpose Statement} describing what the function does in plain English.}]}
                                 @code[#:multi-line #t]{
# double-radius : Number String -> Image
# Makes an outlined circle that has twice the given radius.}}
                         @teacher{Review the purpose of Contracts: once we know the Name, Domain, and Range of a function, it's easy to write examples using those datatypes.}}
           
                 @point{@student{@bannerline{Step 2: Examples} 
                                  @activity[#:forevidence (list "BS-DR.2&1&1")]{Using only the Contract and Purpose Statement, see if you can answer the following questions:
                                            @itemlist[@item{Every example begins with the name of the function. Where could you find the name of the function?}
                                                       @item{Every example has to include sample inputs. Where could you find out how many inputs this function needs, 
                                                             and what type(s) they are?}
                                                       @item{Every example has to include an expression for what the function should do when given an input. Where 
                                                             could you look to find out what this function does?}
                                                       @item{Write two examples on your paper, then circle and label what is changing between them. When labeling,
                                                             think about what the changing things represent.}
                                                       ]}
Don't forget to include the lines @code{examples:} and @code{end}! Your examples should look similar to:
                                  @code[#:multi-line #t]{examples:
                                                           double-radius(50, "pink") is
                                                                 circle(50 * 2, "outline", "pink")
                                                           double-radius(918, "orange") is 
                                                                 circle(918 * 2, "outline", "orange")
                                                         end}}
                         
                         @teacher{Each one of these answers can be found in the Contract or Purpose Statement. Suggestion: Write these steps on the board, and draw 
                                  arrows between them to highlight the process. The goal here is to get students into the habit of asking themselves these questions
                                  each time they write examples, and then using their own work from the previous step to find the answers.}}
                @point{@student{@bannerline{Step 3: Definition}
                                Once you know what is changing between our two examples, you can define the function easily. The things that were circled and labeled in
                                the examples will be replaced with @vocab{variables} in the function definition. 
                                @activity[#:forevidence (list "BS-DR.3&1&1")]{Underneath your examples, copy everything that @bold{doesn't} change, and replace the changing things with the variable 
                                          names you used. (Don't forget to add the @code{fun} and @code{end} keywords, as well as the colon (:) after the function header!)}  
           @code[#:multi-line #t]{
# double-radius: Number, String -> Image
# Makes an outlined circle that's twice the radius.
fun double-radius(radius, color):
  circle(radius * 2, "outline", color)
end}
           @activity[#:forevidence (list "BS-M&1&1" "BS-PL.3&1&3" "BS-DR.1&1&1" "BS-DR.1&1&2" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1")]{For more practice, turn to @worksheet-link[#:name "double-width"] in your workbook and complete the Design Recipe for the @code{double-width} function.}}
                @teacher{Check students understanding: Why do we use variables in place of specific values? Why is it important to have descriptive variable
                         names, as opposed to @code{n} or @code{x}?
                          Remind students about nested functions: A function whose range is a number can be used inside of a function requiring a number in its domain, as in 
                                 @code{circle(2 * 25, "outline", "red")}.}}
                ]}
                
                
@lesson/studteach[
        #:title "Introducing Structures"
        #:duration "30 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will understand the limitations of atomic datatypes}]
        #:evidence-statements @itemlist[@item{}]
        #:product-outcomes @itemlist[@item{Students identify real-world behaviors that require data structures}]
        #:standards (list "BS-M" "BS-DR.1" "BS-DR.2" "BS-DR.3" "BS-DR.4" "BS-IDE")
        #:materials @itemlist[@item{}]
        #:preparation @itemlist[@item{The @editor-link[#:public-id "0B9rKDmABYlJVbUVUeVJDZ1p3Ulk" "Parachute Jumper"] file preloaded on student machines}]
        #:prerequisites (list)
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
          @points[
                   @point{@student{@activity{Open the @editor-link[#:public-id "0B9rKDmABYlJVbUVUeVJDZ1p3Ulk" "Parachute Jumper"] file on your computer and press 'Run'. What happens?}
                                    The parachute jumper jumps out of the airplane and falls straight down, into the water! It's much safer to land on the shore. Let's take a look at the code to see why he falls into the water instead. There are a few new concepts in this file, but first, let's focus on what you already know.
                                    @activity[#:forevidence (list)]{Look at the function defined here called @code{next-position}. @itemlist[@item{What is this function's Domain? Its Range?}
          @item{What does @code{next-position} do with its inputs?}]}
                                    This function takes in two numbers, representing the x and y coordinate of the parachute jumper, but it changes and returns only the y-coordinate, by subtracting 5 from it. But if only the y-coordinate is changing, he'll always fall straight down, landing in the water every time. To reach the land, he'll have to fall diagonally. How could we make that happen?
                                    @activity[#:forevidence (list)]{How should the jumper's x-coordinate change if he moves diagonally to the right (toward the land)? How should his y-coordinate change?}}
                           @teacher{}}
                    
                    @point{@student{Functions can return only one thing at a time, but we need to return both an x @bold{and} a y-coordinate in order to make the jumper move diagonally. Thankfully, we have a way to combine multiple things within one container, called a @vocab{Data Structure}. Just like Racket and Pyret have built-in functions and also let you define your own functions, these languages allow you to create your own data structures as well. For this project, we've created a structure for you to use called @code{JumperState}, which contains two Numbers, representing an x and a y-coordinate.                                                                            @activity{Look at line 6, where we've defined @code{JumperState}. We'll go through the new syntax for defining a data structure, because very soon you'll be defining brand new structures of your own!}
                            @itemlist[@item{First, we've written a comment to remind ourselves what we're creating. In this case, we're calling our new structure @code{JumperState}, which contains two numbers: an x and y-coordinate.}
                                      @item{The next line begins with @code{data JumperState:}. Similar to the keyword @code{fun} you learned in the last lesson, @code{data} tells the computer that you're about to define a new type of data. This is a @bold{very} powerful  piece of code: In Bootstrap:Algebra, you wrote programs using four @vocab{data types}: Numbers, Strings, Images, and Booleans. In this course, now you can create brand new data types. We can use these data types to create complex animations, multi-player video games, or account for both coordinates of a parachute jumper, so he moves in 2-dimensions! We called this data type @code{JumperState}, because it represents the current state, or position, of the parachute jumper.  Pyret would let us write any name after @code{data}, but as a convention, the name of a new data structure is capitalized, and we choose a meaningful name for it.}
                                      @item{The next line begins with the | symbol, sometimes called a "bar" or "pipe", followed by the name of the @vocab{constructor} function for the structure (in this case, @code{jumper}.)  A @vocab{constructor} function is similar to some functions you've seen before, for creating images.  To create an Image, we call the function that creates it: @code{rectangle}, @code{triangle}, @code{square}, etc. Similarly, to create a @code{JumperState}, we can use the @code{jumper} @vocab{constructor} function with its inputs (two numbers, called x and y).  Again, the names @code{JumperState} and @code{jumper} were chosen by us, the programmer, and putting them in a @code{data} definition makes them available as a new data type and as a constructor function.}] 
                                                                                       Let's get back to constructing a @code{jumper}, specifically how we knew the inputs would be numbers. The block of code we've given you defines all of this! @code[#:multi-line #t]{data JumperState:
       | jumper(
          x :: Number, 
          y :: Number)
    end}
   
tells us that we're defining a new data type called @code{JumperState}, whose constructor function @code{jumper} takes in two things: x, which is a Number, and y, which is also a number. Once we've listed each input and its data type, we finish defining the structure with the @code{end} keyword, just like finishing an @code{example} block.}
                            @teacher{This is the first data block students see in this course, but they will soon be writing their own to create new data structures. It's worth spending the time to cover this new syntax, paying special attention to capitalization (the name of the structure is capitalized (JumperState), whereas its constructor function (jumper) is lowercase), double colons (::) before data types, and commas between inputs to the constructor function.}
                            }
                                     
                    @point{@student{Now it's up to us to protect this parachute jumper, and make sure he lands safely on the shore. @activity[#:forevidence (list "BS-M&1&2" "BS-DR.1&1&1" "BS-DR.1&1&2")]{Turn to @worksheet-link[#:name "next-position"] in your workbook, read the word problem, and fill in the Contract and Purpose Statement for the function @code{next-position}.}
    @code[#:multi-line #t]{# next-position : Number Number -> JumperState
                           # Given 2 numbers, make a JumperState by 
                           # adding 5 to x and subtracting 5 from y}}
                            @teacher{Point out that we're now using a new data type in a contract: @code{next-position} consumes two Numbers, and produces a @italic{JumperState}. Once we've defined a new data structure using the above data block, we can use it just like other datatypes.}}

                    @point{@student{Now for our two examples. Using, or @vocab{calling} @code{next-position} with two numbers is easy, but what happens to those numbers? We can't return both at the same time... unless we use a data structure! To do so we'll need to use the constructor function to make a structure from the data we already have. @activity[#:forevidence (list "5.OA.1-2&1&1" "5.OA.1-2&1&1" "7.EE.3-4&1&1" "A-SSE.1-2&1&1" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.4&1&1")]{@itemlist[@item{According to the definition for @code{JumperState}, what function makes a JumperState? What is its contract?}
                    @item{@code{# jumper : Number Number -> JumperState}}
                    @item{What two things are part of a JumperState? Do we have values for those things as part of our first example?}
                    @item{We don't want our JumperState to contain the same x and y values we gave the @code{next-position} function. How will the values change? (Remember to show your work!)}
                    @item{Your first example should look something like: 
                          @code[#:multi-line #t]{examples:
                                                   next-position(30, 250) is jumper(30 + 5, 250 - 5)
                                                 end}}
                    @item{Once your first example is complete, write one more example with different inputs for the x and y coordinates.}]}}
                            @teacher{Remind students to show every step of their work in the example step of the design recipe: if the x-coordinate increases by 5 while the y-coordinate decreases by 5, they should show the addition and subtraction within the JumperState data structure, instead of just returning the new numbers.}}
                    
                    @point{@student{@activity[#:forevidence (list "BS-DR.3&1&1" "BS-DR.4&1&2")]{Now that you have two examples, it's time to define the function. You know the drill: circle and label everything that changes between your two examples, copy everything that stays the same, and replace the changing things with the variables you chose.}
                                     When you finish, your function definition should look like: @code[#:multi-line #t]{fun next-position(x, y):
                         jumper(x + 5, y - 5)
                       end}
                                     Now, instead of just changing and returning one number (a y-coordinate), we can return @bold{both} the x and y-coordinates of the parachute jumper within a @vocab{Data Structure}. @activity[#:forevidence (list "BS-IDE&1&1")]{Open the @editor-link[#:public-id "0B9rKDmABYlJVbUVUeVJDZ1p3Ulk" "Parachute Jumper"] code again and replace the original @code{next-position} function with the one in your workbook to make the parachute jumper land safely on the shore! Don't forget to change the given examples to match your new function definition.}}
                           @teacher{}}
                    
                    @point{@student{In Bootstrap:Algebra, a function could return only one value: either a Number, String, Image, or Boolean. In Bootstrap:Reactive, our functions will still return one value, but that value can be a @vocab{Data Structure}, (or just "structure" for short) containing any number of things within it. This way we could return both the x and y-coordinate of a player using a JumperState, or create new structures and return even more detail about a player, like their health, position, amount of armor, or inventory.}
                            @teacher{In Bootstrap:Algebra, students' games were made by keeping track of just a few numbers: the x-positions of the danger and target, and y-position 
                                     of the player. In Bootstrap:Reactive, students' games will be much more complex, and will require many more values to move characters, test conditions, 
                                     keep track of the score, etc. Data structures simplify code by organizing multiple values: You couldn't represent every part of a player 
                                     (position, health, inventory, etc.) with one number or string, but you can refer to all these things collectively with a @vocab{data structure}. This way, we can have one value (a data structure) containing multiple other values that can be accessed individually.}}
                    ]
           }

@lesson/studteach[#:title "Cakes"
        #:duration "30 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{}]
        #:evidence-statements @itemlist[@item{}]
        #:product-outcomes @itemlist[@item{Students make use of a complex data structure: @code{Cake}}
                                     @item{Students define variables bound to Cakes}
                                     @item{Students will generalize their understanding of function constructors and accessors}]
        #:standards (list "BS-PL.1" "BS-DS.1" "BS-DS.2" "BS-IDE")
        #:materials @itemlist[@item{}]
        #:preparation @itemlist[@item{The @editor-link[#:public-id "0B9rKDmABYlJVa0cxbEpoSG1pT0k" "Bakery"] file preloaded on students' machines}]
        #:prerequisites (list)
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
          @points[
                   @point{@student{Suppose you own a famous bakery. You bake things like cookies, pastries, and tarts, but you're especially known for your world-famous cakes.
                                   What type of thing is a cake? Is it a number? String? Image? Boolean? You couldn't describe all of the important things 
                                   about a cake with any one of those data types. However, we could say that we care about a couple of details about each cake, each of which can be described with the types we already know.
                                   @activity[#:forevidence (list "BS-DS.2&1&1")]{For each of the following aspects of a cake, think about what datatype you might use to represent it:
                                             @itemlist[@item{The flavor of the cake. That could be "Chocolate", "Strawberry", "Red Velvet", or something else.}
                                                       @item{The number of layers}
                                                       @item{Whether or not the cake is an ice cream cake.}]
                                              What datatype could we use to represent the entire cake?}
                                   @bitmap{images/chocolate-cake.png}                                                   
                                   Now that we know everything that is part of a cake, we can use a data structure to represent the cake itself. Let's take a look at how this works.
                                   @activity{Open your workbook to @worksheet-link[#:name "Cakes"].}
                                   On this page, we will define a data structure for cakes, which we call @code{CakeType} (since this is now a new data TYPE). At the top of this page we see a comment, stating what things are part of a @code{CakeType}. Below that is a line that says @code{data CakeType:}, which begins the definition of a new data structure, called CakeType. On the next line, we define the function that makes a CakeType (@code{cake}), and how @italic{exactly} to make a CakeType---the names of each thing in a CakeType, and their data types. Each piece of information that makes up a cake (the flavor, etc) is called a @vocab{field}.  A field has both a descriptive name (like @code{flavor}) and a datatype.
				   
                                   @activity{What name describes the first field in a CakeType? What data type can we use to represent it?}
				   
                                   There is a little bit of new syntax involved in defining structures. On the first line on @worksheet-link[#:name "Cakes"], we write @code{flavor :: String,}, which tells Pyret that the first element of @italic{any} CakeType will be its flavor, represented by a String. This line shows how to define one field in a data structure.
				   
                                   @activity{What name describes the second field in a CakeType? What data type can we use to represent it?}
				   
                                   On the next line, write @code{layers :: Number,}, which tells Pyret that the second element of any CakeType will be its number of layers, represented by a Number.
				   
                                   @activity{What data structure should we use to represent whether or not the CakeType is an ice cream cake?  Use this to define another field.}
				   
                                   On your paper, you should have: 
                                   @code[#:multi-line #t]{ # a CakeType is a flavor, number of layers, 
                                                           # and whether or not it is an ice cream cake.
                                                       data CakeType:
                                                         | cake(
                                                             flavor      :: String,
                                                             layers      :: Number, 
                                                             is-iceCream :: Boolean)
                                                       end}
                             This is the code that defines the CakeType data structure. It tells the computer what a CakeType is and what goes into it. It also defines its @vocab{constructor} function, called @code{cake}. To make a CakeType, you @italic{must} call the constructor function with three things: a @code{flavor}, which is a String, @code{layers}, a Number, and @code{is-iceCream}, which is a Boolean. Remember that order matters! For now, these are the only things that we're going to keep track of in a CakeType, but you can imagine how you might extend it to include other information.}
                        @teacher{Stress the importance of being able to define your own datatypes
                                 to students: no longer are they bound by the single values of numbers, strings, or booleans! Pyret allows you to define brand new @vocab{Data Structures}, containing 
                                 any combination of values.}}
                   
                    @point{@student{@activity{Open the @editor-link[#:public-id "0B9rKDmABYlJVa0cxbEpoSG1pT0k" "Bakery"] file and look at lines 3 - 8. Do they match what you have on your paper?} 
                                      Now take a look farther down, at line 10: @code{birthday-cake = cake("Vanilla", 4, false)}
                                               @itemlist[@item{What is the name of this variable?}
                                                          @item{What is the flavor of @code{birthday-cake}?}
                                                          @item{How many layers does @code{birthday-cake} have?}
                                                          @item{Finally, is @code{birthday-cake} an ice cream cake, or not?}]}
                            
                            @teacher{Below the data definition for CakeType there are four CakeTypes defined and assigned to the variables @code{birthday-cake}, @code{chocolate-cake}, @code{strawberry-cake}, and @code{red-velvet-cake}. Ask students questions about these CakeTypes to get them thinking about how they would define their own.}}
                    @point{@student{@activity[#:forevidence (list "BS-IDE&1&1" "BS-PL.1&1&1" "BS-DS.1&1&4")]{On line 14, define another CakeType, which you can name however you like (but choose something descriptive, like @code{pb-cake}, @code{lemon-cake}, etc.) To start,
                                                                         @itemlist[@item{how would you define this variable?}
                                                                                    @item{What function is used to make a Cake?}
                                                                                    @item{Which thing comes first in a Cake structure?}] 
                                              Now what do you expect to happen when you type the name of your new CakeType into the interactions area? Click 'Run' and try it out.}
                                              @code{pb-cake = cake("Peanut Butter", 2, true)}}
                            @teacher{Have students walk you through the process of defining a new value and making a CakeType with whatever flavor, etc. they like.}}
                 @point{@student{@activity[#:forevidence (list "BS-IDE&1&1" "BS-PL.1&1&1" "BS-DS.1&1&4")]{Define two new values for some of your favorite cakes. You can give them whatever names you prefer. You can make any kind of CakeTypes that you want, as long as your structure has the right types in the right orders!}}
                         @teacher{Repetition is key in this lesson. Have students identify each part of the CakeType for every CakeType they've defined.
                                  What is the flavor of their first CakeType? Its number of layers? Ensure that students are using their inputs in the right order!}}
                 
                 @point{@student{At this point, you've worked with two different @vocab{Data Structures}: JumperStates and CakeTypes, and you've created different examples, or @vocab{instances}, of these structures.
		 		 Instances are concrete uses of a datatype, just as 3 is a concrete Number (where Number is the type).  Here, CakeType is the type, and @code{cake("Chocolate", 8, false)} is
				 a concrete cake with specific values for each field. In programming, we create instances much more often than we create new data structures.
				 For now, the important point is to recognize the difference between a structure @italic{definition} (the @code{data....} piece of code) and
				 specific @vocab{instances} of a data structure (like @code{birthday-cake}, or @code{jumper(44, 75)}.
                         @bitmap{images/strawberry-cake.png}  
                         }
                            @teacher{Students often struggle with the difference between the definition of a data structure and instances (items created from) a data structure. When students define CakeType, they haven't
			             created any specific cakes.  They have defined a type that they can use to define specific cakes.  If they have a specific cake, they can ask questions of it such as "is this a chocolate
				     cake?" and produce an answer.  If all they have is the CakeType definition, they can't answer such questions. Some people like the analogy of a cookie cutter here -- CakeType defines
				     a cookie cutter, but doesn't produce any cookies.  To get a cookie, you use the @code{cake} constructor to define a specific cake with specific values for the fields.}}
                    
                    @point{@student{Based on these instances of CakeTypes you just wrote:
                                    @activity[#:forevidence (list)]{@itemlist[@item{What is the name of the function that creates a CakeType?}
                                                        @item{What is the Domain of this function?}
                                                        @item{How many things are in the domain?}]} The three things in the domain of @code{cake} are, in fact, the three things that we have already listed on @worksheet-link[#:name "Cakes"]! With data structures, the order is very important: we always want the first string in @code{cake} to be the CakeType's flavor, the first number to be its number of layers, etc.}
                                   
                         @teacher{CakeTypes are the first example of defining a new datatype that students will see, but Pyret allows you to define any number of new data structures to hold
                                  any combination of values. The important points to remember about creating structures at this point is that whenever the constructor function is called (in this case, @code{cake}), it must take in the same 
                                  number and type of values as in the structure's definition, and its inputs must be in the @italic{same order} as the definition.}}
              
                 @point{@student{@activity[#:forevidence (list "BS-IDE&1&1")]{After clicking the "Run" button, in Pyret, type @code{birthday-cake} into the interactions area and hit enter. What do you get back?}
                                  Does this make sense? What happens when you type just a number into the interactions area? We get that same number back! What about Strings? Images? 
                                  Booleans? If we don't do anything to our input, or use any function on it, we get back exactly what we put in! Here, you put in a CakeType, let's see what we get back.  At first glance, it looks like a function call was the answer!  But there's a few things different about what appears in the output.  First, it isn't the same color as a normal function call, which is the first hint that something's different.  Second, we can @emph{click} on it, and see that this value is storing three other values in its @vocab{fields} – the flavor, layers, and whether or not it's ice cream.  This compound value that's printed is an @vocab{instance} of a @code{CakeType}.  It's a value in its own right, so when we type in @code{birthday-cake} it shows us this value (just like with numbers and strings).}
                         @teacher{Remind students that values will always evaluate to themselves. 4 evaluates to 4, the string @code{"pizza"} evaluates to @code{"pizza"}, and @code{birthday-cake} evaluates
                                  to @code{cake("Vanilla", 4, false)}}}
                
                      
                  ]
           }
                 
          
@lesson/studteach[#:title "Dot-Accessors"
                  #:duration "10 minutes"
                  #:overview ""
                  #:learning-objectives @itemlist[]
                  #:evidence-statements @itemlist[]
                  #:product-outcomes @itemlist[@item{Students write code that extracts each field from those Cakes}]
                  #:standards (list "BS-IDE")
                  #:materials @itemlist[]
                  #:preparation @itemlist[]
                  #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      
      ]{@points[
                @point{@student{Suppose you want to get the flavor @emph{out} of @code{chocolate-cake}. You don't care about the message, color, or anything else - you just want to 
                                know the flavor. Pyret has syntax for doing precisely that: @code{.flavor}.
                                @activity[#:forevidence (list "BS-IDE&1&1")]{If you type @code{chocolate-cake.flavor} into the interactions area, what should it evaluate to? Try it out! 
                                                      @itemlist[@item{What kind of thing did it return: A Number, String, Image, Boolean, or structure?}
                                                                 @item{Practice taking the flavor out of @emph{every} CakeType you have defined, using @code{.flavor}}]}
                    
                                Of course, there are ways to access any part of a CakeType, not just the flavor! What do you think you would get if you typed @code{chocolate-cake.layers} in the interactions area? 
                                @activity[#:forevidence (list "BS-IDE&1&1")]{Try using the dot-accessors @code{.layers} and @code{.is-iceCream} on your CakeTypes! Do they do what you expect?}}
                 @teacher{A way to prompt students to use these accessors is to ask: "How do you get the flavor out of a CakeType?" or "How do you get the layers out of a CakeType?"
                          Throughout the course you can set up a call and response system with students, where the question "How do you get the X out of a Y?" will prompt the name of the accessor.}}
                 
                 @point{@student{The previous syntax is known as @vocab{Dot-Accessors}. They allow you to specify exactly what part of a structure you want. If we want to know if we can fit a certain CakeType through a doorway, we probably care only whether the number of layers is less than a certain amount. Likewise, if we want to know whether or not a character in our game has lost, we need to know only if her health is less than 0: 
                                 we might not care what her location is, or the color of her armor. Programmers use accessors a lot, because they often need to know only one piece of information from a complex data structure.}
                         @teacher{}}
                                    
                                    
                  @point{@student{Our CakeType structure is defined using @code{data CakeType:} and the @code{cake(...)} lines, which tell the computer what things make up that structure, and what order and type each 
                                                          thing is. In return, we get new functions to use. Until we write these lines, we don't have 
                                                          @code{cake(...)} (to make a Cake), @code{.flavor} (to get the flavor out of the Cake), @code{.layers}, or any other dot-accessors, because Pyret doesn't know what a CakeType is- @italic{we haven't defined it}.
            @activity[#:forevidence (list "BS-IDE&1&1")]{To see this for yourself, type a pound sign (#) before the line which begins with @code{cake(...)} and each of the fields. This comments out the definition, so that the computer ignores it. Hit run, and see what happens. }}
                    @teacher{When the @code{cake(...)} lines are commented out, Pyret returns some errors, saying you're trying to use @code{cake} before its definition. It doesn't know what @code{cake} is or does, because we defined a CakeType structure with no constructor. Make sure students understand that the line beginning with
                                      @code{data} and a line similar to @code{cake(...)} are needed in order to create and work with @italic{any} structure.}}         
                                    ]
         }
       
       
@lesson/studteach[#:title "Your Bakery"
        #:duration "30 minutes"
        #:overview ""
        #:learning-objectives @itemlist[@item{Students will write complex functions that consume, modify and produce structures}]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students will write functions that access fields of a CakeType}]
        #:standards (list "BS-DR.1" "BS-DR.2" "BS-DR.3" "BS-DR.4" "BS-DS.1")
        #:materials @itemlist[]
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      
      ]{
        @points[@point{@student{Of course, when programmers work with data structures, they don't just define them and create instances. They also write functions that use and produce structures. Let's get started writing some functions for CakeTypes.}
                        @teacher{}}
                 
                 @point{@student{@activity[#:forevidence (list "BS-DR.1&1&1" "BS-DS.2&1&1")]{Turn to @worksheet-link[#:name "taller-than"] in your workbook. Write the contract and purpose statement for a function called @code{taller-than}, which consumes two CakeTypes, and produces true if the first CakeType is taller than the second.
                                                   @itemlist[@item{What is the domain for this function?}
                                                             @item{What is the range of @code{taller-than}?}
                                                             @item{Which part(s) of the CakeTypes will you need to check to determine if one is taller than the other?}]}
               @code[#:multi-line #t]{
# taller-than: CakeType, CakeType -> Boolean
# consumes two CakeTypes and produces true if the number of 
# layers in the first CakeType is greater than the number of 
# layers in the second}
               For your first example, try comparing @code{birthday-cake} and @code{chocolate-cake}. Do we care about what flavor either of these CakeTypes are? What about whether or not one of them is an ice cream cake? All we need to figure out which one is taller is their number of layers. 
               @activity{How do you get the number of layers out of @code{birthday-cake}? What about @code{chocolate-cake}? Write your first example to figure out if @code{birthday-cake} has a greater number of layers than @code{chocolate-cake}.}}
                         @teacher{ }}
                 
                 @point{@student{
                  @code[#:multi-line #t]{examples:
                                             taller-than(birthday-cake, chocolate-cake) is 
                                             birthday-cake.layers > chocolate-cake.layers
                                             
                                         end}
                                                                        
      @activity[#:forevidence (list "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.4&1&1" "BS-DR.4&1&2")]{@itemlist[@item{Write one more example for the function @code{taller-than}, this time using it to compare any two CakeTypes you defined earlier.} 
                                                      @item{Next, circle and label what changes between the two examples. How many variables will this function need? Then write the definition, using your examples to help you.}]}
                        
                                  After replacing the changing things with variables, your definition should look similar to: 
                                  @code[#:multi-line #t]{fun taller-than(a-cake1, a-cake2):
                                                           a-cake1.layers > a-cake2.layers
                                                         end}}
                         @teacher{ }}
                 
                 @point{@student{@activity[#:forevidence (list "BS-DR.1&1&1" "BS-DR.1&1&2" "BS-DR.2&1&1" "BS-DR.2&1&3" "BS-DR.3&1&1" "BS-DS.1&1&5")]{Turn to @worksheet-link[#:name "will-melt"] in your workbook. Your bakery needs to know if certain CakeTypes needs to be refrigerated. If the temperature is greater than 32 degrees AND the given CakeType is an ice cream cake, the function should return true. 
                                                   @itemlist[@item{Fill out the @vocab{Contract} and @vocab{Purpose Statement} for the function.}
                                                              @item{Write two examples for how one would use @code{will-melt}.}
                                                              @item{Circle and label what varies between those examples and label it with a @vocab{variable} name.}
                                                              @item{Define the function.}]}}
                         @teacher{Give students plenty of time to practice using dot-accessors, extracting pieces of the Cake structures and writing expressions that compute with them.}}
                                                                                                          @point{@student{@bold{Optional:} In the @editor-link[#:public-id "0B9rKDmABYlJVa0cxbEpoSG1pT0k" "Bakery"] file, extend the CakeType data structure to include one more field: a message, represented as a String. (Make sure you remember to change each CakeType instance below the data definition: if a CakeType now contains four fields, each instance will need to include all four fields!) Next, write a function called @code{birthday-cake}, which takes in a string representing someone's name, and produces a 2-layer, chocolate CakeType with "Happy birthday [Name]!" as the message. @bold{Hint:} You'll want to use the @code{string-append} function to combine two strings into one. Here is its contract: @code{# string-append : String, String -> String}}
                                                                                                @teacher{Since this function returns a CakeType, remind students that they'll need to use the @code{cake} constructor function to produce a CakeType. }}  ]
         }

@lesson/studteach[#:title "Closing"
        #:duration "5 minutes"
        #:overview ""
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[]
        #:standards (list)
        #:materials @itemlist[]
        #:preparation @itemlist[]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[@point{@student{@vocab{Data Structures} are a powerful tool for representing complex data in a computer program. Simple videogames, like Pong, might need to
                                keep track of only a few numbers at once, such as the position of the ball, position of each paddle, and the score. But if a game has many 
                                different enemies, each with its own position and health, or multiple levels with their own background images, the game can get 
                                very complicated very fast, and structures are a great way to manage and make sense of all the data. Programmers can do a LOT with data
                                structures, and in the upcoming lessons you'll start creating your own structures to make a customized animation.}
           @teacher{Have students volunteer what they learned in this lesson!}}
  
           
 ]}
       }
       
       


