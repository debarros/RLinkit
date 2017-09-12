#httpBuilders.R

# CURL initializer ####
# Should this be a function?  It's just the stuff that needs to run when you get started
# - - - - - - - - - - - - - - - - - - - - - - - - -
#location of the file needed for https requests
caLocation = "cacert.pem.crt" 

#create a CURL options object.  This can be used to set options in CURL.
Options <- curlOptions(cainfo = caLocation, followlocation = T, verbose = T,  cookiejar = "")

#Establish a handle to use with ongoing sessions
LinkItHandle = getCurlHandle()

#set the curl options
curlSetOpt(.opts = Options, curl = LinkItHandle)
# - - - - - - - - - - - - - - - - - - - - - - - - -



# URLbuilder ####
#parameters is a names list, where the names are the parameter names and the values are the parameter values
URLbuilder = function(url.resource, acct, parameters = list()){
  
  #set the beginning of the url, which is usually "https://www.linkitdev.com/restapi/v1" or "https://www.linkit.com/restapi/v1" 
  url.stub = acct$getUrlStub()
  
  #put together the parameter section of the url
  paramString = ""
  if (length(parameters)>0){paramString = paste0("&",paste(names(parameters), parameters, sep = "=", collapse = "&"))}
  
  #get the current date and time, properly formatted
  tStamp = makeTimeStamp()
  
  #Build the basic url
  url.partial = paste0(url.stub,url.resource, paramString, "&TimeStamp=", tStamp, "&AccessKey=", acct$getPubKey())
  
  #Complete the url by appending the hashed version
  url.complete = paste0(url.partial, "&Tag=",sha1(url.partial, key = acct$getPriKey()))
  
  return(url.complete)
}









# - - - - - - - - - - - - - #
# makeTimeStamp ####
# This function generates a time stamp formatted as necessary for the API call
# It can't be created directly using a format statement on the Sys.time() for two reasons:
#   1) The time has to be in UTC (aka GMT or Greenwich Mean Time)
#   2) Leading zeroes must be stripped from every component
makeTimeStamp = function(now = Sys.time()){
  
  #time zone conversion requires converting a POSIXct object to POSIXlt
  now = as.POSIXct(now) # make sure the datetime is POSIXct to begin with
  now = as.POSIXlt(now, tz = "GMT") # change the time zone using a conversion to POSIXlt
  
  # extract the various components, converting to integer to strip leading zeroes where necessary
  month = as.integer(format(now, format = "%m"))
  day = as.integer(format(now, format = "%d"))
  year = as.integer(format(now, format = "%Y"))
  hour = as.integer(format(now, format = "%I"))
  minute = as.integer(format(now, format = "%M"))
  second = as.integer(format(now, format = "%S"))
  meridian = format(now, format = "%p")
  
  # compile the formatted timestamp
  ret = paste0(month,"%2f", day,"%2f", year,"+", hour,"%3a", minute,"%3a", second,"+", meridian)
  
  return(ret)
}

