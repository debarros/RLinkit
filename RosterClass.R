#- - - - - - - - - - - #
#                      #
# RosterClass.R        ####
#                      #
#- - - - - - - - - - - #

# Load Libraries ####
library("XML")
library("RCurl")
library("openssl")
library("R6")

#source("LinkItURL.R")
# This file does not exist yet.

source("cred.R")

# Define Classes ####

#Called "Roster" to avoid confusion between an academic class and R6 class
Roster <- R6Class(
  classname = "Roster",
  
  private = list(
    ClassID = NULL,
    SchoolID = NULL,
    DistrictTermID = NULL,
    UserID = NULL,
    LOE = NULL,
    ClassType = NULL,
    CourseName = NULL,
    Section = NULL,
    Period = NULL,
    CourseNumber = NULL,
    SISID = NULL,
    Grade = NULL,
    CreatedDate = NULL,
    ModifiedDate = NULL,
    init = FALSE
  ), #private
  
  public = list (
    
    #
    # Basic, generic functions
    #
    initialize = function(DistrictTermID, Name, Code, DateStart, DateEnd, CreatedDate, ModifiedDate) {
      DistrictTermID = NULL
      Name = NULL
      Code = NULL
      DateStart = NULL
      DateEnd = NULL
      CreatedDate = NULL
      ModifiedDate = NULL
      init = FALSE},
    
    #The following functions assign the argument to the appropriate private variable
    setClassID = function(ClassID) {
      private$ClassID <- ClassID
    },
    
    setSchoolID = function(SchoolID) {
      private$SchoolID <- SchoolID
    },
    
    setDistrictTermID = function(DistrictTermID) {
      private$DistrictTermID <- DistrictTermID
    },
    
    setUserID = function(UserID) {
      private$UserID <- UserID
    },
    
    setLOE = function(LOE) {
      private$LOE <- LOE
    },
    
    setClassType = function(ClassType) {
      private$ClassType <- ClassType
    },
    
    setCourseName = function(CourseName) {
      private$CourseName <- CourseName
    },
    
    setSection = function(Section) {
      private$Section <- Section
    },
    
    setPeriod = function(Period) {
      private$Period <- Period
    },
    
    setCourseNumber = function(CourseNumber) {
      private$CourseNumber <- CourseNumber
    },
    
    setSISID = function(SISID) {
      private$SISID <- SISID
    },
    
    setGrade = function(Grade) {
      private$Grade <- Grade
    },
    
    setCreatedDate = function(cdate) {
      private$CreatedDate <- cdate
    },
    
    setModifiedDate = function(mdate) {
      private$ModifiedDate <- mdate
    },
    
    #
    # special use functions
    #
    toString = function() {
      
    },
    
    print = function() {
      print(self$toString())
    },
    
    isInit = function() {
      return(private$init)
    },
    
    XMLinit = function(xml) {
      # initialize from XML result from LinkIt!
    },
    
    JSONinit = function(json) {
      # initialize from JSON result from LinkIt!
    },
    
    #
    # CRUD methods
    #
    Create = function() {
      #fill this in!!!
    },
    
    Read = function() {
      #fill this in!!!
    },
    
    Update = function() {
      #fill this in!!!
    },
    
    Delete = function() {
      #fill this in!!!
    },
    
    Sync = function() {}
  ) # public
) # Roster