# ------------------------------------------------------------------------------
# Author: Clare Sutherland
# Date: 21.02.19
#
# Script for loading data
# -------|---------|---------|---------|---------|---------|---------|---------|

# Tell R where to find your file (i.e. set working directory to current folder location)
dir.name <- dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(dir.name)
# Show the current location to check it's OK
getwd()


  #NB you can also manually set the current folder location. In this case, 
#replace the text in the quotation marks with your filepath.
#If you don't know the filepath, you can type file.choose() in the console to print the filepath into R
#setwd("/Users/00089951/Dropbox/RTWs/R workshop materials 2/RWorkshop1")

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

