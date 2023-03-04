#Question 8.6
#8.6.1
library(alr4)
data(Wool)
flen <- as.factor(Wool$len)
famp <- as.factor(Wool$amp)
fload <- as.factor(Wool$load)
cycles <- Wool$cycles
m1 <- cycles~flen+famp+fload
pairs(m1)

#8.6.2
m2 <- lm(cycles~flen+famp+fload+flen:famp+flen:fload+famp:fload)
plot(effect("famp:fload",m2),grid=T,multiline=T)

#8.6.3
boxCox(m1)

#8.6.4
m3 <- lm(log(cycles)~flen+famp+fload)
m4 <- lm(log(cycles)~flen+famp+fload+flen:famp+flen:fload+famp:fload)
anova(m3,m4)
plot(effect("flen:famp",m4),grid=T,multiline=T)
plot(effect("flen:famp",m2),grid=T,multiline=T)

#Question 10.1
#10.1.1
data(MinnWater)
m5 <- lm(log(irrUse)~agPrecip+year+log(statePop),data = MinnWater)
(1/vif(m5)-1)*-1

#10.1.2
data(UN11)
m6 <- lm(lifeExpF~log(ppgdp)+fertility+pctUrban,data = UN11)
vif(m6)

#Question 10.3
library(MASS)
data(mantel)
stepAIC(lm(Y~1,data=mantel),scope="~X1+X2+X3",direction = "forward")
stepAIC(lm(Y~X1+X2+X3,data=mantel),scope="~1",direction = "backward")
BIC(lm(Y~1,data=mantel))
BIC(lm(Y~X1,data=mantel))
BIC(lm(Y~X2,data=mantel))
BIC(lm(Y~X3,data=mantel))
BIC(lm(Y~X1+X2,data=mantel))
BIC(lm(Y~X1+X3,data=mantel))
BIC(lm(Y~X2+X3,data=mantel))
BIC(lm(Y~X1+X2+X3,data=mantel))
