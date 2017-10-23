athletes <- read.table('/home/epa/DAP/athletes.txt', header=", sep =',')

#print summary stats of the athletes weight

#obrienbeta@gmail.com

#print (summary(athletes$Wt))

#filter the data looking for w_polo

wpolo <- athlete[athletes$Sport=="w_polo",]
wpolo_men <- wpolo[wpolo$Sex==0,]

wpolo <- athletes[athletes$Sport=="w_polo" & athletes&Sex=="0",]

print (summary(wpolo))
#subset(athletes, Sex==0 & Sport=="w_polo")

#EXERCISE
# Upload your outlier script calculating the correlation coefficient
#for 
#1.female basketball players WT & BMI

#2. Male tennis players any 2 appropiate variables





