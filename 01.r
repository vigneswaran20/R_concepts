# Patterned Data

seq(from = 5, to = 25, by =4)
rep(c(2,3,5),3)
c(rep('F',3), rep('M',2))


# Data Frame

g <- c(95, 100, 75, 85, 90)
n <- c('Ana','Sam','Ash','Beth','Don')

mydata <- data.frame(n, g)
mydata


# Functions
names(mydata) <- c('Name','Grade')
mydata
str(mydata)
dim(mydata)
summary(mydata)


#Data and functions 
data()
data('iris')
str(iris)
tail(iris)
head(iris,3)
summary(iris)
sd(iris$Sepal.Length)


#Pie chart
tab <- table(iris$Species)
tab
pie(tab)


#Bar plot
barplot(tab, main = "Bar Plot for Species", col=rainbow(3), ylab = 'Count')

iris$Sepal.Length

#Histogram
hist(iris$Sepal.Length)

hist(iris$Sepal.Length, col='green', breaks = 20,  xlab = "Sepal Length")
?hist

#Scatter Plot
str(iris)
plot(Sepal.Length ~ Sepal.Width, iris)
pairs(iris[-5])


# Libraries 
library(psych)
pairs.panels(iris[-5], cor.cox = 0.5)

?pairs.panels


#library
install.packages("DAAG")
library(DAAG)
data('rainforest')
str(rainforest)

# Missing data
summary(rainforest)
mean(rainforest$wood) #Even if there is one missing value you won't get mean

mean(rainforest$wood, na.rm = T) #Now I can calculate mean 


data('science')
str(science)
summary(science)
science
science[!complete.cases(science),]  #Of all the data it will only list the NA's for variables

#Handling missing data
'if the NAs are very less then we can remove it '
dim(science)

new <- na.omit(science)
dim(new)

summary(new)
