#lang curr/lib

@title{Unit 2: Introduction to Tables}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
  @unit-descr{Students are introduced to Google Sheets as a convenient way to store tabular data.  They then create their first Pyret program, in which they load a table from Google Sheets.}
}
@unit-lessons{
@lesson/studteach[
     #:title "What are Tables?"
     #:duration "25 minutes"
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
        @points[
        	 @point{
        	 		@student{
        	 				So far you have learned the fundamentals of writing programs to compute values with expressions.
        	 				This is powerful, but as data scientists, we need write programs that compute new values from
        	 				real data.  In this unit, you will learn how Pyret can store real world data, and how to 
        	 				answer data science questions by writing programs.
        	 		}
        	 		@teacher{

        	 		}
        	 }
             @point{
                    @student{
							@build-table/cols[
										'("First" "Last" "Color" "Height")
										'(("John" "Jane" "Javon" "Angela" "Jack" "Dominique" "Sammy" "Andrea")
										  ("Doe" "Smith" "Jackson" "Enriquez" "Thompson" "Rodriguez" "Carter" "Garcia")
										  ("Green" "Brown" "Brown" "Hazel" "Blue" "Hazel" "Blue" "Brown")
										  ("52.0" "49.1" "57.7" "52.5" "53.0" "51.1" "56.2" "50.8"))
										 (lambda (r c) (para ""))
										 4 8
							]

					}
                    @teacher{
							Show the kids slides with each image of the example 
							table, focusing on the different aspects of tables.
							Express that each row represents a distinct object, and
							each entry in a row stores information about that object.
					}
             }
             @point{
					@student{
							This is a @vocab{table} storing information about students in
							a fourth grade class.  @vocab{table}s are collections of 
							entries, where each @vocab{entry} contains one value.  In most of
							the tables you will encounter, these values will be of type
							Number or String.
					}
                    @teacher{
														 
					}
             }
			 @point{
                    @student{
							@vocab{Table}s are organized into @vocab{column}s and @vocab{row}s.
                            This table has exactly 4 columns.

							All of the entries in a particular @vocab{column} will contain values that 
							are the same type, and represent the same thing. For example, each 
							value in the 3rd column represents the eye color of a person in the class. 

							@build-table/cols[
										'("Color")
										'(("Green" "Brown" "Brown" "Hazel" "Blue" "Hazel" "Blue" "Brown"))
										 (lambda (r c) (para ""))
										 1 8
							]
					}
                    @teacher{

					}
             }
			@point{
                    @student{
							The first @vocab{row} in a table is a special row called the 
							@vocab{header row}. Each @vocab{entry} in the @vocab{header row} is the 
							name of a particular @vocab{column}.

							@build-table/cols[
										'("First" "Last" "Color" "Height")
										'()
										 (lambda (r c) (para ""))
										 4 0
							]
					}
                    @teacher{
					}
             }
			@point{
                    @student{
							Every other row in the table is called a @vocab{record}, and contains
							values for every column.  In our example,
							each @vocab{record} represents a different person in the class, and 
							each @vocab{entry} in that @vocab{record} is a person's First Name,
							Last Name, Eye Color or Height.

					}
                    @teacher{
							Express that records represent distinct objects, and
							each entry in a record represents an attribute of that record.
					}
             }
			@point{
                    @student{
					        @activity[#:forevidence "BS-IDE&1&1"]{
					        		Turn to TODO in your workbook.  Complete the exercise to identify different aspects
									about this new table.
							}
			}
                    @teacher{
												
					}
            }
        ]
   }
@lesson/studteach[
     #:title "Tables in Google Sheets"
     #:duration "10 minutes"
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
        @points[
             @point{
                    @student{
							Now that you know what tables are, it's time to use them. 
							There are many different apps for working with tables, but 
							the one we'll be using is Google Sheets.  Google Sheets is 
							an app that lets you create and edit @vocab{spreadsheet}s:
							a @vocab{spreadsheet} is a collection of sheets, and each sheet 
							holds a table.	
					}
                    @teacher{
							Students may have been exposed to other spreadsheet software,
							such as Numbers or Excel.  Communicate that Google Sheets 
							does the same thing as these applications.
					}
             }
             @point{
					@student{
							@activity[#:forevidence "BS-IDE&1&1"]{
									Open your web browser, and navigate to the following link:
									
									@(hyperlink "https://docs.google.com/spreadsheets/d/14er5Mh443Lb5SIFxXZHdAnLCuQZaA8O6qtgGlibQuEg/edit?usp=sharing" "https://docs.google.com/spreadsheets/d/14er5Mh443Lb5SIFxXZHdAnLCuQZaA8O6qtgGlibQuEg/edit?usp=sharing")

									Then, turn to TODO in your
									workbooks, and fill in the answers to questions about the
									Presidents table.

							}

					}
                    @teacher{
														 
					}
             }
        ]
   }

