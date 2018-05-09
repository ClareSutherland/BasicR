#Starting setup
#Remember you will need to replace the filepath below with your own filepath
setwd("/Users/00089951 1/Dropbox/R workshop materials/RWorkshop2")
list.files()
library(ggplot2)
library(psych)

#Load data
DuckData <- read.csv("DuckGroups.csv", header = TRUE, na.strings = "")
str(DuckData)

#Descriptive Stats
describe(DuckData$DuckCategPerform)
describeBy(DuckData$DuckCategPerform, group = DuckData$Group)
describeBy(DuckData$DuckCategPerform, group = DuckData$Group, mat = TRUE)

#Test yourself!!! Write the code to generate the descriptive statistics for Phobiascore by Group below this line 

#T-Test: do phobia and non-phobia groups differ in categorisation performance?
t.test(DuckCategPerform ~ Group, data = DuckData, var.equal = TRUE)

#Correlation: Is phobia score correlated with categorisation performance in duck phobic people?
DuckPhobicPeople <- DuckData[DuckData$Group == ("DuckPhobic"),]
cor.test(DuckPhobicPeople$DuckCategPerform, DuckPhobicPeople$Phobiascore, method = "pearson")

#Regression: Is does phobia score predict categorisation performance in duck phobic people?
regresults <- lm(DuckCategPerform ~ Phobiascore, data = DuckPhobicPeople)
summary(regresults)

#Graphs
#Boxplot for Group differences in Duck Categorisation Performance
ggplot(DuckData, aes(Group,DuckCategPerform)) + geom_boxplot() + xlab("Duck Phobia Group") + ylab("Categorisation Performance")

#Scatterplot for the relationship between Phobiascore and Duck Categorisation Performance in Duck Phobic People
ggplot(DuckPhobicPeople, aes(DuckCategPerform, Phobiascore)) + geom_point() + xlab("Categorisation score") + ylab("Phobia Score")
