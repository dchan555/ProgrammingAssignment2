## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}


## The functions create a special matrix that can keep 
## cache of the matrices data and its inverse

## makeCacheMatrix creates that "matrix" which is really a list
## containing a function to

## 1.  set the value of the matrix
## 2.  get the value of the matrix
## 3.  set the value of the inverse
## 4.  get the value of the inverse

makeCacheMatrix <- function(x = matrix()) { ## Creates a special matrix object that can cache its inverse
  inv <- NULL ## begins by setting the inverse to NULL as a placeholder for a future value
  set <- function(y) { ## defines a function to set the vector, x, to a new vector, y, and resets the inverse, inv, to NULL
    x <<- y
    inv <<- NULL 
  }
  get <- function() x ## get value of matrix
  set_inverse <- function(inverse) inv <<- inverse ## sets the inverse of matrix
  get_inverse <- function() inv ## get the inverse of matrix
  list(set = set, get = get, ## return a list containing all functions defined above
       set_inverse = set_inverse,
       get_inverse = get_inverse) 
}


## The following function calculates the inverse of the special "matrix"
## created with the above function. However, it first checks to see if the
## inverse has already been calculated. If so, it get`s the inverse from the
## cache and skips the computation. Otherwise, it calculates the inverse of
## the data and sets the value of the inverse in the cache via the `set_inverse`
## function.



cacheSolve <- function(x, ...) {
  inv <- x$get_inverse() ## get inverse
  if(!is.null(inv)) { ## if inverse exists, check if already cached
    message("getting cached data") 
    return(inv) ## if yes, return cached inverse
  }
  data <- x$get() ## if not, get matrix 
  inv <- solve(data, ...) ## compute inverse of matrix
  x$set_inverse(inv) ## cache inverse of matrix
  inv ## return inverse
}



