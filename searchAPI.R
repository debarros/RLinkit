#searchAPI.R

# Parameters:
#   acct is the account object
#   handle is the curl handle object defined in the curl initializer code block
#   resource is the type of thing we are trying to do, such as search for schools
#   parameters is a list of the parameters passed to the search
searchAPI = function(acct, handle, resource, parameters = list()){
  
  #Determine the relative url
  url.resource = resources$URL[resources$resource == resource & resources$Function == "search"]
  
  #add any additional paramaters specific to the resource
  #parameters = someFunction(parameters, resource)
  
  #determine the headers required
  httpheaders = c(Accept=paste("application/", acct$mime, sep=""),'Content-Type' = paste("application/", acct$mime, sep=""))
  
  #make the URL
  url.complete = URLbuilder(url.resource, acct, parameters) #get the url
  
  #retrieve it
  response = getURI(url.complete, httpheader = httpheaders, curl = handle)
  
  #parse it based on the resource type
  ret = response
  #ret = someOtherFunction(response, resource)
  
  
  return(ret)
}