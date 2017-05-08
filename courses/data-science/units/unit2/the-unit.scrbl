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
										'("First" "Last" "Eye-Color" "Height")
										'(("\"John\"" "\"Jane\"" "\"Javon\"" "\"Angela\"" "\"Jack\"" "\"Dominique\"" "\"Sammy\"" "\"Andrea\"")
										  ("\"Doe\"" "\"Smith\"" "\"Jackson\"" "\"Enriquez\"" "\"Thompson\"" "\"Rodriguez\"" "\"Carter\"" "\"Garcia\"")
										  ("\"Green\"" "\"Brown\"" "\"Brown\"" "\"Hazel\"" "\"Blue\"" "\"Hazel\"" "\"Blue\"" "\"Brown\"")
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
										'("Eye-Color")
										'(("\"Green\"" "\"Brown\"" "\"Brown\"" "\"Hazel\"" "\"Blue\"" "\"Hazel\"" "\"Blue\"" "\"Brown\""))
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
										'("First" "Last" "Eye-Color" "Height")
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
     #:title "Tables in Pyret"
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
							Now that you know the basic information about tables, 
							it's time to get some hands on experience with tables in Pyret.
							Pyret allows us to write programs with tables, similar to
							how we write programs using regular Number and String values.
					}
                    @teacher{
                    		In supplemental lessons, students/teachers can load their 
                    		own tables into Google Sheets, as well as design surveys 
                    		to populate Google Sheets with data.  However, in the core
                    		curriculum this will not be covered;  students will use 
                    		scaffolded code to work with tables exclusively in Pyret.
					}
            }
            @point{
            		@student{
            				@activity[#:forevidence "BS-IDE&1&1"]{
            						Open up the @editor-link[#:public-id "0BxJ2mGqPUGt0bnZKcHYxbG5HSG8&v=3a4fb05" "Unit 2"] template file.

            						Make sure you are signed into your Google account.  All of the Pyret scripts you write will 
									be saved into the code.pyret.org folder in your Google Drive.  Hit the Save a Copy button.
            				}
            		}
            		@teacher{

            		}
            }
            @point{
            		@student{
            				The definitions window contains code that you haven't seen before,
            				so it's ok if you don't understand it all at once!

            				@activity[#:forevidence "BS-IDE&1&1"]{
            						Type each of these programs into the interactions window and hit Enter/Return
            						@itemlist[
            								@item{
            										@code{nutrition}
            								}
            								@item{
            										@code{presidents}
            								}
            						]
            				}

            				This program loads tables from Google Sheets using the @code{load-table} keyword,
            				and sets @code{presidents} and @code{nutrition} to be variables that 
            				refer to these tables.  We use @code{=} for variable assignment the same way that
            				we did in unit 1.
            		}
            		@teacher{
            				The students should not need to know exactly how this scaffold code
            				works to complete the exercises.  However, for those that are curious:

            				@itemlist[
            						@item{
            								The @code{include} statement allows Pyret to use a
            								supplementary module which can talk to the Google Sheets
            								API.  This lets students use/apply functions that take data
            								from Google Sheets.
            						}
            						@item{
            								The @code{load-spreadsheet} function applications
            								are what will find particular spreadsheets and their
            								content.  The argument is a String that is a unique ID
            								to a particular Google Sheet.  We have hardcoded these IDs
            								in the scaffolding so that they link to our presidents and
            								nutrition tables.
            						}
            						@item{
            								The @code{load-table} command is what actually loads a table
            								that we can use in the interactions window.  In this expression,
            								each of the column names are enumerated (this establishes what 
            								the header row contains), and says that the source will be
            								the sheets from the @code{load-spreadsheet} functions applications.
            						}
            				]

            		}
            }
            @point{
            		@student{
            				Turn to TODO in your workbooks, and answer questions about the tables
            				in the output of @code{presidents} when entered into the interactions area.
            		}
            		@teacher{

            		}
            }
        ]
   }

