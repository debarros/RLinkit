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
  url.stub = "https://www.linkitdev.com/restapi/v1" #get it from acct
  
  #put together the parameter section of the url
  if (length(parameters)>0){
    paramString = paste0("&",paste(names(parameters), parameters, sep = "=", collapse = "&"))
  } else {
    paramString = ""
  }
  
  #Set the PublicKey to be used as the AccessKey
  akey = PublicKey #get it from acct
  
  #get the current date and time, properly formatted
  tStamp = makeTimeStamp()
  
  #Build the basic url
  url.partial = paste0(url.stub,url.resource, parameters, "&TimeStamp=", tStamp, "&AccessKey=", akey)
  
  #Complete the url by appending the hashed version
  url.complete = paste0(url, "&Tag=",sha1(url, key = PrivateKey))
  
  return(url.complete)
}




# - - - - - - - - - - - - - #
# RequestBuilder ####
# the resource is the type of thing we are trying to do, such as search for schools
RequestBuilder = function(acct, handle, resource, parameters = list()){
  
  #Determine the relative url
  url.relative = "/schools?verb=search" #this should be based on the actual resource needed
  
  #add any additional paramters specific to the resource
  parameters = someFunction(parameters, resource)
  
  #make the URL
  url = URLbuilder(url.relative, acct, parameters) #get the url
  
  #retrieve it
  response = getURI(url.complete, httpheader = c(Accept="application/xml",'Content-Type' = "application/xml"), curl = handle)
  
  #parse it based on the the resource type
  ret = someOtherFunction(response, resource)
  
  return(ret)
}




# - - - - - - - - - - - - - #
# makeTimeStamp ####

makeTimeStamp = function(now = Sys.time()){
  now = as.POSIXlt(now, tz = "GMT")
  month = as.integer(format(now, format = "%m"))
  day = as.integer(format(now, format = "%d"))
  year = as.integer(format(now, format = "%Y"))
  hour = as.integer(format(now, format = "%I"))
  minute = as.integer(format(now, format = "%I"))
  second = as.integer(format(now, format = "%S"))
  meridian = format(now, format = "%p")
  return(paste0(month,"%2f", day,"%2f", year,"+", hour,"%3a", minute,"%3a", second,"+", meridian))
}