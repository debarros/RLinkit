#AdditionalClasses.R




Account <- R6Class(
  classname = "Account",
  
  private = list(
    pem.address = "",
    urlStub.dev = "",
    urlStub.prod = "",
    mode = factor(x = integer(), levels = c("development", "production"))
  ),
  
  public = list(
    initialize = function(){
      
    },
    toString = function(){
      
    },
    #make set functions for each thingy in private
    #make get functions for each thingy in private
  )
)




