#- - - - - - - - - - - #
#                      #
# DTermClass.R         ####
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

DTerm <- R6Class(
  classname = "DTerm",
  
  private = list(
    DistrictTermID = NULL,
    Name = NULL,
    Code = NULL,
    DateStart = NULL,
    DateEnd = NULL,
    CreatedDate = NULL,
    ModifiedDate = NULL,
    init = FALSE
  ), #private
  
  public = list (
    
    #
    # Basic, generic functions
    #
    initialize = function(DistrictTermID, Name, Code, DateStart, DateEnd, CreatedDate, ModifiedDate) {
      private$DistrictTermID = DistrictTermID
      private$Name = Name
      private$Code = Code
      private$DateStart = DateStart
      private$DateEnd = DateEnd
      private$CreatedDate = CreatedDate
      private$ModifiedDate = ModifiedDate
      init = TRUE
    },
    
    #The following functions assign the argument to the appropriate private variable
    setDistrictTermID = function(DistrictTermID) {
      private$DistrictTermID <- DistrictTermID
    },
    
    setName = function(Name) {
      private$Name <- Name
    },
    
    setCode = function(Code) {
      private$Code <- Code
    },
    
    setDateStart = function(DateStart) {
      private$DateStart <- DateStart
    },
    
    setDateEnd = function(DateEnd) {
      private$DateEnd <- DateEnd
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
      return (private$init)
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
) # DTerm
