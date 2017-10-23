female <- 1
male <- 0
#-----------------
#EXERCISE 1:
#Correlation coefficient for female basketball players WT & BMI
#-----------------

athletes <- read.table('../../athletes.txt', header=TRUE, sep =',')

#print summary(athletes$Sport)
#print summary(athletes$Wt)

#femaleBballPlayers <- athletes[athletes$Sport == "b_ball" & athletes$Sex=="1",]
femaleBballPlayers <- athletes[athletes$Sport == "b_ball" & athletes$Sex==female,]

femaleBballPlayersWt <- femaleBballPlayers$Wt
femaleBballPlayersBmi <- femaleBballPlayers$BMI

#print (femaleBballPlayersWt)
#print (femaleBballPlayersBmi)

ex1Correlation <- cor(femaleBballPlayersWt, femaleBballPlayersBmi)
print (ex1Correlation)
#ex1Correlation = 0.6968244
#They have a strong positive correlation as the value is greater than 0, closer to 1 than to 0.




#Question: Is  efficiency the same when assigning variables vs querying at runtime?

#i.e. 1. variables:  cor(femaleBballPlayersWt, femaleBballPlayersBmi)
#VS
#i.e. 2. runtime query:  cor(femaleBballPlayers$Wt, femaleBballPlayers$BMI)

#Or same question, is the IDE allocating this objects in memory when variables are assigned?


#-----------------
#EXERCISE 2:
#Correlation coefficient for male basketball players WT & BMI
#-----------------

#maleTennisPlayers <- athletes[athletes$Sport == "tennis" & athletes$Sex==male,]
maleTennisPlayers <- athletes[athletes$Sex==male,]

maleX <- maleTennisPlayers$Ht
maleY <- maleTennisPlayers$Bfat

ex2Correlation <- cor(maleX, maleY)
print (ex2Correlation)
#ex2Correlation = -0.9496761

#There is a very direct negative correlation between height and body fat, even stronger than in the first case, as the value is very close to -1
# this means the higher the players are, the less body fat they have


#As the samples we have are very low in numbers, i removed the "sport=tennis" filter, and ran the correlation again. This time I got a value of 0.1923817
#As this time the value is closer to 0, this may indicate there are not enough values (just 4) to produce a reliable correlation?




