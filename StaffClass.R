#- - - - - - - - - - - #
#                      #
# StaffClass.R         ####
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

Staff <- R6Class(
  classname = "Staff",
  
  # Private variables
  # Variable names correspond directly to names in LinkIt API
  private = list(
    UserId = NULL,
    Role = NULL,
    UserName = NULL,
    FirstName = NULL,
    LastName = NULL,
    PhoneNumber = NULL,
    LocalCode = NULL,
    StateCode = NULL,
    Status = NULL,
    SchoolID = NULL,
    EmailAddress = NULL,
    ModifiedDate = NULL,
    CreatedDate = NULL,
    init = FALSE
  ), # private
  
  public = list(
    #
    # Basic, generic functions
    #
    initialize = function(UserId, Role,	UserName, FirstName, LastName, PhoneNumber, LocalCode, StateCode, Status, SchoolID, EmailAddress, ModifiedDate, CreatedDate) {
      private$UserId <- UserId
      private$Role <- Role
      private$UserName <- UserName
      private$FirstName <- FirstName
      private$LastName <- LastName
      private$PhoneNumber <- PhoneNumber
      private$LocalCode <- LocalCode
      private$StateCode <- StateCode
      private$Status <- Status
      private$SchoolID <- SchoolID
      private$EmailAddress <- EmailAddress
      private$ModifiedDate <- ModifiedDate
      private$CreatedDate <- CreatedDate
      private$init <- TRUE
    },	
    
    #The following functions assign the argument to the appropriate private variable
    setUserId = function(UserId) {
      private$UserId <- UserId
    },
    
    setRole = function(Role) {
      private$Role <- Role
    },
    
    setUserName = function(UserName) {
      private$UserName <- UserName
    },
    
    setFirstName = function(FirstName) {
      private$FirstName <- FirstName
    },
    
    setLastName = function(LastName) {
      private$LastName <- LastName
    },
    
    setPhoneNumber = function(PhoneNumber) {
      private$PhoneNumber <- PhoneNumber
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
    
    setSchoolID = function(SchoolID) {
      private$SchoolID <- SchoolID
    },
    
    setEmailAddress = function(EmailAddress) {
      private$EmailAddress <- EmailAddress
    },
    
    setModifiedDate = function(ModifiedDate) {
      private$ModifiedDate <- ModifiedDate
    },
    
    setCreatedDate = function(CreatedDate) {
      private$CreatedDate = CreatedDate
    },
    
    #
    # special use functions
    #
    toString = function() {
      ret <- cat(private$LastName, ", ", private$FirstName, "\n\t",
                 "e-mail address:\t", private$EmailAddress, "\n\t",
                 "Phone number:\t", private$PhoneNumber, "\n\n\t",
                 "Status:\t", private$Status, "\n\t",
                 "Username and ID:\t", private$UserName, ", ", private$UserId, "\n\t",
                 "Role:\t", private$Role, "\n\t",
                 "Account created:\t", private$CreatedDate, "\n\t",
                 "Account last modified:\t", private$ModifiedDate)
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
  )	
)
# Staff