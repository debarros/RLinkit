#RecentResults.R
#Parameters:
#  acct - the Account object
#  handle - the CURL handle
#  lastTime - the date and time of the last time this process was run.  Format should be POSIXct.

RecentResults = function(acct, handle, lastTime){
  #First, ask for only 1 record
  initial = searchAPI(acct = acct, handle = handle, resource = "result",parameters = list("FromDate" = makeTimeStamp(lastTime), "PageSize" = "1"))
  
  #Convert the output to a list
  initial.list = xmlToList(initial)
  
  #Extract the total number of records available
  nRecords = initial.list$Data$TotalRecords
  
  #get all the records
  full = searchAPI(acct = acct, handle = handle, resource = "result",parameters = list("FromDate" = makeTimeStamp(lastTime), "PageSize" = nRecords))
  
  #Convert the result to a list
  full.list = xmlToList(full)
  
  #Get just the list of results
  result.list = full.list$Data$TestResults
  
  #Convert NULL values to NA_Character
  newresult = lapply(result.list, nullToNA_char.list)
  
  #Convert the list of results to a data.frame of results
  ResultFrame <- setNames(data.frame(matrix(unlist(newresult), nrow=length(newresult), byrow=T),stringsAsFactors=FALSE), names(newresult[[1]]))
  
  #Convert the data elements to dates
  ResultFrame$ResultDate = as.POSIXlt(strptime(ResultFrame$ResultDate, format = "%m/%d/%Y %H:%M:%S %p"))
  ResultFrame$CreatedDate = as.POSIXlt(strptime(ResultFrame$CreatedDate, format = "%m/%d/%Y %H:%M:%S %p"))
  ResultFrame$ModifiedDate = as.POSIXlt(strptime(ResultFrame$ModifiedDate, format = "%m/%d/%Y %H:%M:%S %p"))
  
  return(ResultFrame)
}