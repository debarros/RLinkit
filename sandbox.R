library("XML")
library("RCurl")
library("openssl")
library("R6")
source("cred.R")
source("httpBuilders.R")


  

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





parameters = list("PageIndex" = 1,"PageSize" = 10)



  lapply(X = c(parameters), FUN = function(x){paste0(x, names(x))})
}


stuff = list("thing" = "otherthing")



pastetoname(parameters)



