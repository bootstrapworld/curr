# Unit 1

## Page 1

| Expression                       | Value/Error? | Answer                     |
|----------------------------------|--------------|----------------------------|
| 8 - 5.3                          |              | 2.7                        |
| 2 / 0                            |              | Error, division by zero    |
| "three" * 2                      |              | Error, wrong argument type |
| (3 + 5) * 3                      |              | 24                         |
| 1.5 * "6"                        |              | Error, wrong argument type |
| CHALLENGE:   (2 / (3 - (2 + 1))) |              | Error, division by zero    |

## Page 2

| Expression      | Value/Error? | Answer                                                        |
|-----------------|--------------|---------------------------------------------------------------|
| y               |              | 6                                                             |
| x + 3           |              | 7                                                             |
| (y - 1) + x     |              | 9                                                             |
| (x / y) + z     |              | Error:  Unbound id z                                          |
| CHALLENGE:   xy |              | Error:  Expression on same line//Unbound id if no white space |

## Page 3

| Expression             | Function Name | Number of Arguments | Type of Arguments | Return Type | Describe what this function does.                                                           |
|------------------------|---------------|---------------------|-------------------|-------------|---------------------------------------------------------------------------------------------|
| num-max(3, 5)          | num-max       | 2                   | Number, Number    | Number      | Returns whichever Number argument is larger.                                                |
| string-length("data")  | string-length | 1                   | String            | Number      | Returns the number of characters in the argument String                                     |
| string-repeat("hi", 3) | string-repeat | 2                   | String, Number    | String      | Returns a new string with the input String repeated x times, where x is the second argument |


# Unit 2

## Page 4

| Animal | Number of Legs |
|--------|----------------|
| Human  | 2              |
| Ant    | 6              |
| Spider | 8              |
| Bear   | 4              |  

 - How many rows does this table have? **5**
 - How many columns does this table have? **2**
 - What are the attributes in the header row? 
   **Animal, Number Of Legs**
 - What is the value of the "Number of Legs" 
   entry for the Human record? **2**

## Page 5

### Presidents Table

 - How many columns does the presidents 
   table have? **46**
 - What are the names of the columns? 
   **presidency, name, party, home-state, year-started, year-ended**
 - How many rows does the presidents 
   table have (aside from the
   header row)? **46**
 - Does the `party` column have quantitative
   or categorical data?  **Categorical**
 - Is the data in the `home-state` column
   categorical?  If so, how many
   categories are there? **Yes, 50**
 - Does the `year-started` column have 
   categorical or quantitative data?
   **Quantitative**
 - What is the home state of
   Millard Fillmore? **New York**
 - What year did Rutherford B. Hayes
   start his presidency? **1877**
 - Who was the most recent president 
   from Michigan?  **Gerald Ford**
 - Who were the first president from
   the federalist party? **John Adams**

### Nutrition Table
 - How many columns does the nutrition 
   table have? **9**
 - What are the names of the columns? 
   **food, serving-size, calories, calories-from-fat, fat, cholesterol, sodium, sugar, protein**
 - How many rows does the nutrition 
   table have? **11**
 - What kind of data does the calories
   column have?  How can you tell?
   **Quantitative, the question "does x have more calories than y" makes sense**
 - How many grams of cholesterol does
   the Hamburger have?  **30**
 - Which has more sodium; a Cheeseburger
   or a burrito?  **Burrito**
 - Which food has the largest serving size?
   **Chicken Salad**

## Page 5

 - How many rows does the presidents 
   table have? **46**
 - How many columns does the presidents 
   table have? **6**
 - What are the attributes in the header 
   row? **presidency, name, party, home-state,
   year-started, year-ended**
 - What is the home state of
   Millard Fillmore? **New York**
 - What year did Rutherford B. Hayes
   start his presidency? **1877**

# Unit 3

## Page 6

### Presidents Table
 - Does the party column have
   quantitative or categorical
   data?  **categorical**
 - How many categories are there for
   a value in the home-state column? **50**
 - What kind of data does the year-started
   column have?  **quantitative**

### Nutrition Table
 - What kind of data does the calories
   column have?  **quantitative**
 - How can you tell? **values in this
   column measure the amount of calories
   are in a menu item.  Subtracting 
   values from this column gives the 
   difference in calories between two items,
   adding values gives the total calories
   from eating both items.**

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
   `select name, eyes from animals end`

 - Write the code to select only the Name 
   and Legs columns from `animals`
   `select name, legs from animals end`

 - Draw the table this code produces:
   `select name, lifespan from animals end`

   | name       | lifespan |
   |------------|----------|
   | Human      | 71       |
   | Garden Ant | 8        |
   | Spider     | 2.5      |
   | Bear       | 10       |

 - What code produces this table?   
   | eyes |
   |------|
   | 2    |
   | 2    |
   | 8    |
   | 2    |

   `select eyes from animals end`

 - **CHALLENGE**:  Draw the table this code
   produces:
   ```
   select legs from
     select name, legs from animals end
   end
   ```

   | legs |
   |------|
   | 2    |
   | 6    |
   | 8    |
   | 4    |

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
   `order animals:  lifespan ascending end`

 - Which two species have the lowest lifespan?
   **Spider and Garden Ant**

 - Draw the table this code produces:
   `order animals:  legs descending end`

    | name       | legs | eyes | lifespan |
	|------------|------|------|----------|
	| Spider     | 8    | 8    | 2.5      |
	| Garden Ant | 6    | 2    | 8        |
	| Bear       | 4    | 2    | 10       |
	| Human      | 2    | 2    | 71       |
