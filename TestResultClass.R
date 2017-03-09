#- - - - - - - - - - - #
#                      #
# TestResultClass.R    ####
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

TestResult <- R6Class(
  classname = "TestResult",
  
  private = list(
    TestResultID = NULL,	
    TestID = NULL,
    TestName = NULL,
    DistrictTermID = NULL,
    DistrictTermName = NULL,
    SchoolID = NULL,
    SchoolName = NULL,
    ClassID = NULL,
    CourseName = NULL,
    Section = NULL,
    TeacherID = NULL,
    TeacherCode = NULL,
    TeacherUserName = NULL,
    StudentID = NULL,
    StudentCode = NULL,
    StudentFirstName = NULL,
    StudentLastName = NULL,
    TotalPointsPossible = NULL,
    TotalPointsEarned = NULL,
    PercentScore = NULL,
    ResultDate = NULL,
    GradingStatus = NULL,
    TestMethod = NULL,
    CreatedDat = NULL,
    ModifiedDate = NULL,
    TestMethod = NULL,
    AdjustedPointsEared = NULL,	
    AdjustedPercentScore = NULL,
    ScaledScore = NULL,
    PercentileScore = NULL,
    LexileScore = NULL,
    SubScore = NULL,
    init = FALSE
  ), # private
  
  public = list (
    
    #
    # Basic, generic functions
    #
    initialize = function(TestResultID, TestID, TestName, DistrictTermID, DistrictTermName, SchoolID, SchoolName, ClassID, CourseName, Section, TeacherID, TeacherCode, TeacherUserName, StudentID, StudentCode, StudentFirstName, StudentLastName, TotalPointsPossible, TotalPointsEarned, PercentScore, ResultDate, GradingStatus, TestMethod, CreatedDate, ModifiedDate, TestMethod, AdjustedPointsEarned, AdjustedPercentScore, ScaledScore, PercentileScore, LexileScore, SubScore) {
      TestResultID = TestResultID
      TestID = TestID
      TestName = TestName
      DistrictTermID = DistrictTermID
      DistrictTermName = DistrictTermName
      SchoolID = SchoolID
      private$SchoolName = SchoolName
      private$ClassID = ClassID	
      private$CourseName = CourseName	
      private$Section = Section
      private$TeacherID = TeacherID
      private$TeacherCode = TeacherCode
      private$TeacherUserName = TeacherUserName
      private$StudentID = StudentID
      private$StudentCode = StudentCode
      private$StudentFirstName = StudentFirstName
      private$StudentLastName = StudentLastName
      private$TotalPointsPossible = TotalPointsPossible
      private$TotalPointsEarned = TotalPointsEarned	
      private$PercentScore = PercentScore	
      private$ResultDate = ResultDate	
      private$GradingStatus = GradingStatus
      private$TestMethod = TestMethod
      private$CreatedDate = CreatedDate
      private$ModifiedDate = ModifiedDate
      private$TestMethod = TestMethod
      private$AdjustedPointsEarned = AdjustedPointsEarned
      private$AdjustedPercentScore = AdjustedPercentScore
      private$ScaledScore = ScaledScore
      private$PercentileScore = PercentileScore
      private$LexileScore = LexileScore
      private$SubScore = SubScore
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
) # TestResult
