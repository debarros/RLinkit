
#----------------------#
#### Initial section ####
#----------------------#
source("cred.R")
source("functions.R")

# Sign in to google
gs_auth() # this might launch a browser so you can sign into your account
ScannedTests.url = gs_url("") #enter the URL of the scanned test document here

# Read and format the last time the program was run
lastTime = gs_read(ss = ScannedTests.url, ws = 2)
lastTime = as.character(lastTime$LastTime[1])
lastTime = strptime(lastTime, format = "%Y-%m-%d %H:%M:%S")


#----------------------#
#### LinkIt section ####
#----------------------#
# set the account
myAccount = Account$new("production")
myAccount$setPriKey(ProdKey$Private)
myAccount$setPubKey(ProdKey$Public)

# Get all the results since lastTime
ResultFrame = RecentResults(myAccount, LinkItHandle, lastTime)

# Summarize the results since lastTime
ResultSummary = SummarizeResults(ResultFrame)

# store the date and time of the current run
gs_edit_cells(ss = ScannedTests.url, ws = 2, input = Sys.time(), anchor = "A2") 


#----------------------#
#### Report section ####
#----------------------#
# Read in the TAB
TAB = read.xlsx(xlsxFile = "J:/tests/2016-2017/TAB.xlsx")

# Check for tests not included in the tab
missingTests = ResultSummary$TestName[!(ResultSummary$TestName %in% TAB$TestName)]
print(missingTests)
# If there are any missing tests, add them to the TAB

# Print out the tests that will score files exported from LinkIt
ResultSummary$TestName
# Download the student item response files for those exams.  
# Put them in a folder called "exports" inside the folder for that test

# Generate the reports
for(i in 1:nrow(ResultSummary)){
  generateReport(DataLocation = TAB$Folder.location[TAB$TestName == ResultSummary$TestName[i]])
}



#--------------------------#
#### Monitoring section ####
#--------------------------#


# Get the current Scanned Tests document and then clear it out
ScannedTests = gs_read(ss = ScannedTests.url, ws = 1)
Blank = matrix(data = "", nrow = nrow(ScannedTests), ncol = ncol(ScannedTests)) 
gs_edit_cells(ss = ScannedTests.url, ws = 1, input = Blank, anchor = "A2") # Start at A2 to leave the header row in place

# Modify ScannedTests to include the newly scanned tests


# Update the Scanned Tests document with the modified ScannedTests 
gs_edit_cells(ss = ScannedTests.url, ws = 1, input = ScannedTests, anchor = "A1") # Start at A1 b/c the header row is also added

generateReport(DataLocation = TAB$Folder.location[1])



#--------------------------#
#### Follow up section ####
#--------------------------#

# Go to the Scanned Tests document
# If the Analyze column is marked TRUE, send an email narrative
# If the Analyze column is not marked TRUE but the Update column is, send an email with the update
# Either way, attach the score report xlsx file



