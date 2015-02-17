## This file contains two functions that when used together will 
## perform a matrix inversion.
## By using the first function makeCacheMatrix to create a special matrix
## and then the second function that only computes the inverse, the combined
## functions will perform more efficiently by using cached versions


## makeCacheMatrix is a function that creates a special matrix object
## the purpose of this object is to aid in caching

makeCacheMatrix <- function(x = matrix()) {

}


## cacheSolve will take advantage of the makeCacheMatrix by computing
## the inverse.  If, though, the inverse has already been calculated 
## then it will utilize the cached version, thus minimizing recalculations.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
