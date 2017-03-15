source("cred.R")
source("functions.R")

#set the account
myAccount = Account$new("development")
myAccount$setPriKey(PrivateKey)
myAccount$setPubKey(PublicKey)

#set the last time results were pulled (will want to source this from somewhere)
lastTime = strptime("2017-02-01 10:32:36", format = "%Y-%m-%d %H:%M:%S")

#Get all the results since lastTime
ResultFrame = RecentResults(myAccount, LinkItHandle, lastTime)

#Summarize the results since lastTime
ResultSummary = SummarizeResults(ResultFrame)

#Take a look at the output
View(ResultFrame)
View(ResultSummary)







