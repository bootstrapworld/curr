#lang curr/lib
@title{Design Recipe: cost}

@worksheet{
    Luigi's Pizza has hired you as a programmer.  They offer Pepperoni ($10.50), Cheese ($9.00), Chicken ($11.25) ,and Broccoli ($10.25).  Write a function called cost which takes in the name of a topping and outputs the cost of a pizza with that topping.
    
    1.  Contract+ Purpose Statement
    Every contract has three parts:
    
    @contract-exercise["cost1" #:name "cost" #:domain "string" #:range "number"]
    
    2. Give Examples
    Write an example of your function for each topping, using EXAMPLE
    
        (EXAMPLE (@fill-in-the-blank[#:id "cost2" #:label "Use the function here" #:answer "\"pepperoni\""]) @fill-in-the-blank[#:id "cost3" #:label "What should the function produce" #:answer "10.50"])
    
        (EXAMPLE (@fill-in-the-blank[#:id "cost3" #:label "Use the function here" #:answer "\"cheese\""]) @fill-in-the-blank[#:id "cost4" #:label "What should the function produce" #:answer "9.00"])
    
        (EXAMPLE (@fill-in-the-blank[#:id "cost4" #:label "Use the function here" #:answer "\"chicken\""]) @fill-in-the-blank[#:id "cost5" #:label "What should the function produce" #:answer "11.25"])
    
        (EXAMPLE (@fill-in-the-blank[#:id "cost6" #:label "Use the function here" #:answer "\"broccoli\""]) @fill-in-the-blank[#:id "cost7" #:label "What should the function produce" #:answer "10.25"])
    
    3. Function Header
    Write the function Header, giving variable names to all your input values.
    
    (define (@fill-in-the-blank[#:id "cost7" #:label "function name" #:answer "cost"] @fill-in-the-blank[#:id "cost8" #:label "variable names" #:answer "topping"])(
    
        @fill-in-the-blank[#:id "cost9" #:answer "(cond"]
     
        @fill-in-the-blank[#:id "cost10" #:label "Condition1" #:answer "(string=? \"pepperoni\" topping)"]@fill-in-the-blank[#:id "cost11" #:label "Answer1" #:answer "10.50"]
    
        @fill-in-the-blank[#:id "cost12" #:label "Condition2" #:answer "(string=? \"cheese\" topping)"]@fill-in-the-blank[#:id "cost13" #:label "Answer2" #:answer "9.00"]
    
        @fill-in-the-blank[#:id "cost14" #:label "Condition3" #:answer "(string=? \"chicken\" topping)"]@fill-in-the-blank[#:id "cost15" #:label "Answer3" #:answer "11.25"]
    
        @fill-in-the-blank[#:id "cost16" #:label "Condition4" #:answer "(string=? \"broccoli\" topping)"]@fill-in-the-blank[#:id "cost17" #:label "Answer4" #:answer "10.25"]
    
        @fill-in-the-blank[#:id "cost18" #:label "Condition3" #:answer "else"]@fill-in-the-blank[#:id "cost19" #:label "Answer5" #:answer "100000000"]
        
        )}