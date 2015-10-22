## Simple script function to test the assigment 2 solution
## Usage:
## source("testcachedmatrix.R")
## testcachedmatrix() OR testcachedmatrix(n)
## where n represents the number of element in every column/row (square matrix)
testcachedmatrix <- function(n=1000) {
  # Load the R source which has the definition of functions makeCacheMatrix & cacheSolve
  source("cachematrix.R")
  # Create an square matrix of nxn 
  m <- matrix( rnorm(n*n), n)
  # Create the makeCacheMatrix object/function, storing the matrix
  cachedm <- makeCacheMatrix(m)
  # Test for the ibverse value (NULL, due to no calculation has be done)
  cachedm$getinverse() # returns NULL (no inverse was calculated yet)
  # First time the function is call, inverse is computed
  # We print the time used in calculation
  start.time <- Sys.time()
  minverse <- cacheSolve(cachedm)
  end.time <- Sys.time()
  time.taken <- end.time - start.time
  print(time.taken)
  # Second time, inverse is got from cache
  # Also, we print the time used in calculation but in this case, time will be
  # zero or a similar value
  start.time <- Sys.time()
  minverse <- cacheSolve(cachedm)
  end.time <- Sys.time()
  time.taken <- end.time - start.time
  print(time.taken)
}