
library(MASS)
library(quantmod)
library(PerformanceAnalytics)

#Making normal distribution in R 

x <- seq(10,30, 0.1)
plot(x, dnorm(x, 20, 3), type = "l")




#Slide-1
#Problem 1

1-pnorm(30, 25, 4)  # P(X>30)
 
qnorm(.2,25,4)


#By default it's left side , if we need to go to the right we go 1-pnorm()

#Problem 2
qnorm(.25,100,15)
qnorm(.90,100,15)

pnorm(125,100,15)

1-pnorm(110,100,15)


library(BSDA)


zsum.test(mean.x=1.45, sigma.x=0.32,n.x=45,conf.level=0.95)
zsum.test(mean.x = 92,
          sigma.x = 4.7,
          n.x = 23,mu=93,conf.level = 0.95,alternative = 'less')


tsum.test(mean.x=52746, s.x=9528,n.x=57, conf.level = 0.95)

tsum.test(mean.x = 154, s.x = 17.54, n.x = 160, mu=150,alternative = 'greater')


zsum.test(n.x = 36, mean.x = 34.2,sigma.x = 3.9,n.y = 30, mean.y = 32.7,sigma.y = 4)

tsum.test(n.x=100, mean.x=26400, s.x=1200,n.y=100, mean.y=25100, s.y=1400, alternative = 'greater')


getSymbols('AAPL', from = "2019-01-01", to="2020-12-31")
chartSeries(AAPL)

chartSeries(AAPL['2019-12'])

chartSeries(AAPL['2020-12'])


return <- CalculateReturns(AAPL$AAPL.Close)
return<-return[-1]
View(return)
hist(return['2019'])
hist(return['2020'])
var.test(return['2019'], return['2020'])



chisq.test(caith)
mtcars$cyl<- as.factor(mtcars$cyl)
mtcars %>% ggplot(aes(x=cyl, y=mpg, col=cyl)) + geom_boxplot()
a<-aov(mpg ~ cyl, mtcars)
anova(a)
library(gplots)
plotmeans(mpg~cyl, mtcars, main='95% CI')



