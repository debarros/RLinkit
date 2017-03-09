#- - - - - - - - - - - #
#                      #
# TestClass.R          ####
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

Test <- R6Class(
  classname = "Test",
  
  private = list(
    TestID = NULL,
    TestName = NULL,
    BankID = NULL,
    BankName = NULL,
    Subject	= NULL,
    Grade = NULL,
    AuthorID = NULL,
    AuthorFirstName = NULL,
    AuthorLastName = NULL,
    CreatedDate = NULL,
    ModifiedDate = NULL,
    init = FALSE
  ), # private
  
  public = list (
    
    #
    # Basic, generic functions
    #
    initialize = function(TestID, TestName, BankID, BankName, Subject	= NULL, 
                          Grade, AuthorID, AuthorFirstName, AuthorLastName, 
                          CreatedDate, ModifiedDate, init = FALSE) {
      TestID = NULL
      TestName = NULL
      BankID = NULL
      BankName = NULL
      Subject	= NULL
      Grade = NULL
      AuthorID = NULL
      AuthorFirstName = NULL
      AuthorLastName = NULL
      CreatedDate = NULL
      ModifiedDate = NULL
      init = FALSE},
    
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
    
    XMLinit = function() {},
    JSONinit = function() {},
    #
    # CRUD methods
    #
    Create = function() {},
    Read = function() {},
    Update = function() {},
    Delete = function() {},
    Sync = function() {}
  ) # public
) # TestGen