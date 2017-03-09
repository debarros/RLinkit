#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -#
# Header                                                                                       ####
# Test version of R6 wrappers for LinkIt! REST API                                                #
# Go to https://linkit.atlassian.net/wiki/display/LRA/LinkIt!+REST+API#suk= for more information  #
# LinkItClasses.R                                                                                 #
# R 3.2.1?                                                                                        #
#                                                                                                 #
# Authors:                                                                                        #
# Alan B. Thorne, Jr.                                                                             #
# Paul de Barros                                                                                  #
#                                                                                                 #
# Current Status:                                                                                 #
#    No CRUD Methods have been implemented                                                        #
#                                                                                                 #
# This project is available at https://github.com/abthornejr/RLinkIt                              #
#                                                                                                 #
# This file was broken into separate files for each class for sake of readability and             #
# maintainability. It became a bit difficult to navigate as it approached 1200 very repetitive    #
# lines.                                                                                          #
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -#


# Object Available Methods Table ####

#   Object name                     |   Method
# - - - - - - - - - - - - - - - - - - - - - - - - -
#   School                          |   CRUD
#   Staff                           |   CRUD
#   Student                         |   CRUD
#   Program                         |   CRUD
#   District Term                   |   CRUD
#   Class/Roster                    |   CRUD
#   Test                            |    R
#   Test Assignment                 |   CRU
#   Test Result                     |   CR
#   Test-Taker Pass-through         |   C
#   Portal Pass-through             |   C
#   OR and MG Pass-through          |   C
#   Icon/Tab Authorization          |   CRUD
#   Function Authorization          |   	
#   Generate and Retrieve Reports   |   
#

# Load Libraries ####
library("XML")
library("RCurl")
library("openssl")
library("R6")

#source("LinkItURL.R")
# This file does not exist yet.

source("cred.R")

# Define Classes ####




#- - - - - - - - - - - - - - - - - - - - - - - -#
# Pass-through and other methods                ####
#                                               #
# These methods are of a different sort from    #
# the above methods. We'll get here, but it's   #
# less pressing.                                #
#- - - - - - - - - - - - - - - - - - - - - - - -#

# Test-Taker Pass-through **** ####
TestTaker <- R6Class(
  classname = "TestTaker"
  # should there be private and public lists here?
) # TestTaker


# LinkIt! Portal Pass-through
Portal <- R6Class(
  classname = "Portal",
  
  private = list(
    init = FALSE
  ) # private
  
  #should there be a public list here?
  
)#Portal


# Online Review and Manual Grading Pass-through ####
ReviewGrading <- R6Class(
  classname = "ReviewGrading",
  
  private = list(
    init = FALSE
  ) #ReviewGrading
  #should there be a public list here?
  
) # ReviewGrading


# Icon/Tab Authorization by School and Role ####
IconTabAuth <- R6Class(
  classname = "IconTabAuth",
  
  private = list(
    init = FALSE
  ) # private
  #should there be a public list here?
  
) # IconTabAuth


# Function Authorization by School and Role ####
FunctionAuth <- R6(
  classname = "FunctionAuth",
  
  private = list(
    SchoolID = NULL,
    init = FALSE
  ), # private
  #should there be a public list here?
  
  public = list(
    initialize = function () {}
    
  )	 # public
) #FunctionAuth


# Generate and Retrieve ACT/SAT Student Reports ####
SATACTGen <- R6Class(
  classname = "SATACTGen",
  
  private = list(
    Ticekt = NULL,
    init = FALSE
  ) # private
  #should there be a public list here?
  
) # SATACTGen

