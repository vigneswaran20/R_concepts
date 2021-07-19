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

