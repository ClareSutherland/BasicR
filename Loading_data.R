#Get the current location of the R script
getwd()

#Change the current location so that it's in the same folder as the data
#NB replace the text in the quotation marks with your filepath
setwd("/Users/00089951 1/Dropbox/R workshop/RWorkshop1")

#If you don't know the filepath, type file.choose() in the console to print the filepath into R

#load a csv file called 'DuckGroups' into R
#csv file has a top row which holds the variable names (that's why headers = TRUE)
DuckData <- read.csv('DuckGroups.csv', header = TRUE)

#View the data
View(DuckData)

#Select columns (remove unwanted column with phobia scores). Keep all rows.
DuckCategorisationData <- DuckData[, c("Group","DuckCategPerform")]
View(DuckCategorisationData)

#Select rows (duck phobic people only). Keep all columns.
DuckPhobicPeople <- DuckData[DuckData$Group == ("DuckPhobic"),]
View(DuckPhobicPeople)

#Select rows (duck phobic people only) AND columns (phobia scores and categorisation data only)
RunningOutOfNamesNow <- DuckData[DuckData$Group == ("DuckPhobic"), c("Phobiascore","DuckCategPerform")]
View(RunningOutOfNamesNow)

