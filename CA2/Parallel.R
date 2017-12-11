library(parallel)
library(RSQLite)

#print (getwd())

#define funcs
days <- 3 
args = commandArgs(trailingOnly = TRUE)
if (length(args) == 1)
{
  print("args provided")
  days <- args[1]
}
print(sprintf("days parameter has value %s", days))

stockNames <- c("AAPL","GOOG","ORCL","INTC","SYMC","FB","CSCO","XRX","IBM","MSFT")

#1. calculate stocks average for N days...
conSQLite <- dbConnect(RSQLite::SQLite(), dbname="stocks.sqlite")
avgQuery <- sprintf("SELECT AVG(gain) FROM stock_gains WHERE day <= %s", days)
stocksAvgGain  <- dbGetQuery(conSQLite, avgQuery)
print(sprintf("average gains for %s days is %s", days, stocksAvgGain))
dbDisconnect(conSQLite)


#Main Function to process stock
processStock <- function(stockName){
  conn <- dbConnect(RSQLite::SQLite(), dbname="stocks.sqlite")
  stockQuery <- sprintf("SELECT AVG(gain) from stock_gains where day <= %s AND stock='%s'", days, stockName)
  stockAvgGain <- dbGetQuery(conn, stockQuery)
  #print(sprintf("Average gain for stock %s in %s days is %s", stockName, days, stockAvgGain))
  dbDisconnect(conn)
  if(stockAvgGain > stocksAvgGain){print(sprintf("Stock %s  gains is higher than avg. Invest, Invest!", stockName))}
}
coreNumber <- detectCores()

#cluType <- "FORK"
#cluType <- "PSOCK"

clu <- makeCluster(coreNumber[1], outfile = "")
#pass the variables
clusterExport(cl = clu, varlist=c("days","stocksAvgGain"))
#load SqlLite on nodes
clusterCall(clu,function(){library(RSQLite)})
#apply the function
parSapply(clu, stockNames, processStock)


stopCluster(clu)