@lesson/studteach[
     #:title "Quantitative and Categorical Data"
     #:duration "20 minutes"
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
        					You have loaded your first tables into Pyret. These tables contain different data: 
        					the first is a table about the presidents of the US, and the second has nutritional 
        					information about items on a menu. Before we can dive into all of the cool things 
        					you can do with tables, we need to understand the two different kinds of 
        					data that can appear in tables: categorical and quantitative.	
        			}
        			@teacher{

        			}
        	}
            @point{
                    @student{
                            Let's take another look at the first example table we saw in Unit 2.

                            @build-table/cols[
										'("First" "Last" "Eye-Color" "Height")
										'(("\"John\"" "\"Jane\"" "\"Javon\"" "\"Angela\"" "\"Jack\"" "\"Dominique\"" "\"Sammy\"" "\"Andrea\"")
										  ("\"Doe\"" "\"Smith\"" "\"Jackson\"" "\"Enriquez\"" "\"Thompson\"" "\"Rodriguez\"" "\"Carter\"" "\"Garcia\"")
										  ("\"Green\"" "\"Brown\"" "\"Brown\"" "\"Hazel\"" "\"Blue\"" "\"Hazel\"" "\"Blue\"" "\"Brown\"")
										  ("52.0" "49.1" "57.7" "52.5" "53.0" "51.1" "56.2" "50.8"))
										 (lambda (r c) (para ""))
										 4 8
							]        
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            The first kind of data we will look at is @vocab{Quantitative Data}. @vocab{Quantitative Data} always 
                            measures an amount of something. If a question asks "how much" 
                            there is of something, the answer will be quantitative data.                  
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            Look at the Height (inches) column.  

                            If you ask the question "How tall is John Doe?" (in other words, how much 
                            height does John Doe have?), the answer is 52.0 inches. Quantitative Data usually has 
                            units of measurement; in this case the unit of measurement is inches.                    
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            Another important fact is that Quantitative Data can be larger or smaller than other 
                            Quantitative Data. For example, if we ask the question "Is John Doe taller than Andrea Garcia?" 
                            (in other words, does John Doe have more height than Andrea Garcia), it can be answered by 
                            comparing their entries in the height column. John Doe's height is bigger than Andrea Garcia's, 
                            so we can say yes, he is taller.                   
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
            		@student{
                            Now look at the Eye Color column.

                            @build-table/cols[
										'("First" "Last" "Eye-Color" "Height")
										'(("\"John\"" "\"Jane\"" "\"Javon\"" "\"Angela\"" "\"Jack\"" "\"Dominique\"" "\"Sammy\"" "\"Andrea\"")
										  ("\"Doe\"" "\"Smith\"" "\"Jackson\"" "\"Enriquez\"" "\"Thompson\"" "\"Rodriguez\"" "\"Carter\"" "\"Garcia\"")
										  ("\"Green\"" "\"Brown\"" "\"Brown\"" "\"Hazel\"" "\"Blue\"" "\"Hazel\"" "\"Blue\"" "\"Brown\"")
										  ("52.0" "49.1" "57.7" "52.5" "53.0" "51.1" "56.2" "50.8"))
										 (lambda (r c) (para ""))
										 4 8
							]     
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            Can we ask the question "Does John Doe have more eye color than Andrea Garcia?"  No. 
                            That question makes no sense! This is the second kind of data we will look at, called @vocab{Categorical Data}. 
                            We used Quantitative Data to quantify; to ask "how much" there is of something. 
                            We use @vocab{Categorical Data} to ask "which one"?
                            In this case, students are put into the same category if they have the same eye color.                   
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Let's consider eye color. How many different eye colors are there?  
                            }                   
                    }
                    @teacher{
                            Guide students towards this list: Amber, Blue, Green, Brown, Grey, Hazel.                         
                    }
            }
            @point{
                    @student{
                            So if there are only 6 different natural eye colors, then each value in the 
                            column has to be one of these categories. We would say that this 
                            column has 6 different possible categories.                     
                    }
                    @teacher{
                                                        
                    }
            }
            @point{
                    @student{
                            @activity[#:forevidence "BS-IDE&1&1"]{
                                    Navigate back to your pyret program that loads the @code{nutrition}
                                    and @code{presidents} tables.
                                    Then, turn to TODO in your workbook and answer the questions about these two data sets. 
                            }                          
                    }
                    @teacher{
                                                        
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


