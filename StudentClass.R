#- - - - - - - - - - - #
#                      #
# StudentClass.R       ####
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

Student<- R6Class(
  classname = "Student",
  
  private = list(
    StudentID = NULL,
    FirstName = NULL,
    MiddleName = NULL,
    LastName = NULL,
    Gender = NULL,
    Race = NULL,
    DateOfBirth = NULL,
    LocalCode = NULL,
    StateCode = NULL,
    Status = NULL,
    SISID = NULL,
    Grade = NULL,
    AdminSchoolID = NULL,
    CreatedDate = NULL,
    ModifiedDate = NULL,
    init = FALSE
  ),
  
  public = list (
    
    #
    # Basic, generic functions
    #
    initialize = function(StudentID, FirstName, MiddleName, LastName, Gender, Race, DateOfBirth, LocalCode, StateCode, Status, SISID, Grade, AdminSchoolID, CreatedDate, ModifiedDate) {
      private$StudentID <- StudentID
      private$FirstName <- FirstName
      private$MiddleName <- MiddleName
      private$LastName <- LastName
      private$Gender <- Gender
      private$Race <- Race
      private$DateOfBirth <- DateOfBirth
      private$LocalCode <- LocalCode
      private$StateCode <- StateCode
      private$Status <- Status
      private$SISID <- SISID
      private$Grade <- Grade
      private$AdminSchoolID <- AdminSchoolID
      private$CreatedDate <- CreatedDate
      private$ModifiedDate <- ModifiedDate
      private.isInit = TRUE
    },
    
    #The following functions assign the argument to the appropriate private variable
    setStudentID = function(StudentID) {
      private$StudentID <- StudentID
    },
    
    setFirstName = function(FirstName) {
      private$FirstName <- FirstName
    },
    
    setMiddleName = function(MiddleName) {
      private$MiddleName <- MiddleName
    },
    
    setLastName = function(LastName) {
      private$LastName <- LastName
    },
    
    setGender = function(Gender) {
      private$Gender <- Gender
    },
    
    setRace = function(Race) {
      private$Race <- Race
    },
    
    setDateOfBirth = function(DateOfBirth) {
      private$DateOfBirth <- DateOfBirth
    },
    
    setLocalCode = function(LocalCode) {
      private$LocalCode <- LocalCode
    },
    
    setStateCode = function(StateCode) {
      private$StateCode <- StateCode
    },
    
    setStatus = function(Status) {
      private$Status <- Status
    },
    
    setSISID = function(SISID) {
      private$SISID <- SISID
    },
    
    setGrade = function(Grade) {
      private$Grade <- Grade
    },
    
    setAdminSchoolID = function(AdminSchoolID) {
      private$AdminSchoolID <- AdminSchoolID
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
      ret <- cat(private$LastName, ", ", private$FirstName, " ", private$MiddleName, "\n\t",
                 "ID, Grade:\t", private$StudentID, ", ", private$Grade, "th grade\n\t",
                 "DOB, Gender, Race:\t", private$DateOfBirth, ", ", private$Gender, ", ", private$Race, "\n\t",
                 "Local Code:\t", private$LocalCode, "\n\t",
                 "State Code:\t", private$StateCode, "\n\t",
                 "SISID:\t", private$SISID, "\n\t",
                 "Admin School ID:\t", private$AdminSchoolID, "\n\t",
                 "Record created:\t", private$CreatedDate, "\n\t",
                 "Record last modified:\t", private$ModifiedDate)
      return(ret)
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
) # Student