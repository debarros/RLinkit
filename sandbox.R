source("cred.R")
source("functions.R")

#set the account
myAccount = Account$new("production")
myAccount$setPriKey(ProdKey$Private)
myAccount$setPubKey(ProdKey$Public)

#set the last time results were pulled (will want to source this from somewhere)
lastTime = strptime("2017-02-01 10:32:36", format = "%Y-%m-%d %H:%M:%S")

#Get all the results since lastTime
ResultFrame = RecentResults(myAccount, LinkItHandle, lastTime)

#Summarize the results since lastTime
ResultSummary = SummarizeResults(ResultFrame)

#Take a look at the output
View(ResultFrame)
View(ResultSummary)


#Create output of the scores that need quick updates or reports
cap = 0 #only tests with fewer than cap new scores will be included in the quick updates
ScoreUpdates(ResultFrame, ResultSummary, cap)


