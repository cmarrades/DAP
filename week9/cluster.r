#function can bee seen by ald nodes in the fork cluster

test <- function(i){
  print(sqrt(i))
}

#make a fork cluster with 4 nodes
#clu <- makeCluster(type="FORK",2)
cluType <- "FORK"


clu <-  makeCluster(2, outfile = "")

parSapply(clu, c(100, 200), test)
#sapply(c(100,200),test)

stopCluster(clu)

