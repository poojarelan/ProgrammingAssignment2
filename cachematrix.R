## Put comments here that give an overall description of what your
## functions do

## This function, makeMatrix creates a  "matrix", which is list containing a functions

##set the value of the matrix
##get the value of the matrix
##set the value of the inverse
##get the value of the inverse

makeMatrix <- function(x = matrix()){
  i <- NULL
  set <- function(y){
    x<<- y
    i<<- NULL
  }
  get<- function()x
  setinv <- function(inverse) i<<- inverse
  getinv <- function() i
  list(set =set,get = get, setinv = setinv, getinv = getinv)
}
x = makeMatrix(matrix(c(2,3,5,6),nrow = 2,ncol =2))
x$get()


## The following function calculates the inverse of the special "matrix" created with the above function.
## However, it first checks to see if the inverse has already been calculated. If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setinv function.

cacheSolve <- function(x, ...) {
  i <- x$getinv()
  if(!is.null(i)) {
    message("getting cached data.")
    return(i)
  }
  data <- x$get()
  i <- solve(data)
  x$setinv(i)
  i
}

cacheSolve(x)
