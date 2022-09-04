### Example: Caching the Mean of a Vector

makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}

vector <- makeVector(c(1,2,4))
media <- cachemean(vector)
media <- cachemean(vector)


## Asignment

source("cachematrix.R")

m <- matrix(1:4, 2, 2)
cacheMatrix <- makeCacheMatrix(m)
cacheSolve(cacheMatrix)
