## A set of functions for solving a matrix, which
## caches the most recently solved matrix and solution

## file-scope variables to hold the cached matrices
cachedMatrix <- NULL;
cachedInverseMatrix <- NULL;

## caches the given matrix, solves it, caches the solution
## and returns the solution
makeCacheMatrix <- function(x = matrix())
{
    cachedMatrix <<- x;
    cachedInverseMatrix <<- solve(x);
    cachedInverseMatrix;
}

## returns a matrix which is the inverse of x. Caches
## the most recent result for faster access
cacheSolve <- function(x, ...)
{
    if (is.null(x))
    {
        stop("param x is null");
    }
    
    retval <- if (!is.null(cachedMatrix) && x == cachedMatrix)
    {
        cachedInverseMatrix;
    }
    else
    {
        makeCacheMatrix(x);
    }
    
    retval;
}
