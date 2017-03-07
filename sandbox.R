library("XML")
library("RCurl")
library("openssl")
library("R6")
source("cred.R")
source("httpBuilders.R")


#location of the file needed for https requests
caLocation = "cacert.pem.crt" 

#set the user agent (do we need this?)
agent="Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36" 

#create a CURL options object.  This can be used to set options in CURL.
Options <- curlOptions(
  cainfo = caLocation, 
  useragent = agent,
  followlocation = T,
  verbose = T,
  cookiejar = ""  
)

#Establish a handle to use with ongoing sessions
LinkItHandle = getCurlHandle()

#set the curl options
curlSetOpt(.opts = Options, curl = LinkItHandle)  

#this is the thing to add to the url stub so access a particular function on the API
resourceURI = "/schools?verb=search"

#get the current date and time, properly formatted
tStamp = makeTimeStamp(Sys.time())

#Set the PublicKey to be used as the AccessKey
akey = PublicKey

#Build the parameters that will be appended to the url
parameters = paste0("&PageIndex=",1,"&PageSize=",10,"&TimeStamp=", tStamp, "&AccessKey=", akey)

#Fix the weird characters in the paramaters (these might all come from the date and time, so maybe put this stuff in makeTimeStamp?)
parameters = gsub(pattern = " ", replacement = "+", x = parameters)
parameters = gsub(pattern = "/", replacement = "%2f", x = parameters)
parameters = gsub(pattern = ":", replacement = "%3a", x = parameters)

#Build the basic url
url = paste0(urlStub, resourceURI, parameters)

#Complete the url by appending the hashed version
url.complete = paste0(url, "&Tag=",sha1(url, key = PrivateKey))

#make the request
x = getURI(url.complete, httpheader = c(Accept="application/xml",'Content-Type' = "application/xml"), curl = LinkItHandle)

#look at the result
htmlParse(x)

#put the result in a file so you can look at it in a browser
write(x, file = "sampleResponse.html")



