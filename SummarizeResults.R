#SummarizeResults.R

# This function takes a data.frame of test results and returns a data.frame of unique tests in the results
# The output has the following columns:
#   TestID - the LinkIt internal test ID
#   TestName - the name of the test
#   Date - the earliest ModifiedDate of a result associatied with that test
#   Count - how many results there are for that test in the results frame
SummarizeResults = function(ResultFrame){
  Summarize = data.frame(TestID = unique(ResultFrame$TestID), stringsAsFactors = F)
  Summarize$TestName = ResultFrame$TestName[match(Summarize$TestID, ResultFrame$TestID)]
  Summarize$EarliestNewScan = as.POSIXlt(NA)
  Summarize$LatestNewScan = as.POSIXlt(NA)
  for (i in 1:nrow(Summarize)){
    Summarize$Count[i] = sum(ResultFrame$TestID == Summarize$TestID[i])
    Summarize$EarliestNewScan[i] = min(ResultFrame$ModifiedDate[ResultFrame$TestID == Summarize$TestID[i]])
    Summarize$LatestNewScan[i] = max(ResultFrame$ModifiedDate[ResultFrame$TestID == Summarize$TestID[i]])
  }
  Summarize = Summarize[order(-Summarize$Count), ]
  return(Summarize)
}