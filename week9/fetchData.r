#library(RSQLite)

conSQLite <- dbConnect(RSQLite::SQLite(), dbname="athletes.sqlite")

resultsHandle <- dbSendQuery(conSQLite, "select ht from athletes_table")

d <- fetch(resultsHandle, n=20)

#calculateMean(d)

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


