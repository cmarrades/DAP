library(RSQLite)

conSQLite <- dbConnect(RSQLite::SQLite(), dbname="stocks.sqlite")

resultsHandle <- dbSendQuery(conSQLite, "select * from stock_gains")

 
d <- fetch(resultsHandle, n=20)

#calculateAverage(d)

iterateCalc <- function(){
	#chunk size = 20, number of chunks =10
	mean(sapply(rep(20,10), FUN=calcChunkHt))
}


spaguetiMonster <-function() {
	mean(sapply(rep(20,10),FUN= function(rows){ calcChunkHt2(rows, resultsHandle)}))

}

calcChunkHt <- function(numrows) {
results <- fetch(resultsHandle, n=numrows)   
 mean(results$Ht)
}

calcChunkHt2 <- function(numrows, qhandle) {
 y <- fetch(qhandle, n=numrows)
 mean(y$Ht)
}


