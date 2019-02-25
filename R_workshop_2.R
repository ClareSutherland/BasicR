# ------------------------------------------------------------------------------
# Author: Clare Sutherland, from an original script by Yong Zhi Foo
# Date: 21.02.19
#
# Script for sorting, analysing and plotting data
# -------|---------|---------|---------|---------|---------|---------|---------|

#------------Starting setup------------

#installing packages (if you haven't already- only need to do this once)
#install.packages('psych')
#install.packages('ggplot2')
#install.packages('car')

# Loading packages
library(ggplot2)
library(psych)
#library(car)

#Setting the directory
#Remember that this code assumes that the data are in the same folder as this script
dir.name <- dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(dir.name)
# Show the current location to check it's OK
getwd()

#------------Loading data and descriptive statistics------------
  
#Loading data
DuckData <- read.csv("DuckGroups.csv", header = TRUE, na.strings = "")
str(DuckData)

#Descriptive Stats
describe(DuckData$DuckCategPerform)
describeBy(DuckData$DuckCategPerform, group = DuckData$Group)
describeBy(DuckData$DuckCategPerform, group = DuckData$Group, mat = TRUE)

#Test yourself!!! Write the code to generate the descriptive statistics for Phobiascore by Group below this line :)

#------------Inferential statistics------------

#T-Test: do phobia and non-phobia groups differ in categorisation performance?
t.test(DuckCategPerform ~ Group, data = DuckData, var.equal = TRUE)

#Note that you need to run Levene's test seperately. 
#Levene's test is in the package "car" so you need to install car first and then load car into your script.
#leveneTest(DuckData$DuckCategPerform, DuckData$Group)
#If Levene's test is sig, change var.equal = FALSE in the ttest code and rerun ttest.
#t.test(DuckCategPerform ~ Group, data = DuckData, var.equal = FALSE)

#Correlation: Is phobia score correlated with categorisation performance in duck phobic people?
#Note we first need to pull out only the people who have a phobia.
DuckPhobicPeople <- DuckData[DuckData$Group == ("DuckPhobic"),]
cor.test(DuckPhobicPeople$DuckCategPerform, DuckPhobicPeople$Phobiascore, method = "pearson")

#Regression: Is does phobia score predict categorisation performance in duck phobic people?
#In this bit of code, we also save the regression and then we can refer to it later. You can do the same for ttests and correlations too.
regresults <- lm(DuckCategPerform ~ Phobiascore, data = DuckPhobicPeople)
summary(regresults)

#------------Plotting figures------------

#Graphs
#Boxplot for Group differences in Duck Categorisation Performance
ggplot(DuckData, aes(Group,DuckCategPerform)) + geom_boxplot() + xlab("Duck Phobia Group") + ylab("Categorisation Performance")

#Scatterplot for the relationship between Phobiascore and Duck Categorisation Performance in Duck Phobic People
ggplot(DuckPhobicPeople, aes(DuckCategPerform, Phobiascore)) + geom_point() + xlab("Categorisation score") + ylab("Phobia Score")
