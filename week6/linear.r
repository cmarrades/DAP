athletes <- read.table('../athletes.txt', header=T, sep=",")

#replace 0 and 1 with M and F
athletes$Sex <- factor(as.factor(athletes$Sex), label=c("M","F"))

linmodWt <-with (athletes, lm(BMI~Wt))
linmodWtHt <-with (athletes, lm(BMI~Wt+Ht))

#hist(linmodWt$residuals)
hist(linmodWtHt$residuals)

x11()
