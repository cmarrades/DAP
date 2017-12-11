#print (getwd())

#IMPORTS
library(RSQLite)


#define funcs
getNumberOfDays <- function(){
 args = commandArgs(trailingOnly = 0)
 print(args)
}


#Define global vars
days <- 5 
args = commandArgs(trailingOnly = TRUE)
if (length(args) != 0)
{
  print("1 arg")
  days <- args[1]
}
stockNames <- c("AAPL","GOOG","ORCL","INTC","SYMC","FB","CSCO","XRX","IBM","MSFT")

#1. calculate stocks average for N days...
conSQLite <- dbConnect(RSQLite::SQLite(), dbname="stocks.sqlite")
today <-  dbGetQuery(conSQLite, "SELECT MAX(Day) FROM stock_gains")
fromDay <- today-days
avgQuery <- sprintf("SELECT AVG(gain) FROM stock_gains WHERE day >= -%s", fromDay)
#avgSql <- dbSendQuery(conSQLite, avgQuery)
#stocksAvg <- fetch(avgSql)
stocksAvgGain  <- dbGetQuery(conSQLite, avgQuery)
  
print(sprintf("average gains for %s days is %s", days, stocksAvgGain))

#Function to calculate Stock Average
getStockAvgFunc <- function(stockName, fromDay, positiveFunc){
  stockQuery <- sprintf("SELECT AVG(gain) from stock_gains where day >= %s AND stock='%s'", fromDay, stockName)
  stockAvgGain <- dbGetQuery(conSQLite, stockQuery)
  print(sprintf("Average gain for stock %s in %s days is %s", stockName, days, stockAvgGain))
  return(positiveFunc(stockName, stockAvgGain))
}

#Function to pipe results of positive match
manageStockGainFunc <- function(stockName, stockAvgGain){
  if (stockAvgGain > stocksAvgGain)
  {
    return(stockName)
  }
}

printResultsPipe <- function(stockName){
  if (!is.null(stockName))
  {
    print(sprintf("Stock %s  gains is higher than avg. Invest, Invest!", stockName))  
  }
}

#2. iterate each stockIndex and get 
for (stockName in stockNames){
  result = getStockAvgFunc(stockName, fromDay, manageStockGainFunc) 
  printResultsPipe(result)
}





