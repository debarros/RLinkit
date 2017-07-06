#functions.R

# Load Libraries ####
library("XML")
library("RCurl")
library("openssl")
library("R6")
library("stringr")
library("openxlsx")
library("rrttReportBuilder")
library(googlesheets)

# Source static data ####
resources = read.csv(file = "resourceTable.csv", stringsAsFactors = F)

# Source functions and other stuff ####
source("httpBuilders.R")
source("searchAPI.R")
source("RecentResults.R")
source("SummarizeResults.R")
source("ScoreUpdates.R")

# Source classes ####
source("AdditionalClasses.R")
source("LinkItClasses.R")
source("DTermClass.R")
source("ProgramClass.R")
source("RosterClass.R")
source("SchoolClass.R")
source("StaffClass.R")
source("StudentClass.R")
source("TestAssignClass.R")
source("TestResultClass.R")



# Short functions ####
nullToNA_char = function(x){
  if(is.null(x)){return(NA_character_)
  } else {return(x)} }

nullToNA_char.list = function(x){return(lapply(x, nullToNA_char))}

