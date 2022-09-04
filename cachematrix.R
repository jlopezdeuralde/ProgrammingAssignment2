## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# Initializes a special matrix that is able to store its inverse
makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setInverse <- function(newInverse) inverse <<- newInverse
  getInverse <- function() inverse
  list(set = set, get = get, setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function
# Returns the inverse of a "special" matrix created with
# makeCacheMatrix. It uses the cached
# value if it is available and if not, it calculates it
# and stores it in the special matrix x
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse <- x$getInverse()
  if(!is.null(inverse)){
    message("getting cached inverse")
    return(inverse)
  }
  data <- x$get()
  inverse <- solve(data, ...)
  x$setInverse(inverse)
  inverse
}
