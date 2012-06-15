#lang curr/lib

@itemlist[@item{INSERT IMAGE OF MAP}
          @item{What is the x-coordinate of your house? @fill-in-the-blank[#:id "Coordinate-Drill1"] @check[(constraint:string-eq  (value:string "0") (value:form "Coordinate-Drill1"))]
                What about the y-coordinate? @fill-in-the-blank[#:id "Coordinate-Drill2"] @check[(constraint:string-eq  (value:string "1") (value:form "Coordinate-Drill2"))]}
          @item{What is the x-coordinate of your grandpa's house? @fill-in-the-blank[#:id "Coordinate-Drill3"] @check[(constraint:string-eq  (value:string "0") (value:form "Coordinate-Drill3"))]]
                What about the y-coordinate? @fill-in-the-blank[#:id "Coordinate-Drill4"] @check[(constraint:string-eq  (value:string "5") (value:form "Coordinate-Drill4"))]}
          @item{How far away is your house from your grandfather's house in miles? @fill-in-the-blank[#:id "Coordinate-Drill5"] @check[(constraint:string-eq  (value:string "4") (value:form "Coordinate-Drill5"))]}
          @item{If it takes you 30 minutes to walk one mile, how many minutes does it take for you to get to your grandpa's house? @fill-in-the-blank[#:id "Coordinate-Drill6"] @check[(constraint:string-eq  (value:string "120") (value:form "Coordinate-Drill6"))]}
          @item{What is the x-coordinate of your friend's house? @fill-in-the-blank[#:id "Coordinate-Drill7"] @check[(constraint:string-eq  (value:string "-2") (value:form "Coordinate-Drill7"))]
                What about the y-coordinate? @fill-in-the-blank[#:id "Coordinate-Drill8"] @check[(constraint:string-eq  (value:string "1") (value:form "Coordinate-Drill8"))]}
          @item{How far away is your house from your friend's house in miles? @fill-in-the-blank[#:id "Coordinate-Drill9"] @check[(constraint:string-eq  (value:string "3") (value:form "Coordinate-Drill9"))]}]