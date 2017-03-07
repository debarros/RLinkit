#httpBuilders.R

# URLbuilder ####
URLbuilder = function(url.relative, acct){
  #it appears that the LinkIt API may want the leading zeroes stripped
  timeStamp.leadingZeroes = format(Sys.time(), format = "%m/%d/%Y %I:%M:%S %p") #generate the timestamp
  timeStamp.noLeadingZeroes = makeTimeStamp(Sys.time())
  
  
  
  #add hash
  
  #format should be address publicKey urlHashedWithPrivateKey
  return(url.complete)
}




# - - - - - - - - - - - - - #
# RequestBuilder ####

RequestBuilder = function(acct){
  #make the request
  url = URLbuilder(url.relative, acct) #get the url
  #do other stuff
  return(fullRequest)
}




# - - - - - - - - - - - - - #
# makeTimeStamp ####

makeTimeStamp = function(now){
  month = as.integer(format(now, format = "%m"))
  day = as.integer(format(now, format = "%d"))
  year = as.integer(format(now, format = "%Y"))
  hour = as.integer(format(now, format = "%I"))
  minute = as.integer(format(now, format = "%I"))
  second = as.integer(format(now, format = "%S"))
  meridian = format(now, format = "%p")
  
  return(paste0(month,"/", day,"/", year," ", hour,":", minute,":", second," ", meridian))
  
  
}