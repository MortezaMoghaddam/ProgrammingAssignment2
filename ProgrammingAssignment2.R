## By this function we can create a matrix  
makeCacheMatrix <- function(x = matrix()) {
               q<-NULL
setMatrix<-function(y){
        x<<-y
        q<<-NULL
}
## Now we set and get a value for Matrix, and again set and get a value for the inverse matrix
getMatrix<-function() x
setSolve<-function(solve) q<<- solve
getSolve<-function() q
list(setMatrix=setMatrix, getMatrix=getMatrix,
    setSolve=setSolve,
    getSolve=getSolve)
}
## Function to calculate inverse of Matrix 
## First we check if the inverse matrix is already there or not, if yes--> Get it, skip the next steps,if No--> calculate the inverse.  
cacheSolve <- function(x=matrix(),...) {
m<-x$getSolve()
if(!is.null(q)){
message("getting cached data")
return(m)
}
  
Mat<-x$get()
q<-solve(Mat)
x$setSolve(q)
q
## To Test 
b <- makeCacheMatrix( matrix(c(4,8,12,20,11,10), nrow = 3, ncol = 3) )
b$getMatrix()
cacheSolve(b)
## to get the cache
cacheSolve(b)
  
}