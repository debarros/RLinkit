#AdditionalClasses.R




Account <- R6Class(
  classname = "Account",
  
  private = list(
    pem.address = "",
    urlStub = list("development" = "https://www.linkitdev.com/restapi/v1", 
                   "production" = "https://www.linkit.com/restapi/v1"),
    mode = factor(x = integer(), levels = c("development", "production")),
    pubKey = PublicKey, #this should be fixed
    priKey = PrivateKey #this should be fixed
  ),
  
  public = list(
    Name = NULL,
    initialize = function(mode){
      private$mode = mode
    },
    toString = function(val = NA){
      print("nothing here yet")
    },
    getPubKey = function() {return(private$pubKey)},
    getPriKey = function() {return(private$priKey)},
    getUrlStub = function(){return(private$urlStub[private$mode][[1]])}, #the [[1]] makes it return just an atomic, unnamed character value
    getMode = function(){return(private$mode)}
    #make set functions for each thingy in private
    #make get functions for each thingy in private
  )
)




