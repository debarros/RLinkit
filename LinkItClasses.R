# Test version of HTTP request builder for RLinkIt!
# LinkIt! REST API wrapper
# Refer to https://linkit.atlassian.net/wiki/display/LRA/LinkIt!+REST+API#suk= for more information
# LinkItClasses.R
# R 3.2.1?


#
#	Object name						Status
#	School							CRUD
#	Staff							CRUD
#	Student							CRUD
#	Program							CRUD
#	District Term					CRUD
#	Class/Roster					CRUD
#	Test							 R
#	Test Assignment					CRU
#	Test Result						CR
#	Test-Taker Pass-through			C
#	Portal	Pass-through			C
#	OR and MG Pass-through			C
#	Icon/Tab Authorization			CRUD
#	Function Authorization			
#	Generate and Retrieve Reports	
#


library("XML")
library("RCurl")
library("digest")
library("R6")

source("LinkItURL.R")

{ # School
School <- R6Class("School",

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
				"---")
			return ret
		}
		
		print = function() {
			print(self$toString())
		},
			
		#
		# special use functions
		#
		
		isInit = function() {
			return private$init
		},
		
		XMLinit = function(xml) {
		# initialize from XML tree (result from LinkIt!)
		},
		
		JSONinit = function(json) {
		# initialize from JSON result from LinkIt!
		},
		
		# CRUD methods
		Create = function() {
		},
		
		Read = function() {
		},
		
		Update = function() {
		# Updates the school in the LinkIt database.
		# This implementation includes the informationt that is not being updated in the request 
		# to ensure synchronicity between client and server.
		},
		
		Delete = function() {
		},
		
		Sync = function() {
		# synchronizes School object to match LinkIt! data for identical SchoolID.
		}
	) # public
) # School
}

