# Coursera-Getting-and-Cleaning-Data
This file describes how run_analysis.R script works.

First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Make sure the extracted folder and the run_analysis.R script are both in the current working directory.
Second, use source("run_analysis.R") command in RStudio. 
Read Comments as they specified in the script each following step in detail. 
Finally, use data <- read.table("tidyMeans.txt") command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject. 
tidyMeans.txt (220 KB): it contains a data frame called cleanedData with output required. 
