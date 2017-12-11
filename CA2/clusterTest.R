library(parallel)
library(RSQLite)
fromDay <- 85
days <- 5
stockNames <- c("AAPL","GOOG","ORCL","INTC","SYMC","FB","CSCO","XRX","IBM","MSFT")


processStockFunc <- function(stockName){
  conSQLite <- dbConnect(RSQLite::SQLite(), dbname="stocks.sqlite")
  stockQuery <- sprintf("SELECT AVG(gain) from stock_gains where day >= %s AND stock='%s'", fromDay, stockName)
  stockAvgGain <- dbGetQuery(conSQLite, stockQuery)
  dbDisconnect(conSQLite)
  
  print(sprintf("Average gain for stock %s in %s days is %s", stockName, days, stockAvgGain))
}

clu <- makeCluster(2, outfile = "")
clusterExport(cl = clu, varlist=c("fromDay","days"))
clusterCall(clu,function(){library(RSQLite)})
parSapply(clu, c("AAPL", "ORCL"), processStockFunc)

stopCluster(clu)
