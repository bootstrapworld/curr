#lang curr/lib

@title{Unit 2: Introduction to Tables}

@declare-tags[]

@unit-overview/auto[#:lang-table (list (list "" @code{}))]{
  @unit-descr{Students are introduced to Google Sheets as a convenient way to store tabular data.  They then create their first Pyret program, in which they load a table from Google Sheets.}
}
@unit-lessons{
@lesson/studteach[
     #:title "Introduction"
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
        @points[
             @point{
                    @student{
														Welcome to Bootstrap Data Science Lite. In this course, 
														you'll learn how to ask and answer questions about data.  The process 
														of learning from data is called data science.  Data science techniques 
														are used by scientists, business people, politicians, sports analysts, 
														and hundereds of other different fields to ask and answer questions about data.
										}
                    @teacher{
														Motivate relevance of data science by using examples that
														relate to student interests.  Here are some examples:
														@itemlist[
																		@item{@(hyperlink "http://motherboard.vice.com/read/a-data-scientists-emoji-guide-to-kanye-west-and-taylor-swift" "Emojis")}
																		@item{@(hyperlink "https://mic.com/articles/131092/these-students-are-using-data-science-to-predict-which-rap-songs-will-become-hits#.0d3wkhxQE" "Pop Music")}
																		@item{@(hyperlink "http://www.kdnuggets.com/2016/06/politics-analytics-trump-clinton-sanders-twitter-sentiment.html"  "Election Analysis")}
																		@item{@(hyperlink "http://fivethirtyeight.com/" "Polling")}
																		@item{@(hyperlink "http://games.espn.com/fba/tools/projections" "Predicting Sports Performance")}
																		@item{@(hyperlink "http://www.salon.com/2015/07/18/how_big_data_can_help_save_the_environment_partner/" "Environmental")}
														]
										}
             }
             @point{
										@student{
														In order to ask questions from data, you will use a programming 
														language.  Just like any language (English, Spanish, French), programming 
														languages have their own vocabulary and grammar that you will need to learn.  
														The language you'll be learning for data science is Pyret, which lets you ask 
														and answer questions quickly from very large data sets.  The first feature in 
														Pyret you will learn to use for data science is the @vocab{Table}.  
														But first, you need to know what tables are.
										}
                    @teacher{
														Set expectations for the class.  This course is an introduction to
														programming and data science, so some of the questions students want
														to answer may be out of scope.  However, this course will give students
														a foundation to answer their more complicated questions later in their 
														data science education. 
										}
             }
        ]
   }

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
														Let's start with an example: 

                            @bitmap{images/table_basic.png}
														@(data-table (list "First-Name" "Last-Name" "Eye-Color" "Hair-Color"))
										}
                    @teacher{
														Show the kids slides with each image of the example 
														table, focusing on the different aspects of tables.
														Express that records represent distinct objects, and
														each entry in a record represents an attribute of that
														record.
										}
             }
             @point{
										@student{

														This is a @vocab{table} storing information about students in
														a fourth grade class.  @vocab{table}s are collections of 
														entries, where each @vocab{entry} contains one value.  In most of
														the tables you will encounter, these values will be of type
														Number, String, or Booleans.  

														@bitmap{images/table_entry.png}
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
														value in the 3rd column represents the age of a person in the class. 
														In this example, age is an @vocab{attribute}. An @vocab{attribute} 
														is just the name of what each value in a column is representing.

														@bitmap{images/table_column.png}

                            
										}
                    @teacher{
										}
             }
						 @point{
                    @student{
														The first @vocab{row} in a table is a special row called the 
														@vocab{header row}. Each @vocab{entry} in the @vocab{header row} is the 
														name of the @vocab{attribute} for a particular @vocab{column}.

														@bitmap{images/table_header.png}
										}
                    @teacher{
										}
             }
						 @point{
                    @student{
														Every other row in the table is called a @vocab{record}, and contains
														values for every @vocab{attribute} or @vocab{column}.  In our example,
														each @vocab{record} represents a different person in the class, and 
														each @vocab{entry} in that @vocab{record} is a person's First Name,
														Last Name, Eye Color or Height.

														@bitmap{images/table_row.png}
										}
                    @teacher{
														Express that records represent distinct objects, and
														each entry in a record represents an attribute of that record.
										}
             }
						 @point{
                    @student{
										        @;{@activity[#:forevidence (list "TODO")]{Turn to @worksheet-link[#:name "TODO"]
														in your workbook.  Complete the exercise to identify different aspects
														about this new table.}}
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
														@;{@activity[#:forevidence (list "TODO")]{Open your web
														browser, and navigate to the following link:
														
														@(hyperlink "https://docs.google.com/spreadsheets/d/14er5Mh443Lb5SIFxXZHdAnLCuQZaA8O6qtgGlibQuEg/edit?usp=sharing" "https://docs.google.com/spreadsheets/d/14er5Mh443Lb5SIFxXZHdAnLCuQZaA8O6qtgGlibQuEg/edit?usp=sharing")

														Then, turn to page @worksheet-link[#:name "TODO"] in your
														workbooks, and fill in the answers to questions about the
														Presidents table.

														}}

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
														@;{@activity[#:forevidence (list "TODO")]{
    											  Open @(hyperlink "https://code.pyret.org/" "this link") to create
														an empty Pyret program.

														If you've never signed into Pyret before, it will ask you for 
														a Google account.  Upon signing in, Pyret will create folders for 
														you in your Google drive. All of the Pyret scripts you write will 
														be saved into the code.pyret.org folder. Save this blank 
														program as @code{unit-1}.
														}}
										}
                    @teacher{
														 
										}
             }
						 @point{
										@student{
														If you have programmed in Pyret before, you can skip to the next 
														paragraph. The Pyret editor has two windows that you can write 
														code into: the @vocab{definitions area} (on the left), and the 
														@vocab{interactions area} (on the right). The @vocab{definitions area}
 														is where you write longer, multi line programs, and then 
														run them with the Run button. The @vocab{interactions area} is where 
														you can write short programs and quickly run them by hitting enter.
										}
                    @teacher{
														 
										}
             }
						 @point{
										@student{
														@;{@activity[#:forevidence (list "TODO")]{
														Add each of the following lines of code to your @vocab{definitions area}
														(the left window). Don't worry if you don't understand what the code 
														is doing, it will be explained in more detail later in the unit. 
														First, we'll need to import Pyret's library for interacting 
														with files in the Google Drive:

														@code[#:multi-line #t]{
																import gdrive-sheets as GDS
														}
														}}
										}
                    @teacher{
														 
										}
             }
						 @point{
										@student{
														@;{@activity[#:forevidence (list "TODO")]{
														Next, we add the line of code that accesses a specific Google Spreadsheet. 
														This code will access the Google Sheet at
														@(hyperlink "https://docs.google.com/spreadsheets/d/14er5Mh443Lb5SIFxXZHdAnLCuQZaA8O6qtgGlibQuEg/edit#gid=0" "this url").
														
														@code[#:multi-line #t]{
																presidents-sheet = GDS.load-spreadsheet("14er5Mh443Lb5SIFxXZHdAnLCuQZaA8O6qtgGlibQuEg")
														}
											
														}}
										}
                    @teacher{
														 
										}
             }
						 @point{
										@student{
														Finally, we need to create a Table object using the data we've loaded.

														@;{@activity[#:forevidence (list "TODO")]{
														Add this code to your @vocab{definitions area}:

														@code[#:multi-line #t]{
																presidents = load-table: nth, name, home-state, year-started, year-ended, party
  																source: presidents-sheet.sheet-by-name("presidents", true)
																end
														}
														}}
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
														@;{@activity[#:forevidence (list "TODO")]{
														This code  accesses this new Google Sheet.  Add it to
														your @vocab{definitions area}:

														@code[#:multi-line #t]{
																nutrition-sheet = GDS.load-spreadsheet("1fMNIgAZ-wdNF7sf4j5Vns-g2Qr9UDa8kSgnzxPfDl5I")
														}

														Next, add the code to load this spreadsheet into the form of a Pyret 
														table. Notice that this table has several more columns 
														than the presidents table.

														@code[#:multi-line #t]{
																nutrition = load-table: food, serving-size, calories, calories-from-fat, fat, cholesterol, sodium, sugar, protein
  																source: nutrition-sheet.sheet-by-name("nutrition", true)
																end
														}

														Now, hit the run button again, then type @code{nutrition} into 
														the @vocab{interactions area}. You should see a table with 10 
														records containing information about different foods.

														}}
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

														@;{@activity[#:forevidence (list "TODO")]{
														Make sure to save your work.  Hit the Save button in the top left.
														This will save your program in the code.pyret.org folder within your
														Google Drive.
														}}
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


