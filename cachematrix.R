## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

##makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

##similar with sample but with different function.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}


## Write a short comment describing this function
##cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

##Computing the inverse of a square matrix can be done with the solve function in R. For example, if X is a square invertible matrix, then solve(X) returns its inverse.

##For this assignment, assume that the matrix supplied is always invertible.

##similar with sample but with different variable name.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}


## --------testing the script--------------
##matrix1 <-matrix(rnorm(25),5,5)
##test1 <-makeCacheMatrix(matrix1)
##cacheSolve(test1)
##[,1]       [,2]        [,3]       [,4]       [,5]
##[1,]  0.1200878  0.9924527 -0.46286109  0.8980849  0.4788494
##[2,]  1.3574800 -0.2394650  0.17078513  0.0497043  1.3407752
##[3,] -0.1590469 -0.4567613  0.10481876 -0.2566264 -1.0559550
##[4,] -0.9338045 -0.2240173  0.58652274 -0.8493696 -1.3804244
##[5,]  0.1244131 -0.3984104 -0.01811171 -0.5498928 -0.4734873

