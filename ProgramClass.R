#- - - - - - - - - - - #
#                      #
# ProgramClass.R       ####
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

Program<- R6Class(
  classname = "Program",
  
  private = list(
    ProgramID = NULL,
    Name = NULL,
    Code = NULL,
    AccessLevel = NULL,
    CreatedDate = NULL,
    ModifiedDate = NULL,
    init = FALSE
  ), #private
  
  public = list (
    
    initialize = function(ProgramID, Name, Code, AccessLevel, CreatedDate, ModifiedDate) {
      private$ProgramID = NULL
      private$Name = NULL
      private$Code = NULL
      private$AccessLevel = NULL
      private$CreatedDate = NULL
      private$ModifiedDate = NULL
      init = TRUE},	
    
    #The following functions assign the argument to the appropriate private variable
    setProgramID = function(ProgramID) {
      private$ProgramID <- ProgramID
    },
    
    setName = function(Name) {
      private$Name <- Name
    },
    
    setCode = function(Code) {
      private$Code <- Code
    },
    
    setAccessLevel = function(AccessLevel) {
      private$AccessLevel <- AccessLevel
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
  ) #public
) #program