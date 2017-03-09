#- - - - - - - - - - - #
#                      #
# TestAssignClass.R    ####
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

TestAssign <- R6Class(
  classname = "TestAssign",
  
  private = list(
    TestAssignmentID = NULL,
    TestID = NULL,
    ClassID = NULL,
    StudentID = NULL,
    Type = NULL,
    TutorialMode = NULL,
    Status = NULL,
    Code = NULL,
    ComparisonPasscodeLength = NULL,
    AssignmentGUID = NULL,
    CreatedDate = NULL,
    ModifiedDate = NULL,
    init = FALSE
  ), # private
  
  public = list (
    
    #
    # Basic, generic functions
    #	
    initialize = function(TestAssignmentID, TestID, ClassID, StudentID, Type, TutorialMode, Status, Code, ComparisonPasscodeLength, AssignmentGUID, CreatedDate, ModifiedDate) {
      private$TestAssignmentID = TestAssignmentID
      private$TestID = TestID
      private$ClassID = ClassID
      private$StudentID = StudentID
      private$Type = Type
      private$TutorialMode = TutorialMode
      private$Status = Status
      private$Code = Code
      private$ComparisonPasscodeLength = ComparisonPasscodeLength
      private$AssignmentGUID = AssignmentGUID
      private$CreatedDate = CreatedDate
      private$ModifiedDate = ModifiedDate
      init = TRUE
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
) # TestAssign