{ # Staff
Staff <- R6Class("Staff",

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
		initialize = function(UserId, Role,	UserName, FirstName, LastName, PhoneNumber, LocalCode, StateCode, Status, SchoolID, EmailAddress, ModifiedDate, CreatedDate) {
			private$UserId <- UserId,
			private$Role <- Role,
			private$UserName <- UserName,
			private$FirstName <- FirstName,
			private$LastName <- LastName,
			private$PhoneNumber <- PhoneNumber,
			private$LocalCode <- LocalCode,
			private$StateCode <- StateCode,
			private$Status <- Status,
			private$SchoolID <- SchoolID,
			private$EmailAddress <- EmailAddress,
			private$ModifiedDate <- ModifiedDate,
			private$CreatedDate <- CreatedDate,
			private$isInit <- TRUE
		},	
		
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
		
		toString = function() {
			ret <- cat(LastName, ", ", FirstName, "\n\t",
				"e-mail address:\t", EmailAddress, "\n\t",
				"Phone number:\t", PhoneNumber, "\n\n\t",
				"Status:\t", Status, "\n\t",
				"Username and ID:\t", UserName, ", ", UserId, "\n\t",
				"Role:\t", Role, "\n\t",
				"Account created:\t", CreatedDate, "\n\t"
				"Account last modified:\t", ModifiedDate)
			return ret
		},
		
		print = function() {
			print(self$toString()
		},
	
		isInit = function() {
			return private$init
		},
		
		XMLinit = function(xml) {
		# initialize from XML result from LinkIt!
		},

		JSONinit = function(json) {
		# initialize from JSON result from LinkIt!
		},

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
} # Staff

{ # Student 
Student<- R6Class("Student",

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
	
		initialize = function() {},
		
		setStudentID = function(!!!) {
			private$!!! <-!!!
		},

		setFirstName = function(!!!) {
			private$!!! <-!!!
		},

		setMiddleName = function(!!!) {
			private$!!! <-!!!
		},

		setLastName = function(!!!) {
			private$!!! <-!!!
		},

		setGender = function(!!!) {
			private$!!! <-!!!
		},

		setRace = function(!!!) {
			private$!!! <-!!!
		},

		setDateOfBirth = function(!!!) {
			private$!!! <-!!!
		},

		setLocalCode = function(!!!) {
			private$!!! <-!!!
		},

		setStateCode = function(!!!) {
			private$!!! <-!!!
		},

		setStatus = function(!!!) {
			private$!!! <-!!!
		},

		setSISID = function(!!!) {
			private$!!! <-!!!
		},

		setGrade = function(!!!) {
			private$!!! <-!!!
		},

		setAdminSchoolID = function(!!!) {
			private$!!! <-!!!
		},

		setCreatedDate = function(cdate) {
			private$CreatedDate <- cdate
		},

		setModifiedDate = function(mdate) {
			private$ModifiedDate <- mdate
		},

		toString = function() {
		
		},

		print = function() {
		
		},

		isInit = function() {
			return private$init
		},
		
		XMLinit = function(xml) {
		# initialize from XML result from LinkIt!
		},

		JSONinit = function(json) {
		# initialize from JSON result from LinkIt!
		},

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
}

{ # Program
Program<- R6Class("Program",

	private = list(
		ProgramID = NULL,
		Name = NULL,
		Code = NULL,
		AccessLevel = NULL,
		CreatedDate = NULL,
		ModifiedDate = NULL,
		init = FALSE
	),
	
	public = list (
	
		initialize = function() {},	

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
		
		toString = function() {
		
		},

		print = function() {
		
		},

		isInit = function() {
			return private$init
		},
		
		XMLinit = function(xml) {
		# initialize from XML result from LinkIt!
		},

		JSONinit = function(json) {
		# initialize from JSON result from LinkIt!
		},

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
}

{ # District Term
DTerm <- R6Class("DTerm",

	private = list(
		DistrictTermID = NULL,
		Name = NULL,
		Code = NULL,
		DateStart = NULL,
		DateEnd = NULL,
		CreatedDate = NULL,
		ModifiedDate = NULL,
		init = FALSE
	),
	
	public = list (
	
		initialize = function() {},
	
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
	
		toString = function() {
		
		},

		print = function() {
		
		},

		isInit = function() {
			return private$init
		},
		
		XMLinit = function(xml) {
		# initialize from XML result from LinkIt!
		},

		JSONinit = function(json) {
		# initialize from JSON result from LinkIt!
		},

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
}

{ # Class/Roster
#Called "Roster" to avoid confusion between an academic class and R6 class
Roster <- R6Class("Roster",

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
	),
	
	public = list (
	
		initialize = function() {},
	
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
	
		toString = function() {
		
		},

		print = function() {
		
		},

		isInit = function() {
			return private$init
		},
		
		XMLinit = function(xml) {
		# initialize from XML result from LinkIt!
		},

		JSONinit = function(json) {
		# initialize from JSON result from LinkIt!
		},

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
}

{ # Test 
TestGen <- R6Class("TestGen",

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
	),
	
	public = list (
	
		initialize = function() {},
	
	
	
	
	
	
	
	
	
		toString = function() {
		
		},

		print = function() {
		
		},

		isInit = function() {
			return private$init
		},
		
		XMLinit = function() {},
		JSONinit = function() {},
		Create = function() {},
		Read = function() {},
		Update = function() {},
		Delete = function() {},
		Sync = function() {}
)
}

{ # Test Assignment
TestAssign <- R6Class("TestAssign",

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
	
		initialize = function() {},
	
	
	
	
	
	
	
	
	
		toString = function() {
		
		},

		print = function() {
		
		},

		isInit = function() {
			return private$init
		},
		
		XMLinit = function() {},
		JSONinit = function() {},
		Create = function() {},
		Read = function() {},
		Update = function() {},
		Delete = function() {},
		Sync = function() {}
)
}

{ # Test Result
TestResult <- R6Class("TestResult",

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
	
		initialize = function() {},
	
	
	
	
	
	
	
	
	
		toString = function() {
		
		},

		print = function() {
		
		},

		isInit = function() {
			return private$init
		},
		
		XMLinit = function() {},
		JSONinit = function() {},
		Create = function() {},
		Read = function() {},
		Update = function() {},
		Delete = function() {},
		Sync = function() {}
)
}

{ # Test-Taker Pass-through ****
TestTaker <- R6Class("TestTaker",
)
}

{ # LinkIt! Portal Pass-through
Portal <- R6Class("Portal",

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

)
}

{ # Online Review and Manual Grading Pass-through
ReviewGrading <- R6Class("ReviewGrading",

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

)
}

{ # Icon/Tab Authorization by School and Role
IconTabAuth <- R6Class("IconTabAuth",

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

)
}

{ # Function Authorization by School and Role
FunctionAuth <- R6("FunctionAuth"

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

)
}

{ # Generate and Retrieve ACT/SAT Student Reports 
SATACTGen <- R6Class("SATACTGen"

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

)
}
