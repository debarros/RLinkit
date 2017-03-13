#AdditionalClasses.R




Account <- R6Class(
  classname = "Account",
  
  private = list(
    pem.address = "",
    urlStub.dev = "",
    urlStub.prod = "",
    mode = factor(x = integer(), levels = c("development", "production")),
    pubKey = PublicKey,
    priKey = PrivateKey
  ),
  
  public = list(
    Name = NULL,
    initialize = function(name = NA){
      self$name = name
    },
    toString = function(val = NA){
      print("nothing here yet")
    },
    getpubKey = function() {
      return(private$pubKey)
    },
    getpriKey = function() {
      return(private$priKey)
    }
    #make set functions for each thingy in private
    #make get functions for each thingy in private
  )
)




