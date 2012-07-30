#lang curr/lib

@title{Unit Five Homework}

@lesson[#:title "Question One:"]{Your school is holding a bake sale, and you are in charge of writing computer programs to determine the cost of production, income, and total profits from baking various treats. you are also in charge of baking cookies, which cost $0.25 each to bake, and sell for $1.00/cookie.

Write the function @italic{cost-cookie,} which takes in the number of cookies you intend to sell, and gives you back the amount of money it would cost to produce that number of cookies. }
@bitmap{images/Cookies.jpg}
@include-section["design-rec.scrbl"] 


@lesson[#:title "Question Two:"]{Write the function @italic{income-cookie,} which again takes in the number of cookies you will sell, and gives you back the amount of money you will put in the cash register at the bake sale selling that number of cookies.}
@include-section["design-rec.scrbl"]

@lesson[#:title "Question Three:"]{Write the function @italic{profit-cookie,} which takes in the number of cookies you sold, and gives you back the total @bold{profit} you make from selling your cookies, @bold{accounting for the money spent on materials.}
Hint- The two functions you just wrote will be helpful!}
@include-section["design-rec.scrbl"]

@lesson[#:title "Question Four:"]{@bitmap{images/berrybar.jpg}
                                  Your friends are baking treats for the bake sale as well:
                                  @itemlist/splicing[@item{Brownies cost $0.50 each to bake, and sell for $1.50/brownie}
                                                      @item{Fruit bars cost $1.50 each to bake, and sell for $3.00/bar}]
                                  If you wanted to be able to easily calculate the production cost for brownies, fruit bars, or any other treat, what would you have to change in the cost-cookie function above? (Remember that this was the first function you wrote!)
                                  @free-response[#:id "fr1"]}
@bitmap{images/brownies.jpg}

@lesson[#:title "Question Five:"]{Finally, write the function cost-treats, which takes in the number of sales and the cost of materials for any kind of treat, and produces the amount of money it would cost to produce that number of treats.}
@include-section["design-rec.scrbl"]