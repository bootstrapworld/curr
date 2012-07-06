#lang curr/lib

@title{Fast Functions}

@worksheet{
           Fill out the two examples for each function.  Then try to write the contract, function header and function body by yourself
           @exercise{
           @contract-exercise["id1" #:name "gt" #:domain "number" #:range "image"] @linebreak[]
           @example-with-text["id2" #:example1 "500" #:example2 "(triangle 500 \"solid\" \"green\")"] @linebreak[]
           @example-with-text["id3" #:example1 "gt 7" #:example2 "(triangle 7 \"solid\" \"green\")"] @linebreak[]
           @function-exercise["id4" #:name "gt" #:args "size" #:body "(triangle size \"solid\" \"green\")"]
           }
           @exercise{
           @contract-exercise["id5" #:name "bc" #:domain "number" #:range "number"] @linebreak[]
           @example-with-text["id6" #:example1 "bc 25" #:example2 "(circle 25 \"solid\" \"blue\")"] @linebreak[]
           @example-with-text["id7" #:example1 "bc 43" #:example2 "(circle 43 \"solid\" \"blue\")"] @linebreak[]
           @function-exercise["id8" #:name "bc" #:args "size" #:body "(circle size \"solid\" \"blue\")"]
           }
           @exercise{
           @contract-exercise["id9" #:name "double" #:domain "number" #:range "number"] @linebreak[]
           @example-with-text["id10" #:example1 "double 13" #:example2 "(* 2 13)"] @linebreak[]
           @example-with-text["id11" #:example1 "double 3" #:example2 "(* 2 3)"] @linebreak[]
           @function-exercise["id12" #:name "double" #:args "num" #:body "(* 2 num)"]
           }
           @exercise{
           @contract-exercise["id13"] @linebreak[]
           @example-with-text["id14"] @linebreak[]
           @example-with-text["id15"] @linebreak[]
           @function-exercise["id16"]
           }
           @exercise{
           @contract-exercise["id17"] @linebreak[]
           @example-with-text["id18"] @linebreak[]
           @example-with-text["id19"] @linebreak[]
           @function-exercise["id20"]
           
           }
           @exercise{
           @contract-exercise["id21"] @linebreak[]
           @example-with-text["id22"] @linebreak[]
           @example-with-text["id23"] @linebreak[]
           @function-exercise["id24"]
           }
           @exercise{
           
           @contract-exercise["id25"] @linebreak[]
           @example-with-text["id26"] @linebreak[]
           @example-with-text["id27"] @linebreak[]
           @function-exercise["id28"]
           }
           
           }