#lang curr/lib

@drill[]{
  @itemlist/splicing[
    @item{Try to come up with contracts for the following scenarios.}
    @item{Suppose you want to cook a meal. What would be the contract for @code{cook-meal}? Remember that to make a meal, you need the correct ingredients, the correct tools, and you have to choose what you want to make. 
          First, describe the domain and range of @code{cook-meal}. Next, write a contract for the @code{cook-meal} procedure. @linebreak[]
          @code[#:contract ";cook-meal :"] @drop-down[#:id "Contract-Drill1" #:options (list "" 
                                                                         "Food -> Recipe Ingredients Tools"
                                                                         "Ingredients Tools -> Recipe Food"
                                                                         "Recipe Ingredients -> Tools Food"
                                                                         "Ingredients Tools Recipe -> Food"
                                                                         "Tools Food Ingredients -> Recipe")]
          @check[(constraint:string-eq  (value:string "Ingredients Tools Recipe -> Food") (value:form "Contract-Drill1"))]}
   @item{Suppose you have a quarter, but you want your friend's quarter. When he isn't looking, you quickly swap your quarter with your friend's quarter. What is the contract for @code{swap-quarter}? What is the domain and range? Remember that contracts show the TYPE of input and outputs, but NOT the actual input or output. @linebreak[]
         @code[#:contract "; swap-quarter :"] @drop-down[#:id "Contract-Drill2" #:options (list "" 
                                                                                                "HisQuarter -> MyQuarter"
                                                                                                "Quarter -> Quarter"
                                                                                                "MyQuarter -> HisQuarter")]
         @check[(constraint:string-eq  (value:string "Quarter -> Quarter") (value:form "Contract-Drill2"))]}
   @item{A TV channel asks you to enter the genre of your favorite movie, and then shows a movie title from the genre and the year it was made. What are the domain and range? What is the contract for @code{movie-info}? @linebreak[]
         @code[#:contract "; movie-info :"] @drop-down[#:id "Contract-Drill3" #:options (list ""
                                                                                              "Genre -> Title Year"
                                                                                              "Title Year -> Movie"
                                                                                              "Movie -> Title Genre"
                                                                                              "Genre Movie -> Title Year"
                                                                                              "Title -> Genre Year")]
         @check[(constraint:string-eq (value:string "Genre -> Title Year") (value:form "Contract-Drill3"))]}
   @item{You really want a chocolate bar, so you go to the vending machine. You put in your money and enter the code for the snack you want, and your chocolate bar drops out! What is the contract for @code{vending-machine}? @linebreak[]
         @code[#:contract "; vending-machine :"] @drop-down[#:id "Contract-Drill4" #:options (list ""
                                                                                                   "Money -> Chocolate"
                                                                                                   "Chocolate -> Snack Code"
                                                                                                   "Snack -> Chocolate"
                                                                                                   "Code -> Snack"
                                                                                                   "Money Code -> Snack")]
         @check[(constraint:string-eq (value:string "Money Code -> Snack") (value:form "Contract-Drill4"))]}
    @item{It's time to do the laundry! You put your dirty clothes into the laundry machine and add detergent. You come back an hour later and get your clean clothes. What is the contract for @code{laundry-machine}? @linebreak[]
         @code[#:contract "; laundry-machine :"] @drop-down[#:id "Contract-Drill5" #:options (list ""
                                                                                                   "Socks -> T-shirts"
                                                                                                   "Detergent -> Clothes"
                                                                                                   "Clothes Detergent -> Clothes"
                                                                                                   "Clothes -> Clothes")]
         @check[(constraint:string-eq (value:string "Clothes Detergent -> Clothes") (value:form "Contract-Drill5"))]}
   @item{Suppose you buy a packet of seeds. You plant a handful in the garden and water it. A week later you see that your seeds have grown into plants! What is the contract for @code{grow-plant}? @linebreak[]
         @code[#:contract "; grow-plant :"] @drop-down[#:id "Contract-Drill6" #:options (list ""
                                                                                              "Packet -> Plant"
                                                                                              "Seeds Water -> Plant"
                                                                                              "Plant -> Plant"
                                                                                              "Plant -> Water Seeds"
                                                                                              "Seeds -> Seeds")]
         @check[(constraint:string-eq (value:string "Seeds Water -> Plant") (value:form "Contract-Drill6"))]}
   ]}
         


 