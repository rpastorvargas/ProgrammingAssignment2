# This function acts likes a class/object which stores a matrix and its inverse (cached with <<-)
# Attributtes:
# m represents the matrix
# inverse represents the inverse of the matrix
# Methods
# 4 functions are associated to the function (like a class/object in POO)
# get/set to get or retrieve the matrix
# getinverse/setinverse to get/retrieve the inverse of the matrix
makeCacheMatrix <- function(m = matrix()) {
  inverse <- NULL
  set <- function(x) {
    m <<- x
    inverse <<- NULL
  }
  get <- function() m
  setinverse <- function(inv) inverse <<- inv
  getinverse <- function() inverse
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## This function calculates the inverse of a matrix. 
# The matrix will be stored in a makeCacheMatrix object/function, so
# the first argument is the makeCacheMatrix function/object. The ... argument
# is not really used, but it can be used to pass parameteres 
# to the internal function (solve in this case)
# Arguments: 
# m represent the makeCacheMatrix function/object
# Returns
# The inverse of the stored matrix. If the inverse matrix was calculated before
# it's stored in cache and it can be got from the cache. In other case, a new
# computation of inverse will be do.
cacheSolve <- function(m, ...) {
  inverse_matrix <- m$getinverse()
  if(!is.null(inverse_matrix)) {
    message("Getting the inverse of matrix from cache (cached data)")
    return(inverse_matrix)
  }
  mm <- m$get()
  inverse_matrix <- solve(mm)
  message("Getting the inverse of matrix from calculated value (NO cached data)")
  m$setinverse(inverse_matrix)
  ## Return a matrix that is the inverse of 'm'
  inverse_matrix  
}
