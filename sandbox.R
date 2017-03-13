library("XML")
library("RCurl")
library("openssl")
library("R6")
source("cred.R")
source("httpBuilders.R")
source("functions.R")

myAccount = Account$new("development")
myAccount$getUrlStub()  

searchAPI(acct = myAccount, handle = LinkItHandle, resource = "school")

x = searchAPI(acct = myAccount, handle = LinkItHandle, resource = "result") #,parameters = list("PageSize" = "1"))


y.xmlToList = xmlToList(x)

str(y, give.attr = F, max.level = 3)
nRecords = y.xmlToList$Data$TotalRecords

str(y.xmlToList$Data, max.level = 2, give.attr = F)
