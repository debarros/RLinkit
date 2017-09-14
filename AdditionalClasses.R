#AdditionalClasses.R




Account <- R6Class(
  classname = "Account",
  
  private = list(
    pem.address = "",
    urlStub = list("development" = "https://www.linkitdev.com/restapi/v1", 
                   "production" = "https://www.linkit.com/restapi/v1"),
    mode = factor(x = integer(), levels = c("development", "production")),
    mime = factor(x = integer(), levels = c("json", "xml")),
    pubKey = NA_character_,
    priKey = NA_character_
  ),
  
  public = list(
    initialize = function(mode){
      private$mode = mode
    },
    toString = function(val = NA){
      print("nothing here yet")
    },
    getPubKey = function() {return(private$pubKey)},
    getPriKey = function() {return(private$priKey)},
    getUrlStub = function(){return(private$urlStub[private$mode][[1]])}, #the [[1]] makes it return just an atomic, unnamed character value
    getMode = function(){return(private$mode)},
    setPubKey = function(key){private$pubKey = key},
    setPriKey = function(key){private$priKey = key}
    #make set functions for each thingy in private
    #make get functions for each thingy in private
  )
)