@lesson/studteach[
     #:title "Loading Tables in Pyret"
     #:duration "25 minutes"
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
        @points[
             @point{
                    @student{
							Now that you know the basic information about tables, 
							it's time to get some hands on experience with tables in Pyret. 
							One of the best parts of Pyret is that you can create and 
							load tables from Google Sheets. Later in the course we'll use 
							Pyret to compute different values from the data to answer 
							complex questions about the data.
					}
                    @teacher{

					}
             }
             @point{
					@student{
							@activity[#:forevidence "BS-IDE&1&1"]{
									 Open @(hyperlink "https://code.pyret.org/" "this link") to create
									 an empty Pyret program.

									 Make sure you are signed into your Google account.  All of the Pyret scripts you write will 
									 be saved into the code.pyret.org folder in your Google Drive. Save this blank 
									 program as @code{unit-2}.
							}
					}
                    @teacher{
														 
					}
             }
			@point{
					@student{
							The program you will be writing to use Tables in Pyret
							is very different from the kind of program you wrote in
							Unit 1, so if you feel overwhelmed, don't worry:  that's normal.
							You will learn exactly what this program is doing over the course of
							the unit, and will practice writing programs with tables many times in the course.
					}
            		@teacher{
							Stress that if/when students run into errors writing this code, it is normal.
							These error messages may be different from ones they've seen before, but 
							they have the skills to use them to adjust their programs.  Encourage students
							to read the error messages & try to use their feedback before asking for help.			 
					}
             }
			 @point{
					@student{
							Add each of the following lines of code to your @vocab{definitions area}
							(the left window). Don't worry if you don't understand what the code 
							is doing, it will be explained in more detail later in the unit. 

							@activity[#:forevidence "BS-IDE&1&1"]{
									First, we'll need to import Pyret's library for interacting 
									with files in the Google Drive:

									@code[#:multi-line #t]{
											import gdrive-sheets as GDS
									}
							}
							@activity[#:forevidence "BS-IDE&1&1"]{
									Then, add the line of code that accesses a specific Google Spreadsheet. 
									This code will access the Google Sheet at
									@(hyperlink "https://docs.google.com/spreadsheets/d/14er5Mh443Lb5SIFxXZHdAnLCuQZaA8O6qtgGlibQuEg/edit#gid=0" "this url").
									
									@code[#:multi-line #t]{
											presidents-sheet = 
												GDS.load-spreadsheet("14er5Mh443Lb5SIFxXZHdAnLCuQZaA8O6qtgGlibQuEg")
									}
											
							}
							@activity[#:forevidence "BS-IDE&1&1"]{
									Finally, we need to create a Table object using the data we've loaded.
									@code[#:multi-line #t]{
											presidents = load-table: nth, name, home-state, year-started, year-ended, party
												source: presidents-sheet.sheet-by-name("presidents", true)
											end
									}
							}
					}
                    @teacher{
														 
					}
             }
			 @point{
					@student{
							Now, hit run, then type @code{presidents} into the @vocab{interactions area} 
							(the right window). You should see the same presidents table that was 
							in the Google Sheets document.

							Next, we will load a different table that you haven't seen before. 
							This table will contain nutrition information for a restaurant menu.
					}
                    @teacher{
														 
					}
             }
			 @point{
					@student{
							@activity[#:forevidence "BS-IDE&1&1"]{
									This code accesses this new Google Sheet.  Add it to
									your @vocab{definitions area}:

									@code[#:multi-line #t]{
											nutrition-sheet = 
												GDS.load-spreadsheet("1fMNIgAZ-wdNF7sf4j5Vns-g2Qr9UDa8kSgnzxPfDl5I")
									}
							}
							@activity[#:forevidence "BS-IDE&1&1"]{
									Next, add the code to load this spreadsheet into the form of a Pyret 
									table. Notice that this table has several more columns 
									than the presidents table.

									@code[#:multi-line #t]{
											nutrition = load-table: food, serving-size, calories, calories-from-fat, 
												fat, cholesterol, sodium, sugar, protein
												
												source: nutrition-sheet.sheet-by-name("nutrition", true)
											end
									}
							}
							@activity[#:forevidence "BS-IDE&1&1"]{
									Now, hit the run button again, then type @code{nutrition} into 
									the @vocab{interactions area}. You should see a table with 10 
									records containing information about different foods.
							}
					}
                    @teacher{
							Whenever students change or modify the program in the @vocab{definitions area},
							they must re-run the program.   
					}
             }
        ]
   }
@lesson/studteach[
     #:title "Closing"
     #:duration "5 minutes"
     #:overview ""
     #:learning-objectives @itemlist[]
     #:evidence-statements @itemlist[]
     #:product-outcomes @itemlist[]
     #:standards (list)
     #:materials @itemlist[]
     #:preparation @itemlist[@item{OPTIONAL: Hand out @(hyperlink "https://docs.google.com/document/d/1USFPXkeO5AbGOzm_U0tMv4NV3RrxTMTyg-bqIKUf4q4/edit?usp=sharing" "Warmup activity sheet").}]
     #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
        @points[
             @point{
                    @student{
							Congratulations! You've just finished loading your first 
							table in Pyret, which is a big accomplishment.
							Next, you will learn how to write Pyret code that manipulates these 
							tables. This will be the first thing in your "data science tool box".

							@activity[#:forevidence "BS-IDE&1&1"]{
									Make sure to save your work.  Hit the Save button in the top left.
									This will save your program in the code.pyret.org folder within your
									Google Drive.
							}
					}
                    @teacher{
							If your students are working in pairs/groups, make sure that each
							student has access to a version of the program.  The student who
							saved the program to their Google Drive can share their program with
							anyone by hitting the Publish button in the top left, choosing "Publish
							a new copy", then clicking the "Share Link" option.  This will allow them
							to copy a link to the program, then send to their partners in an email/message.
					}
             }
        ]
   }
}


