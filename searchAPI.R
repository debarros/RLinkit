#searchAPI.R

# Paramters:
#   acct is the account object
#   handle is the curl handle object defined in the curl initializer code block
#   resource is the type of thing we are trying to do, such as search for schools
#   parameters is a list of the parameters passed to the search
searchAPI = function(acct, handle, resource, parameters = list()){
  
  #Determine the relative url
  url.relative = "/schools?verb=search" #this should be based on the actual resource needed using a table
  
  #add any additional paramters specific to the resource
  parameters = someFunction(parameters, resource)
  
  #determine the headers required
  
  httpheaders = c(Accept="application/xml",'Content-Type' = "application/xml")
  
  #make the URL
  url = URLbuilder(url.relative, acct, parameters) #get the url
  
  #retrieve it
  response = getURI(url.complete, httpheader = httpheaders, curl = handle)
  
  #parse it based on the the resource type
  ret = someOtherFunction(response, resource)
  
  return(ret)
}