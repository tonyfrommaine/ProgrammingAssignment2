## This file contains two functions that when used together will 
## perform a matrix inversion.
## By using the first function makeCacheMatrix to create a special matrix
## and then the second function that only computes the inverse, the combined
## functions will perform more efficiently by using cached versions

## To use these functions
## 1. Populate a matrix that will need to be inversted.  This can be done using
##    the makeCacheMatrix function wit seed values such as
##    m <- makeCacheMatrix(matrix (c(1,2,3,4)), nrow=2, ncol=2)
## 2. Run the cacheSolve for that matrix, such as cachSolve(m)
##    Whether cached or not the invertedmatrix will be return
##    console message will indicate if cached version is being used or not
##3.  Populating a second 


## makeCacheMatrix is a function that creates a special matrix object
## the purpose of this object is to aid in caching

makeCacheMatrix <- function(x = numeric()) {
        
        ## cachedmatrix hold a cached matrix, but is set to NULL initially
        cachedmatrix <- NULL
        
        ## setmatrix will store the matrix, then resets cachedmatrix to NULL
        ## both use <<- purposely
        setmatrix <- function(y) {
                x <<- y
                cachedmatrix <<- NULL
        }
        
        # getmatrix is assigned from the setMatrix via the <<- x
        getmatrix <- function() {
                x
        }
        
        # cache the inverse from the cachedmatrix
        cacheinverse <- function(z) {
                cachedmatrix <<- z
        }
        
        # return the cached version via cachedmatrix
        getinverse <- function() {
                cachedmatrix
        }
        
        # return a list of the functions to used in subsquent function
        list(setmatrix = setmatrix, getmatrix = getmatrix, cacheinverse = cacheinverse, getinverse = getinverse)
}



## cacheSolve will take advantage of the makeCacheMatrix by computing
## the inverse, as the instructions state, it is assumed the passed matrix is
## invertible.
## If, though, the inverse has already been calculated 
## then it will utilize the cached version, thus minimizing recalculations

cacheSolve <- function(y, ...) {
       
        # first try to get the cached version
        inversematrix <- y$getinverse()
        # if so send a messaage to console and then return the value
        if(!is.null(inversematrix)) {
                message("cached version being used")
                return(inversematrix)
        }
        # if not, first calculate it then store it in the cace
        # the cache
        z <- y$getmatrix()
        inversematrix <- solve(z)
        y$cacheinverse(inversematrix)
        
        # return the inversed matrix as final result
        inversematrix
}


