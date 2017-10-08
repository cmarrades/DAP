#load the athletes data

athletes <- read.table('../athletes.txt', header=T, sep=",")

#replace 0 and 1 with M and F
athletes$Sex <- factor(as.factor(athletes$Sex), label=c("M","F"))

#discover outliers in the data in the height colum
#use boxplot
#filter the data and look for outliers for F basketball players
#this means subset the data

boxplot(athletes$Ht)
#subset is like Sql SELECT, first parameters is full dataset 
#second is the filters (Sport is bball and sex is Female

with(subset(athletes, Sport=="b_ball" & Sex=="F"), boxplot(Ht))

#equivalent
#subdata <-subset(athletes, Sport=="b_ball", &	Sex=="F")
#boxplot(subset)	
