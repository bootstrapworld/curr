# Unit 1

## Page 1

For each expression, if it produces an error when evaluated, 
write what kind of error occurs:

 - For division by zero errors, write "division by 0".
 - For errors where the operator is given a value of the wrong type, write "wrong type".

Otherwise, write what the expression evaluates to.

| Expression                       | Value/Error? |
|----------------------------------|--------------|
| 8 - 5.3                          |              |
| 2 / 0                            |              |
| "three" * 2                      |              |
| (3 + 5) * 3                      |              |
| 1.5 * "6"                        |              |
| CHALLENGE:   (2 / (3 - (2 + 1))) |              |

## Page 2

Below is a program in the definitions window.

```
x = (3 * 2) - 2
y = x * 1.5
```

For each expression, if it produces an error when typed into the
interactions window, write what kind of error occurs.

 - For division by zero errors, write "division by 0".
 - For errors where the operator is given a value of the wrong type, write "wrong type".

Otherwise, write what the expression evaluates to.

| Expression      | Value/Error? |
|-----------------|--------------|
| y               |              |
| x + 3           |              |
| (y - 1) + x     |              |
| (x / y) + z     |              |
| CHALLENGE:   xy |              |

## Page 3

For each expression, determine the function name, number of arguments,
type of arguments, type of output, and (in your own words) describe what the
function does.

| Expression             | Function Name | Number of Arguments | Type of Arguments | Return Type | Describe what this function does. |
|------------------------|---------------|---------------------|-------------------|-------------|-----------------------------------|
| num-max(3, 5)          |               |                     |                   |             |                                   |
| string-length("data")  |               |                     |                   |             |                                   |
| string-repeat("hi", 3) |               |                     |                   |             |                                   |

# Unit 2

## Page 4

| Animal | Number of Legs |
|--------|----------------|
| Human  | 2              |
| Ant    | 6              |
| Spider | 8              |
| Bear   | 4              |  

 - How many rows does this table have? ___________
 - How many columns does this table have? ___________
 - What are the attributes in the header row? __________
 - What is the value of the "Number of Legs" 
   entry for the Human record? _________

## Page 5

 - How many rows does the presidents 
   table have? ___________
 - How many columns does the presidents 
   table have? ___________
 - What are the attributes in the header 
   row? _______________________________
 - What is the home state of
   Millard Fillmore? __________________
 - What year did Rutherford B. Hayes
   start his presidency? ______________


# Unit 3

## Page 6

### Presidents Table
 - Does the party column have
   quantitative or categorical
   data?  ____________________
 - How many categories are there for
   a value in the home-state column?
   ________________
 - What kind of data does the year-started
   column have?  __________________

### Nutrition Table
 - What kind of data does the calories
   column have?  __________________
 - How can you tell? ______________
   ________________________________

# Unit 4

## Page 7

Below is a table bound to the id `animals`

| name       | legs | eyes | lifespan |
|------------|------|------|----------|
| Human      | 2    | 2    | 71       |
| Garden Ant | 6    | 2    | 8        |
| Spider     | 8    | 8    | 2.5      |
| Bear       | 4    | 2    | 10       |

 - Write the code to select only the Name 
   and Eyes columns from `animals`
   _______________________________

 - Write the code to select only the Name 
   and Legs columns from `animals`
   _______________________________

 - Draw the table this code produces:
   `select name, lifespan from animals end` 

 - What code produces this table?
   
   | eyes |
   |------|
   | 2    |
   | 2    |
   | 8    |
   | 2    |

 - **CHALLENGE**:  Draw the table this code
   produces:
   ```
   select legs from
     select name, legs from animals end
   end
   ```

## Page 8

Below is a table bound to the id `animals`

| name       | legs | eyes | lifespan |
|------------|------|------|----------|
| Human      | 2    | 2    | 71       |
| Garden Ant | 6    | 2    | 8        |
| Spider     | 8    | 8    | 2.5      |
| Bear       | 4    | 2    | 10       |

 - Write the code to order `animals` by
   the `lifespan` column in ascending order
   ______________________________________

 - Which two species have the lowest lifespan?
   ______________________________________

 - Draw the table this code produces:
   `order animals:  legs descending end`


   