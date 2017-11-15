#function can bee seen by ald nodes in the fork cluster

test <- function(i){
sqrt(i)
}

#make a fork cluster with 4 nodes
#clu <- makeCluster(type="FORK",2)
#parSapply(clu, c(100, 200,300,400), test)

clu <- makeCluster(type="FORK",2)


parSapply(clu, c(100, 200), test)


stopCluster(clu)

