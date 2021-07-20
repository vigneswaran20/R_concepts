#Exploratory data analysis are usually done at two different  stages
#One is towards the beginning , Before we undertake or select a proper
#statistical approach  or statistical modeling it's a good idea to do and 
#understand what the variables are 
##How they are behaving over graphs and charts to get a better understanding to choose the 
#right method


#checking model assumptions , whether the normality is being followed 
#properly or not



'Data Visuaization Process'
'1. Understand the context'
'2. Choose an appropriate visualization'
'3. Eliminate Clutter'
'4. Focus attention where you want it'
'5. Think like a designer'
'6. Tell a story'


'1. Show comparisons, contrasts and differences'
'2. Show causality , mechanism '
'3. Show multivariate data'
'4. Completely integrate words, numbers, images, diagrams when needed'
'5. Provide a detailed title'


#What to look for in plot ?
'1. Outliers'
'2. Asymmetry of the distribution'
'3. Changes in variability'
'4. Clustering'
'5. Non-linearity'



'For Univariate histogram is the appropriate method'




'Grammar of Graphics'
'1. Data'
'2. Aesthetics'
'3. Geometry'
'4. Facets'
'5. Statistics'
'6. Coordinates'
'7. Themes'




library(DAAG)
library(MASS)
library(dplyr)
library(ggplot2)
library(ggExtra)
library(corrplot)
library(psych)


data('possum')
str(possum)
summary(possum)


#Basics of dplyr package:- 

#Select
possum %>% select(1:3, 9, 10:13)
data1 <- possum %>% select(1:3, 9, 10:13)


#Filter
possum %>% filter(sex == 'f')

#Arrange
possum %>% filter(sex == 'f') %>% arrange(desc(belly))


#Summarize
possum %>% filter(sex == "f") %>% summarize(Avg = mean(belly), s = sd(belly), count = n())

##Group by
possum %>% filter(sex == "f") %>% group_by(site) %>% summarize(Avg = mean(belly), s = sd(belly), count = n()) %>%  arrange(desc(s))


#Mutate
possum %>%  group_by(site) %>% summarize(TR = sum(taill)/sum(totlngth), count = n()) %>%  arrange(desc(TR))


##ggplots

#Histogram

possum %>% ggplot(aes(x = totlngth)) + geom_histogram() + ggtitle('Distribution of total length', 'Source: DAAG package')

#fill
possum %>% ggplot(aes(x = totlngth, fill=sex)) + geom_histogram() + ggtitle('Distribution of total length', 'Source: DAAG package')

#transparent
possum %>% ggplot(aes(x = totlngth, fill=sex)) + geom_histogram(alpha=0.5) + ggtitle('Distribution of total length', 'Source: DAAG package')

#Histogram - facet wrap
possum %>% ggplot(aes(x = totlngth, fill=sex)) + geom_histogram(alpha=0.5) + ggtitle('Distribution of total length', 'Source: DAAG package') + facet_wrap(~sex)

possum %>% ggplot(aes(x = totlngth, fill=sex)) + geom_histogram(alpha=0.5) + ggtitle('Distribution of total length', 'Source: DAAG package') + facet_wrap(~site) 

#Themes
possum %>% ggplot(aes(x = totlngth, fill=sex)) + geom_histogram(alpha=0.5) + ggtitle('Distribution of total length', 'Source: DAAG package') + facet_wrap(~site) + theme_bw()

#Grid
possum %>% ggplot(aes(x = totlngth, fill=sex)) + geom_histogram(alpha=0.5) + ggtitle('Distribution of total length', 'Source: DAAG package') + facet_grid(vars(sex), vars(site)) + theme_bw()
possum %>% ggplot(aes(x = totlngth, fill=sex)) + geom_histogram(alpha=0.5) + ggtitle('Distribution of total length', 'Source: DAAG package') + facet_grid(cols= vars(site)) + theme_bw()
possum %>% ggplot(aes(x = totlngth, fill=sex)) + geom_histogram(alpha=0.5) + ggtitle('Distribution of total length', 'Source: DAAG package') + facet_grid(rows=vars(site)) + theme_bw()


#Density

possum %>% ggplot(aes(x = totlngth, fill=sex)) + geom_density(alpha=0.5) + ggtitle('Distribution of total length', 'Source: DAAG package') + facet_grid(rows=vars(site)) + theme_bw()


#Histogram + Density

possum %>% ggplot(aes(x = totlngth, fill=sex)) + geom_histogram(alpha = 0.5) + geom_density(alpha=0.5) + ggtitle('Distribution of total length', 'Source: DAAG package') + facet_grid(rows=vars(site)) + theme_bw()

