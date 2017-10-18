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



doboxplots <- function (){
 boxplot(athletes$Ht ~ athletes$Sex + athletes$Sport)
# plotting height by pairs (gender and sport)
}

#pass in the M/F indicator and return the mean height for the Sex
calcmeanHt <- function (gender) {
	#calc the mean height for the subset where sex = MorF
	subdata <- subset(athletes, Sex==gender)
	mean <- mean(subdata$Ht)

}

doboxplots()
print (calcmeanHt("M"))
