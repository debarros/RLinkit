#- - - - - - - - - - - #
#                      #
# SchoolClass.R        ####
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
School <- R6Class(
  classname = "School",
  
  # Private variables
  # Variable names correspond directly to names in LinkIt API
  private = list(
    SchoolID = NULL,
    Name = NULL,
    LocalCode = NULL,
    StateCode = NULL,
    CreatedDate = NULL,
    ModifiedDate = NULL,
    Status = NULL,
    StateAbbr = NULL,
    init = FALSE
  ), # private
  
  # Public methods and functions
  # Includes typical initializer, print, update functions plus calls to LinkIt API (CRUD methods)
  public = list (
    
    #
    # Basic, generic functions
    #
    
    initialize = function(school.id, name, local.code, state.code, created.date, modified.date, status, state.abbr) {
      # initializes the school class
      private$SchoolID <- school.id
      private$Name <- name
      private$LocalCode <- local.code
      private$StateCode <- state.code
      private$CreatedDate <- created.date
      private$ModifiedDate <- modified.date
      private$Status <- status
      private$StateAbbr <- state.abbr
      private$init <- TRUE
    },
    
    #The following functions assign the argument to the appropriate private variable
    setSchoolID = function(id) {
      private$SchoolID <- id
    },
    
    setName = function(name) {
      private$Name <- name
    },
    
    setLocalCode = function(code) {
      private$LocalCode <- code
    },
    
    setStateCode = function(code) {
      private$StateCode <- code
    },
    
    setCreatedDate = function(cdate) {
      private$CreatedDate <- cdate
    },
    
    setModifiedDate = function(mdate) {
      private$ModifiedDate <- mdate
    },
    
    setStatus = function(status) {
      private$Status <- status
    },
    
    setStateAbbr = function(state) {
      private$StateAbbr <- state
    },
    
    toString = function() {
      ret <- cat(private$Name, ", ", private$State, "\n\t",
                 "ID:\t", private$SchoolID, "\n\t",
                 "State Code:\t", private$StateCode, "\n\t",
                 "Status:\t", private$Status, "\n\t",
                 "Created in LinkIt!:\t", private$CreatedDate, "\n\t",
                 "Last Modified in LinkIt!:\t", private$ModifiedDate, "\n",
                 "- -")
      return(ret)
    }
    
    print = function() {
      print(self$toString())
    },
    
    #
    # special use functions
    #
    isInit = function() {
      return(private$init)
    },
    
    XMLinit = function(xml) {
      # initialize from XML tree (result from LinkIt!)
    },
    
    JSONinit = function(json) {
      # initialize from JSON result from LinkIt!
    },
    
    #
    # CRUD methods
    #
    Create = function(name, local.code, state.code, state.abbr) {
      # Call request builder
      # this$Sync() ? self$Sync()
    }
    
    Read = function(school.id, name, local.code, state.code, created.date, modified.date, status, state.abbr) {
    },
    
    Update = function(school.id, name, local.code, state.code, created.date, modified.date, status, state.abbr) {
      # Updates the school in the LinkIt database.
      # This implementation includes the informationt that is not being updated in the request 
      # to ensure synchronicity between client and server.
    },
    
    Delete = function(school.id, name, local.code, state.code, created.date, modified.date, status, state.abbr) {
    },
    
    Sync = function() {
      # synchronizes School object to match LinkIt! data for identical SchoolID.
      
      #Read?
      
      #xml init or json init
    }
  ) # public
) # School