#density plots are between 0 and 1 , so we are not able to see it here. We need to add few things

possum %>% ggplot(aes(x = totlngth, fill=sex)) + geom_histogram(alpha = 0.5) + geom_density(alpha=0.3, aes(y = 6*..count..)) + ggtitle('Distribution of total length', 'Source: DAAG package') + facet_grid(rows=vars(site)) + theme_bw()

#scatter-plot
possum %>% ggplot(aes(x = taill, y = totlngth)) + geom_point()
possum %>% ggplot(aes(x = taill, y = totlngth)) + geom_point(color = "blue") + geom_smooth()

#By default it uses a method called "loess" , it tries to capture non-linearity
#If you don't want the interval band or standard error around this line , you can say se=0
#That will only leave the line

possum %>% ggplot(aes(x = taill, y = totlngth)) + geom_point(color = "blue") + geom_smooth(se=0)


#Even the line you can choose a method. Let's say you want the line based on linear model

possum %>% ggplot(aes(x = taill, y = totlngth)) + geom_point(color = "blue") + geom_smooth(se=0, method = "lm")


#Scatter plot with 2 trend lines

'Suppose you want to color those as per sex variable'
possum %>% ggplot(aes(x = taill, y = totlngth, col = sex, size = eye)) + geom_point(color = "blue") + geom_smooth(se=0, method = "lm")


#As you start add more variables into the mix it will make sense to add a facet graph and represent them individually 
possum %>% ggplot(aes(x = taill, y = totlngth, col = sex, size = eye)) + geom_point(color = "blue") + geom_smooth(se=0, method = "lm") + facet_wrap(~ sex)
possum %>% ggplot(aes(x = taill, y = totlngth, col = sex, size = eye)) + geom_point(color = "blue") + geom_smooth(se=0, method = "lm") + facet_wrap(~ site)



#Scatter plot with log scale
?Animals
ggplot(Animals, aes(x = body, y = brain)) + geom_point()

#Whenever there is a dataset where the values range in a big way, you have very small values to 
#very huge numbers your plots may not give a very useful information so that's what log transformation helps

ggplot(Animals, aes(x = body, y = brain)) + geom_point() + scale_x_log10() + scale_y_log10()


#The patterns get much better visibility using log scale 


#Bar Plot

new <- possum %>%  group_by(site) %>% summarize(TR = sum(taill)/sum(totlngth), count = n()) %>%  arrange(desc(TR))

ggplot(new, aes(x = factor(site), y = TR, fill = site)) + geom_col()

#You can flip the bars for better visibility 
ggplot(new, aes(x = factor(site), y = TR, fill = site)) + geom_col() + coord_flip()


# Box plot
possum %>% ggplot(aes(x=sex, y = chest, col = sex)) +geom_boxplot()

# Box plot - interaction 
possum %>% ggplot(aes(x= interaction(sex, site), y = chest, col = sex)) +geom_boxplot()


# Plot
cuckoos

ggplot(cuckoos, aes(x = length, y = species) ) + geom_point()
ggplot(cuckoos, aes(x = length, y = species) ) + geom_boxplot()


'Reading boxplot'
#The boxes
#Start with the boxes. They represent the interquartile range, or the middle half of the values in each group. If two boxes do not overlap with one another, say, box A is completely above or below box B,
#then there is a difference between the two groups.

#Non-overlapping boxes, groups are different.

#The middle lines
#These are the medians, the “middle” values of each group. If the median line of box A lies outside of box B entirely, then there is likely to be a difference between the two groups.

#The whiskers:-  

#The lines coming out from each box extend from the maximum to the minimum values of each set. Together with the box, the whiskers show how big a range there is between those two extremes. Larger ranges indicate wider distribution, that is, more scattered data.

#The same thing can be said about the boxes. Short boxes mean their data points consistently hover around the center values. Taller boxes imply more variable data. That’s something to look for when comparing box plots, especially when the medians are similar.

#When there are outliers, they are dotted outside the whiskers. Not all datasets have outliers. Data points have to go above or below the box pretty far to count as outliers. How far? 1.5 times the size of the box.


#Marginal plot

p <- possum %>% ggplot(aes(x = taill, y = totlngth)) + geom_point(color = "blue") + geom_smooth(se=0, method = "lm") 
ggMarginal(p, fill = 'pink')
ggMarginal(p, fill = 'pink', type = 'histogram')
