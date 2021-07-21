
#Simpson's paradox

#Simpsons Paradox: Two HR Examples

library(dplyr)
library(ggplot2)
library(scales)
alpha = 0.5
set.seed(123)
n = 1000


Neuroticism = rnorm(n)
range(Neuroticism)

2.919474 * 0.1
#Neuroticism is the trait disposition to experience negative affects, including anger, anxiety, self‐consciousness, irritability, emotional instability, and depression1
Performance = rnorm(n) + Neuroticism  * 0.1

range(Performance)
#Neuroticism is like 10% of the population 
Performance = rescale(Performance, to = c(0, 100))
Neuroticism = rescale(Neuroticism, to = c(0, 7))
data <- data.frame(
  Performance,
  Neuroticism
)
data


options = c("Technical","Service")
technical = 
  (data$Performance > mean(data$Performance) & 
     data$Neuroticism > mean(data$Neuroticism)) |
  (data$Performance < mean(data$Performance) & 
     data$Neuroticism < mean(data$Neuroticism))

head(technical)


data$Job[technical] <- sample(options, sum(technical), T, c(0.6, 0.2))
data$Job[is.na(data$Job)] <- sample(options, sum(is.na(data$Job)), T, c(0.2, 0.8))





p <- data %>% ggplot(aes(Neuroticism, Performance)) 
p + geom_point(alpha = alpha) + geom_smooth(method = 'lm')


p +
  geom_point(aes(col = Job), alpha = alpha) + 
  geom_smooth(aes(col = Job), method = 'lm') +
  theme(legend.background = element_rect(fill = "transparent"),
        legend.justification = c(0, 1),
        legend.position = c(0, 1))



'Taking a closer look at the subgroups in your data, you might however find very different relationships.
For instance, the positive relationship between neuroticism and performance may only apply to technical positions, but not to those employees’ in service-oriented jobs.'



set.seed(123)
n = 1000

Education = rbinom(n, 2, 0.5)

Neuroticism = rnorm(n) + Education


Salary = Education * 2 + rnorm(n) - Neuroticism * 0.3

Salary
Salary = sample(10000:11000,1) + rescale(Salary, to = c(0, 100000))
Neuroticism = rescale(Neuroticism, to = c(0, 7))

Education = factor(Education, labels = c("Low", "Medium", "High"))
data <- data.frame(
  Salary,
  Neuroticism,
  Education
)

data
p <- data %>% ggplot(aes(Neuroticism, Salary)) 
p + geom_point(alpha = alpha) + geom_smooth(method = 'lm')

p + 
  geom_point(aes(col = Education), alpha = alpha) + 
  geom_smooth(aes(col = Education), method = 'lm') +
  theme(legend.background = element_rect(fill = "transparent"),
        legend.justification = c(0, 1),
        legend.position = c(0, 1))


'Similarly, splitting the employees by education level, 
it becomes clear that there is a relationship between neuroticism and education 
level that may explain the earlier association with salary. 
More educated employees receive higher salaries and within these groups,
neuroticism is actually related to lower yearly income.'



library(DAAG)
library(ggplot2)


#Roller data
str(roller)
ggplot(roller, aes(x= weight, y=depression)) + geom_point()

#Scatter Plot
ggplot(roller, aes(x=weight, y=depression)) + geom_point()+geom_smooth(method = "lm") + ggtitle('Depression Vs Weight', 'Source: Roller data  from DAAG')

##Linear model
model <- lm(depression ~ weight, roller)
summary(model)
names(model)

#The difference between  the observed value of the dependent variable (y) and the predicted value (ŷ) is called the residual (e). Each data point has one residual. 
'Residual Values (Residuals) in Regression Analysis
Positive if they are above the regression line,
Negative if they are below the regression line,
Zero if the regression line actually passes through the point'

#A residual value is a measure of how much a regression line vertically misses a data point.


coef(model)
residuals(model)
roller[1,]
fitted.values(model)
2-2.979669


#Diagnostics
par(mfrow = c(2,2))
plot(model)
dev.off()

#Prediction
predict(model, 
        data.frame(weight = c(7,8,9)),
        interval = "confidence")


predict(model, 
        data.frame(weight = c(7,8,9)),
        interval = "prediction")

##If the context is about single value we should use prediction
#if the context is about average of certain value we should use confidence


#Scatter Plot

p <- predict(model, interval = "prediction")

data <- cbind(roller, p)
str(data)
ggplot(data, aes(x=weight, y=depression)) + geom_point()+geom_smooth(method = "lm") + ggtitle('Depression Vs Weight', 'Source: Roller data  from DAAG')  + 
  geom_line(aes(y= lwr), color = "red", linetype = "dashed", lwd = 2) + geom_line(aes(y= upr), color = "red", linetype = "dashed", lwd = 2)


#Quadratic term

model1 <- lm(depression ~ weight + I(weight^2), roller)
summary(model1)


#CLT
library(TeachingDemos)
clt.examp(1)
clt.examp(10)
clt.examp(30)


#Normality
x <- rnorm(1000)
qqnorm(x, col="green")
qqline(x, col="red")
