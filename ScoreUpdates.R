#ScoreUpdates.R

#Parameters:
#  ResultFrame 
#  ResultSummary
#  cap is the maximum number of scan events a test can have and still be an update

ScoreUpdates = function(ResultFrame,ResultSummary,cap){
  
  x = ResultFrame
  y = ResultSummary
  
  #Create a student name variable in the ResultFrame
  x$StudentName = paste0(x$StudentLastName, ", ", x$StudentFirstName)
  
  #Get the score updates
  
  #Identify the tests that have fewer than cap scans, don't require special scoring, and are not Humanities
  updateTests = y$TestName[y$Count < cap & !grepl(pattern = ">", x = y$TestName) & !grepl(pattern = "H[2-3] ", x = y$TestName)]
  
  #Limit to just the tests and columns of interest
  x =  x[x$TestName %in% updateTests,c("TestName","StudentName", "StudentCode", "PercentScore", "ModifiedDate")]
  
  #Order by Name and Test
  x = x[order(x$StudentName),]
  x = x[order(x$TestName),]
  
  #Subset y to just the reportable tests
  y = y[!(y$TestName %in% updateTests),]
  
  #Create the output
  write.csv(x, file = "recentScores.csv")
  write.csv(y, file = "reportableTests.csv")
  
  #Create the formated score update output
  #This part might not work yet
  out = "" #initialize the output string
  for(i in updateTests){ #for each test that needs score updates
    currentSet = x[x$TestName == i,] #grab the results for just that test
    maxName = max(nchar(currentSet$StudentName)) #figure out the longest student name
    currentSet$StudentName = str_pad(string = currentSet$StudentName, width = maxName, side = "right") #pad student names to make them the same length
    out = paste0(out, "Updated scores for ",i,":\n") #Put in the header line for the score update email
    for(i in 1:nrow(currentSet)){ #for each score for that test
      out = paste0(out, "\t",currentSet$StudentName[i], " ", currentSet$StudentCode[i], "\t", currentSet$PercentScore[i], "\n") #append a line with that student's name, id, and score
    }
    out = paste0(out, "\n\n") #put two newlines after each score update email
  }
  
  write(out, "ScoreUpdates.txt")  #write the score update emails to a text file
}


